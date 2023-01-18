## How to deploy

(1) Install cdk
```
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

(2) Deploy cdk

```
cd cdk
cdk deploy
```

(3) Test Cloudformation JSON
```
cdk synth
```

(4) Destroy cdk
```
cdk destroy
```

### Roadmap

## Infraestructure
- [ ] add stages
- [ ] add ses emails and templates
- [ ] add step functions
- [ ] add sns and sqs
- [ ] add aws fargate for one-time scripts

## Fronted SPA
- [x] add angular sap
- [x] add tailwind
- [x] add story book
- [ ] Add Authorization (auth0)
- [ ] Add public/public profiles
- [ ] add icons
- [ ] Add CSP (lambda edge)
- [ ] add vue spa
- [ ] add fonts
- [ ] add colors
- [ ] add unit tests with jest
- [ ] add integration tests (cypress or codecepts)

## backend
- [ ] add NestJS
- [ ] add authorization layer (jwt)
- [ ] add code generation for api-gateway core-services (autogenerate services from apigw)
- [ ] add support x-request-id
- [ ] add logging
- [ ] add monitoring
- [ ] add tracing
- [ ] add error handling
- [ ] add follow 12factor
- [ ] add unit tests
- [ ] add integration tests
- [ ] add e2e tests
- [ ] add swagger
- [ ] add support to aws lambda
- [ ] add support aws fargate (docker)

## authentication
- [ ] add auth0 client with terrafom
- [ ] add auth0 API 
- [ ] add auth0 rules
- [ ] add auth0 universal login

## Frontend SSR (server side rendering)
- [ ] Using angular universal
- [ ] Using Nuxt
- [ ] Using Next

## Frontend Custom web components
- [ ] by angular element
- [ ] by vue

## Event Driven Architecture Examples
- [ ]  ....

## source
- https://auth0.com/blog/use-terraform-to-manage-your-auth0-configuration/
- https://12factor.net/

