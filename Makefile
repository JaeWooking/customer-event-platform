PROJECT_ID=elite-partition-240511
REGION=asia-northeast3
REPOSITORY=customer-event-platform
IMAGE_NAME=customer-api

IMAGE=$(REGION)-docker.pkg.dev/$(PROJECT_ID)/$(REPOSITORY)/$(IMAGE_NAME):latest

.PHONY: help


help:
	@echo "Available commands:"
	@echo "  make build"
	@echo "  make run"
	@echo "  make push"
	@echo "  make tf-init"
	@echo "  make tf-plan"
	@echo "  make tf-apply"

build:
	cd apps/api && docker build -t $(IMAGE_NAME) .

run:
	docker run -p 8080:8080 $(IMAGE_NAME)

push:
	docker tag $(IMAGE_NAME) $(IMAGE)
	docker push $(IMAGE)

tf-init:
	cd terraform && terraform init

tf-plan:
	cd terraform && terraform plan

tf-apply:
	cd terraform && terraform apply

docker-auth:
	gcloud auth configure-docker $(REGION)-docker.pkg.dev




# make init          ⭐ 개발환경 초기화
# make format        ⭐ terraform fmt + python format
# make lint          ⭐ 코드 검사
# make test          ⭐ API 테스트
# make build         ⭐ Docker Build
# make push          ⭐ Artifact Registry Push
# make tf-plan       ⭐ Terraform Plan
# make tf-apply      ⭐ Terraform Apply
# make deploy        ⭐ 전체 배포
# make destroy       ⭐ 전체 삭제