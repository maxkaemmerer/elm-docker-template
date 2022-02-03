# Elm Docker Template

## Introduction
This is a small template that sets you up with a local dev environment using elm in docker with a caddy webserver.

## Setup

1. Add `127.0.0.1 elm-app.dynamic` and `127.0.0.1 elm-app.static` to your /etc/hosts. You can of course change the host, just make sure to change the host in the following files.
    * `.docker/caddy/static.Caddyfile` 
    * `.docker/caddy/Caddyfile`  
    * `end2end/docker-compose.yml`
    * `end2end/cypress-local.json`
    * `end2end/cypress-docker.json`
2. execute `make up`
3. visit `http://elm-app.dynamic/` for the hot-reloaded site, or `http://elm-app.static` for the version last built with `make build`


## Make commands
### make install
Installs all dependencies

### make build
Builds the elm application so it can be deployed to somewhere or tested locally via for example the e2e Tests

### make up
Install, builds and starts the docker environment. This should be your go to when you start working.

### make down
Shuts down the docker environment

### make validate-format
Execute elm-format without fixing the files. This throws an error if your Elm code is not properly formatted. I use this in my CI environment

### make format
Execute elm-format, formatting your Elm code.

### make test
Executes your Elm tests.

### make prepare-e2e
Starts up your e2e test environment. You should use `make e2e-up` however, since that script also upadates your dependencies.

### make check
Executes your e2e and units tests and formats your Elm code.

### make e2e
Executes your e2e tests for both chrome and firefox. You should have run `make e2e-up` first.

### make e2e-up
Installs all dependencies and start your e2e test environment. (Combines `make install`, `make build` and `make prepare-e2e`)

### make e2e-down
Shut down your e2e test environment.

### make e2e-open
Opens the Cypress UI to view and run tests manually. You should have run `make e2e-up` first.
