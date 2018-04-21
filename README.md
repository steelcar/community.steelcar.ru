## Installation

### Install Amazon ECR Docker Credential Helper

https://github.com/awslabs/amazon-ecr-credential-helper

```bash
git clone https://github.com/awslabs/amazon-ecr-credential-helper.git
cd https://github.com/awslabs/amazon-ecr-credential-helper.git
make docker
sudo mv bin/local/docker-credential-ecr-login /usr/local/bin
```

Set the contents of your `~/.docker/config.json` file to be:
```
"credHelpers": {
    "794762089898.dkr.ecr.eu-west-1.amazonaws.com": "ecr-login"
}
```


## Scripts

start.sh [dev|prod]
release.sh [...modules]
