IMAGE ?= ghcr.io/$(shell echo $$GITHUB_REPOSITORY)/app-svc:dev

run:
	uvicorn src.main:app --host 0.0.0.0 --port 8080

build:
	docker build -t $(IMAGE) .

push:
	docker push $(IMAGE)

deploy:
	helm upgrade --install app-svc ./helm --namespace dev --create-namespace \
	  --set image.repository=$(shell echo $(IMAGE) | sed 's/:.*//') \
	  --set image.tag=$(shell echo $(IMAGE) | sed 's/.*://')
