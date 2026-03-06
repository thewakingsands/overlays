# ffxiv-glass-overlay

[上游仓库](https://github.com/piousvenom/ffxiv-glass-overlay)

[fork仓库](https://github.com/ffcafe-overlays/ffxiv-glass-overlay)

## fork 改动列表

1. 本地化字体资源：将 `index.html` 中的 Google Fonts `Inter` 引用替换为 `https://overlays.ffcafe.cn/fonts/inter.css`，避免直接依赖 Google Fonts。
2. 本地化 OverlayPlugin 资源：将 `index.html` 中的 `common.min.js` 从 `https://overlayplugin.github.io/OverlayPlugin/assets/shared/common.min.js` 替换为 `https://overlays.ffcafe.cn/assets/overlayplugin/common.min.js`，改为使用 ffcafe 托管资源，提升访问稳定性。

除上述改动外，当前 `cn` 分支相对 `upstream/main` 未发现其他功能性差异。

## 构建方法

- 仅构建 `ffxiv-glass-overlay`：`make ffxiv-glass-overlay/build`
- 构建全部 JS 模板：`make js`
- 组装完整站点：`make dist`
