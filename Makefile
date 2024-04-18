IMAGE_NAME=katproxy-env
TAG=latest
SHELL=/bin/bash

.PHONY: build run get-dependencies

clean:
	rm -rf katconf mkat-tango katcore katmisc katproxy katlogger katversion

get-dependencies: clean
	git clone --branch user/rebrahim/MT-4355/investigate-standalone-dish-proxy-py3 git@github.com:ska-sa/mkat-tango.git
	git clone --branch user/rebrahim/MT-4355/investigate-standalone-dish-proxy-py3-katconf git@github.com:ska-sa/katconf.git
	git clone git@github.com:ska-sa/katcore.git
	git clone --branch user/rebrahim/MT-4351/investigate-standalone-dish-proxy-py3 git@github.com:ska-sa/katmisc.git
	git clone git@github.com:ska-sa/katproxy.git
	git clone git@github.com:ska-sa/katlogger.git
	git clone git@github.com:ska-sa/katversion.git
	chmod +x setup.sh

build: get-dependencies
	docker build -t $(IMAGE_NAME):$(TAG) . 

run:
	docker run -it $(IMAGE_NAME) $(SHELL)