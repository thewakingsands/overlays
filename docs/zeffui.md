# zeffui

[上游仓库](https://github.com/Zeffuro/ZeffUI)

[fork仓库](https://github.com/ffcafe-overlays/ZeffUI)

## fork 改动列表

1. 本地化前端依赖：将 `index.html` 和 `settings.html` 里原本指向 CDN 的 `jquery`、`jquery-contextmenu`、`interactjs`、`bootstrap`、`bootstrap-colorpicker`、`html5sortable`、`js-base64` 等脚本与样式全部改为加载仓库内的 `3rdparty/` 文件，避免运行时依赖外网。
2. 本地化 OverlayPlugin 资源：将页面中的 `https://ngld.github.io/OverlayPlugin/assets/shared/common.min.js` 改为仓库内的 `3rdparty/overlay-common.min.js`，保证 ACT 环境下可离线访问。
3. 本地化字体资源：移除 Font Awesome Kit 和 CDN 样式引用，改为提交 `3rdparty/fontawesome/` 及 `3rdparty/font/` 下的字体与图标文件，避免额外的远程字体请求。
4. 调整设置页样式读取逻辑：在 `scripts/settings.js` 中跳过 `3rdparty` 样式表，避免颜色提取逻辑误扫第三方 CSS，确保设置页仍只处理本项目自身样式。
5. 忽略构建产物目录：在 `.gitignore` 中新增 `/dist`，与仓库根目录通过 `Makefile` 生成分发目录的用法保持一致。

整体来看，当前 `cn` 分支相对 `upstream/master` 的核心维护点主要是“把运行依赖全部收进仓库”，未看到额外的功能性汉化或界面逻辑改造。

## 构建方法

- 仅构建 `zeffui`：`make zeffui/dist`
- 构建全部 JS 模板：`make js`
- 组装完整站点：`make dist`

`Makefile` 中该模块的单独构建步骤为直接整理静态文件：

```bash
cd zeffui
rm -rf dist
mkdir -p dist
cp -r 3rdparty data scripts skins styles *.html LICENSE dist/
```
