### Source
- https://auth0.com/blog/use-terraform-to-manage-your-auth0-configuration/
- https://github.com/tfutils/tfenv
- https://auth0.com/docs/quickstart/webapp/express
- https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli


## How to start

(1)Create an Auth0 client using HashiCorp Terraform
https://auth0.com/blog/use-terraform-to-manage-your-auth0-configuration/#Create-an-Auth0-client-using-HashiCorp-Terraform

(2) Export variables

```
export TF_VAR_auth0_domain=<string>
export TF_VAR_auth0_client_id=<string>
export TF_VAR_auth0_client_secret=<string>
export TF_VAR_auth0_admin_user_password=<string>

```
  
(3) Install Terraform
```
tfenv install
tfenv use 1.3.7
terraform init
```
  
(4) yarn deploy

(5) yarn destroy