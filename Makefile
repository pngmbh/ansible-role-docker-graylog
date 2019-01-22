SHELL=/bin/bash

ROLENAME=docker-graylog
TESTIMAGENAME=molecule-test
build-testimage:
	docker build -t ${TESTIMAGENAME} .

test: build-testimage
	docker run --rm -it \
		-v '${PWD}':/tmp/${ROLENAME} \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-w /tmp/${ROLENAME} \
		${TESTIMAGENAME} \
		sudo molecule test --all # --destroy=never # (for debugging)
