.PHONY: js

.ONESHELL:

.SHELLFLAGS += -eo pipefail

horizoverlay/build: $(shell find horizoverlay/src -type f) $(shell find horizoverlay/public -type f)
	cd horizoverlay
	npm install
	npm run build

canisminor/dist: $(shell find canisminor/src -type f) $(shell find canisminor/public -type f)
	cd canisminor
	npm install
	npm run build

ikegami/dist: $(shell find ikegami/assets ikegami/components ikegami/fonts ikegami/lib ikegami/store ikegami/styles ikegami/index.vue ikegami/index.js -type f)
	cd ikegami
	yarn
	NODE_ENV=production yarn webpack

ember/build: $(shell find ember/src -type f) $(shell find ember/public -type f)
	cd ember
	yarn
	yarn build

js: horizoverlay/build canisminor/dist ikegami/dist ember/build

dist: js
	mkdir -p dist
	rm -rf dist/*
	cp -r kagerou dist/kagerou
	cp -r mopimopi dist/mopimopi
	cp -r mopimopi2 dist/mopimopi2
	cp -r horizoverlay/build dist/horizoverlay
	cp -r canisminor/dist dist/canisminor
	cp -r faceroll dist/faceroll
	cp -r ember/build dist/ember
	cp -r amethyst dist/amethyst
	cp -r ikegami/dist dist/ikegami
