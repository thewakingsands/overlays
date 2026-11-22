# mopimopi2

上游：https://github.com/HAERUHAERU/mopimopi ｜ fork：https://github.com/ffcafe-overlays/mopimopi2

## 改动列表

1. 资源本地化：Material Icons 与 Roboto Condensed 字体、jQuery、OverlayPlugin 的 `common.min.js` 均改为仓库内文件，移除 Google Fonts 与 CDN 引用。
2. 默认语言由 `KR` 改为 `CN`。
3. 修正部分中文文案的措辞。
4. 修复 `js/process.js` 中判断战斗状态时误用 `lastCombat` 的问题，并处理 `iconSet` 取值兼容。
