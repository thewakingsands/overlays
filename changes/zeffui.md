# zeffui

上游：https://github.com/Zeffuro/ZeffUI ｜ fork：https://github.com/ffcafe-overlays/ZeffUI

## 改动列表

1. 将 jQuery、jQuery ContextMenu、interact.js、FontAwesome、Bootstrap、bootstrap-colorpicker、html5sortable、base64 等 CDN 资源改为仓库内 `3rdparty/` 本地文件。
2. OverlayPlugin 的 `common.min.js` 由 `ngld.github.io` 改为本地 `3rdparty/overlay-common.min.js`。
3. `scripts/settings.js` 采集主题色时，样式表过滤条件改为排除 `3rdparty` 目录下的资源。
