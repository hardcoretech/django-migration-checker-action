DMC_VERSION = "0.8.0"

IMAGE_NAME = hardcoretech/django-migration-checker
IMAGE_TAG ?= latest
IMAGE = $(IMAGE_NAME):$(IMAGE_TAG)

AWS_REGION ?= us-west-2
AWS_ACCOUNT_ID ?= xxxx
AWS_ECR_REPO = "$(AWS_ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com"


.PHONY: build push-to-aws-ecr push-to-docker-hub

build:
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) --build-arg="VERSION=$(DMC_VERSION)" --platform linux/amd64 .

push-to-aws-ecr: build
	aws ecr describe-repositories --repository-names $(IMAGE_NAME) > /dev/null 2>&1 || aws ecr create-repository --repository-name $(IMAGE_NAME)
	aws ecr get-login-password --region $(AWS_REGION) | docker login --username AWS --password-stdin $(AWS_ECR_REPO)

	docker tag $(IMAGE_NAME):$(IMAGE_TAG) ${AWS_ECR_REPO}/$(IMAGE_NAME):$(IMAGE_TAG)
	docker push ${AWS_ECR_REPO}/$(IMAGE_NAME):$(IMAGE_TAG)

push-to-docker-hub: build
	docker login
	docker push $(IMAGE_NAME):$(IMAGE_TAG)
