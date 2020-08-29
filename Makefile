build: check-env
	docker-compose run build

check-env:
ifndef ARCH 
	$(error ARCH is undefined)
endif
