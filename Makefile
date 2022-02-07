install-editor-deps:
	npm i -g elm elm-format elm-test
install:
	cd end2end && yarn install
	cd frontend && yarn install
build:
	cd frontend && yarn run build
up: install build e2e-down
	docker-compose up -d --build
down:
	docker-compose down --remove-orphans
validate-format:
	cd frontend && ./node_modules/.bin/elm-format --validate src tests
format:
	cd frontend && ./node_modules/.bin/elm-format src tests --yes
test:
	cd frontend && yarn run test
prepare-e2e:
	docker-compose down --remove-orphans || true
	cd end2end && docker-compose down --remove-orphans || true
	cd end2end && docker-compose up -d --build
check: e2e-up e2e test format e2e-down
e2e:
	docker container exec end2end_cypress_1 cypress run --config-file cypress.json --browser chrome
	docker container exec end2end_cypress_1 cypress run --config-file cypress.json --browser firefox
	docker container exec end2end_cypress_1 chmod -R 777 /opt/cypress/cypress/screenshots
e2e-up: install build prepare-e2e
e2e-down:
	cd end2end && docker-compose down --remove-orphans || true
e2e-open:
	cd end2end && ./node_modules/.bin/cypress open --config-file cypress.json -P .