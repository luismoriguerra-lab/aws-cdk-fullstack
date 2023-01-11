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

## Roadmap
- [x] Add Fronted
> - [ ] Add CSP (lambda edge)
> - [ ] Add Authorization
> - [ ] Add public/public profiles
> - [ ] add story book
- [ ] add backend
> - [ ] add follow 12factor
> - [ ] add authorization layer (jwt)
- [ ] add CSP
- [ ] add ses emails and templates
- [ ] add fargate 
- [ ] add step functions
- [ ] add e2e test
- [ ] add github actions
- [ ] add stages
- [ ] add wiki page# aws-cdk-fullstack
# aws-cdk-fullstack
