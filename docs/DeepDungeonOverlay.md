# DeepDungeonOverlay

[上游仓库](https://github.com/iamlokken/DeepDungeonOverlay)

[fork仓库](https://github.com/ffcafe-overlays/DeepDungeonOverlay)

## fork 改动列表

1. 本地化 OverlayPlugin 资源：将 `overlay/index.html` 和 `overlay/targetinfo/index.html` 中的 `common.min.js` 从 `https://ngld.github.io/OverlayPlugin/assets/shared/common.min.js` 替换为 `https://overlays.ffcafe.cn/assets/overlayplugin/common.min.js`，改为使用 ffcafe 托管资源，提升访问稳定性。

除上述改动外，当前 `cn` 分支相对 `upstream/main` 未发现其他功能性差异。

## 构建方法

在仓库根目录执行：

```bash
make dist
```

`Makefile` 中该模块没有单独的前端构建步骤，而是在 `dist` 目标里直接执行：

```make
cp -r DeepDungeonOverlay/overlay dist/DeepDungeonOverlay
```
