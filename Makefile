.PHONY: js

.ONESHELL:

.SHELLFLAGS += -eo pipefail

horizoverlay/build: $(shell find horizoverlay/src -type f) $(shell find horizoverlay/public -type f)
	cd horizoverlay
	npm install
	npm run build

ffxiv-cmskin/dist: $(shell find ffxiv-cmskin/src -type f) $(shell find ffxiv-cmskin/public -type f)
	cd ffxiv-cmskin
	npm install
	npm run build

ikegami/dist: $(shell find ikegami -type f -name '*.{vue.js}')
	cd ikegami
	yarn
	yarn webpack

ember/build: $(shell find ember/src -type f) $(shell find ember/public -type f)
	cd ember
	yarn
	yarn build

js: horizoverlay/build ffxiv-cmskin/dist ikegami/dist ember/build

dist: js
	mkdir -p dist
	rm -rf dist/*
	cp -r kagerou dist/kagerou
	cp -r mopimopi dist/mopimopi
	cp -r mopimopi2 dist/mopimopi2
	cp -r horizoverlay/build dist/horizoverlay
	cp -r ffxiv-cmskin/dist dist/canisminor
	cp -r facerolloverlay dist/faceroll
	cp -r ember/build dist/ember
	cp -r amethyst dist/amethyst
