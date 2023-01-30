variable "auth0_domain" {}
variable "auth0_client_id" {}
variable "auth0_client_secret" {}
variable "auth0_admin_user_password" {}

variable "api-identifier" {
  type    = string
  default = "https://terraform-express-resource-server"
}


terraform {
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = ">= 0.34" # Refer to docs for latest version
    }
  }
}

provider "auth0" {
  domain        = var.auth0_domain
  client_id     = var.auth0_client_id
  client_secret = var.auth0_client_secret
}

/* https://registry.terraform.io/providers/auth0/auth0/latest/docs/resources/client */
resource "auth0_client" "terraform-secure-express" {
  name            = "Terraform Secure Express"
  description     = "App for running Dockerized Express application via Terraform"
  app_type        = "regular_web"
  callbacks       = ["http://localhost:3000/callback"]
  oidc_conformant = true

  jwt_configuration {
    alg = "RS256"
  }
  is_first_party = true
}

//https://registry.terraform.io/providers/auth0/auth0/latest/docs/resources/connection
resource "auth0_connection" "terraform-express-user-db" {
  name     = "terraform-express-user-db"
  strategy = "auth0"
  options {
    password_policy        = "good"
    brute_force_protection = true
  }
}

resource "auth0_connection_client" "connection-client-v1" {
  connection_id = auth0_connection.terraform-express-user-db.id
  client_id     = auth0_client.terraform-secure-express.id
}

resource "auth0_connection_client" "connection-client-v2" {
  connection_id = auth0_connection.terraform-express-user-db.id
  client_id     = var.auth0_client_id
}

/* https://registry.terraform.io/providers/auth0/auth0/latest/docs/resources/user */
resource "auth0_user" "admin-user" {
  connection_name = auth0_connection.terraform-express-user-db.name
  user_id         = "12345"
  email           = "admin@example.com"
  email_verified  = true
  password        = var.auth0_admin_user_password
  roles           = [auth0_role.admin-role.id]
}

resource "auth0_resource_server" "resource-server-api" {
  name                                            = "Resource Server API"
  identifier                                      = var.api-identifier
  skip_consent_for_verifiable_first_party_clients = true
  token_dialect                                   = "access_token_authz"
  enforce_policies                                = true

  scopes {
    value       = "create:note"
    description = "Only administrators can create notes"
  }

  scopes {
    value       = "read:note:self"
    description = "Read Own Notes"
  }

  scopes {
    value       = "read:note:all"
    description = "Administrators can read all notes"
  }
}

resource "auth0_role" "admin-role" {
  name        = "admin"
  description = "administrator"
  permissions {
    resource_server_identifier = auth0_resource_server.resource-server-api.identifier
    name                       = "create:note"
  }

  permissions {
    resource_server_identifier = auth0_resource_server.resource-server-api.identifier
    name                       = "read:note:all"
  }
}

resource "auth0_role" "basic-user-role" {
  name        = "basic_user"
  description = "Basic User"
  permissions {
    resource_server_identifier = auth0_resource_server.resource-server-api.identifier
    name                       = "read:note:self"
  }
}

resource "auth0_rule" "basic_user-rule" {
  name = "basic-user-role-assignment"
  script = templatefile("${path.module}/rules/basic-user-rule.js", {
    TERRAFORM_ROLE_ID : auth0_role.basic-user-role.id
  })
  enabled = true
}
