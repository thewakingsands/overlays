# mopimopi2

[上游仓库](https://github.com/HAERUHAERU/mopimopi)

[fork仓库](https://github.com/ffcafe-overlays/mopimopi2)

## fork 改动列表

1. 默认语言切换为简体中文：在 `js/init.js` 中将 `Lang` 的默认值从 `KR` 改为 `CN`，并把 `index.html` 的页面语言标记改为 `zh-Hans`，让初次加载时直接进入中文界面。
2. 本地化字体资源：移除 `index.html` 中对 Google Fonts 的依赖，新增 `css/fonts.css` 和配套字体文件，改为从仓库内置资源加载 `Material Icons` 与 `Roboto Condensed`。
3. 本地化前端依赖：将 `index.html` 里的 OverlayPlugin `common.min.js` 和 jQuery 3.2.1 都改为读取仓库内的 `js/common.min.js`、`js/jquery-3.2.1.min.js`，避免依赖外部 CDN。
4. 修复战斗数据长时间运行后不显示的问题：在 `js/process.js` 的 `saveLog()` 中改用 `lastDPS.isActive` 和 `lastDPS.combatKey`，避开 `lastCombat` 为空时导致的历史记录与显示异常。
5. 修复旧配置的图标集兼容性：在 `js/ui.js` 中检测到不受支持的 `iconSet === 'colorful'` 时，自动回退为 `glow`，避免设置界面或图标显示异常。
6. 调整部分中文翻译措辞：在 `js/lang.js` 中把若干图标样式名称改为更自然的中文表述，例如“辉光”“旧式”“金属边框”“套装图标”。

## 构建方法

- 从主仓库根目录执行 `make dist`。
- `mopimopi2` 没有单独的前端构建步骤，`Makefile` 会在 `dist` 目标中直接执行 `cp -r mopimopi2 dist/mopimopi2` 完成组装。
