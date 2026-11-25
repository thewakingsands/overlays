.PHONY: js dist package deploy

SHELL := /bin/bash

.ONESHELL:

.SHELLFLAGS := -eo pipefail -c

SITE := python3 "$(CURDIR)/scripts/site.py"
PACKAGE_DIR ?= artifacts

horizoverlay/build: $(shell find horizoverlay/src -type f) $(shell find horizoverlay/public -type f) horizoverlay/bun.lock horizoverlay/package.json
	cd horizoverlay
	$(SITE) run horizoverlay install bun install --frozen-lockfile
	$(SITE) run horizoverlay build env GENERATE_SOURCEMAP=false NODE_OPTIONS=--openssl-legacy-provider bun run build

canisminor/dist: $(shell find canisminor/src -type f) $(shell find canisminor/public -type f) canisminor/bun.lock canisminor/package.json
	cd canisminor
	$(SITE) run canisminor install bun install --frozen-lockfile
	$(SITE) run canisminor build env bun run build

ikegami/dist: $(shell find ikegami/assets ikegami/components ikegami/fonts ikegami/lib ikegami/store ikegami/styles ikegami/index.vue ikegami/index.js -type f) ikegami/bun.lock ikegami/package.json ikegami/vite.config.js
	cd ikegami
	$(SITE) run ikegami install bun install --frozen-lockfile
	$(SITE) run ikegami build env NODE_OPTIONS=--openssl-legacy-provider NODE_ENV=production bun run vite build

ember/build: $(shell find ember/src -type f) $(shell find ember/public -type f) ember/bun.lock ember/package.json
	cd ember
	$(SITE) run ember install bun install --frozen-lockfile
	$(SITE) run ember build env GENERATE_SOURCEMAP=false NODE_OPTIONS=--openssl-legacy-provider bun run build

skyline/dist: $(shell find skyline/src -type f) $(shell find skyline/public -type f) skyline/bun.lock skyline/package.json skyline/vite.config.ts
	cd skyline
	$(SITE) run skyline install bun install --frozen-lockfile
	$(SITE) run skyline build env VITE_BASE_URL=/skyline bun run build

zeffui/dist: $(shell find zeffui -path zeffui/dist -prune -o -type f -print)
	cd zeffui
	rm -rf dist
	mkdir -p dist
	cp -r 3rdparty data scripts skins styles *.html LICENSE dist/

SkillDisplay/build: $(shell find SkillDisplay/src -type f) $(shell find SkillDisplay/public -type f) SkillDisplay/bun.lock SkillDisplay/package.json
	cd SkillDisplay
	$(SITE) run SkillDisplay install bun install --frozen-lockfile
	$(SITE) run SkillDisplay build env GENERATE_SOURCEMAP=false bun run build

kagerou/dist: $(shell find kagerou/overlay kagerou/config -type f) kagerou/bun.lock kagerou/package.json
	cd kagerou
	$(SITE) run kagerou install bun install --frozen-lockfile
	$(SITE) run kagerou build env bun run build
	touch dist

klondike/dist: $(shell find klondike/src -type f) $(shell find klondike/public -type f) klondike/babel.config.js klondike/vue.config.js klondike/bun.lock klondike/package.json
	cd klondike
	$(SITE) run klondike install bun install --frozen-lockfile
	$(SITE) run klondike build env NODE_OPTIONS=--openssl-legacy-provider bun run build

ffxiv-glass-overlay/build: $(shell find ffxiv-glass-overlay/src -type f) $(shell find ffxiv-glass-overlay/public -type f) ffxiv-glass-overlay/vite.config.ts ffxiv-glass-overlay/tsconfig.json ffxiv-glass-overlay/bun.lock ffxiv-glass-overlay/package.json
	cd ffxiv-glass-overlay
	$(SITE) run ffxiv-glass-overlay install bun install --frozen-lockfile
	$(SITE) run ffxiv-glass-overlay build env bun run build

Next-UI/dist/next-ui: $(shell find Next-UI/src -type f) Next-UI/angular.json Next-UI/package.json Next-UI/tsconfig.json Next-UI/bun.lock Next-UI/package.json
	cd Next-UI
	$(SITE) run Next-UI install bun install --frozen-lockfile --backend=copyfile
	$(SITE) run Next-UI build env bun run build --base-href=/Next-UI/

js: horizoverlay/build canisminor/dist ikegami/dist ember/build zeffui/dist SkillDisplay/build skyline/dist kagerou/dist klondike/dist ffxiv-glass-overlay/build Next-UI/dist/next-ui

dist: js
	rm -rf dist
	mkdir -p dist
	cp -r kagerou/dist dist/kagerou
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
	cp -r DeepDungeonOverlay/overlay dist/DeepDungeonOverlay
	cp -r klondike/dist dist/klondike
	cp -r ffxiv-glass-overlay/build dist/ffxiv-glass-overlay
	cp -r Next-UI/dist/next-ui dist/Next-UI
	cp -r fonts dist/fonts
	cp -r assets dist/assets
	cp index.html dist/index.html
	cp 404.html dist/404.html
	$(SITE) strip-maps dist

package:
	mkdir -p "$(PACKAGE_DIR)"
	: > "$(PACKAGE_DIR)/timings.jsonl"
	BUILD_TIMINGS="$(abspath $(PACKAGE_DIR))/timings.jsonl" $(MAKE) -B dist
	$(SITE) package "$(PACKAGE_DIR)"

deploy:
	rsync -avP dist/ toomanyreqs:/var/www/overlays/
