.PHONY: js

.ONESHELL:

.SHELLFLAGS += -eo pipefail

horizoverlay/build: horizoverlay/src/** horizoverlay/public/**
	cd horizoverlay
	npm install
	npm run build

ffxiv-cmskin/dist: ffxiv-cmskin/src/**  ffxiv-cmskin/public/**
	cd ffxiv-cmskin
	npm install
	npm run build

ikegami/dist: ikegami/**.vue ikegami/**.js
	cd ikegami
	yarn
	yarn webpack

ember/build: ember/src/** ember/public/**
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
