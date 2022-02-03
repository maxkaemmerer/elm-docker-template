install:
	cd end2end && yarn install
	cd frontend && yarn install
build:
	cd frontend && ./node_modules/.bin/elm-app build
up: install build
	docker-compose up -d --build
down:
	docker-compose down --remove-orphans
validate-format:
	cd frontend && ./node_modules/.bin/elm-format --validate src tests
format:
	cd frontend && ./node_modules/.bin/elm-format src tests --yes
test:
	cd frontend && ./node_modules/.bin/elm-app test
prepare-e2e:
	docker-compose down --remove-orphans || true
	rm -rf end2end/frontend
	mkdir -p end2end/frontend
	cp -r frontend/build end2end/frontend/
	cd end2end && docker-compose down --remove-orphans || true
	cd end2end && docker-compose up -d --build
check: e2e-up e2e test format e2e-down
e2e:
	docker container exec end2end_cypress_1 cypress run --config-file cypress-docker.json --browser chrome
	docker container exec end2end_cypress_1 cypress run --config-file cypress-docker.json --browser firefox
	docker container exec end2end_cypress_1 chmod -R 777 /opt/cypress/cypress/screenshots
e2e-up: install build prepare-e2e
e2e-down:
	cd end2end && docker-compose down --remove-orphans
e2e-open:
	cd end2end && ./node_modules/.bin/cypress open --config-file cypress-local.json -P .