.PHONY: js deploy

.ONESHELL:

.SHELLFLAGS += -eo pipefail

horizoverlay/build: $(shell find horizoverlay/src -type f) $(shell find horizoverlay/public -type f)
	cd horizoverlay
	npm install
	npm run build

canisminor/dist: $(shell find canisminor/src -type f) $(shell find canisminor/public -type f) canisminor/package-lock.json
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

skyline/dist: $(shell find skyline/src -type f) $(shell find skyline/public -type f)
	cd skyline
	NODE_VERSION=18 ${NVM_DIR}/nvm-exec npx pnpm install --frozen-lockfile
	VITE_BASE_URL=/skyline NODE_VERSION=18 ${NVM_DIR}/nvm-exec npx pnpm build

zeffui/dist: $(shell find zeffui -type f)
	cd zeffui
	rm -rf dist
	mkdir -p dist
	cp -r 3rdparty data scripts skins styles *.html LICENSE dist/

SkillDisplay/build: $(shell find SkillDisplay/src -type f) $(shell find SkillDisplay/public -type f)
	cd SkillDisplay
	npm install
	npm run build

js: horizoverlay/build canisminor/dist ikegami/dist ember/build zeffui/dist SkillDisplay/build skyline/dist

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
	cp -r skyline/dist dist/skyline
	cp -r zeffui/dist dist/zeffui
	cp -r SkillDisplay/build dist/SkillDisplay
	cp index.html dist/index.html
	cp 404.html dist/404.html

deploy:
	rsync -avP --delete dist/ toomanyreqs:/var/www/overlays/
	coscli sync index.html cos://overlays/index.html
	coscli sync 404.html cos://overlays/404.html
	coscli sync -r dist/ cos://overlays/
