# klondike

[上游仓库](https://github.com/kalilistic/klondike)

[fork仓库](https://github.com/ffcafe-overlays/klondike)

## fork 改动列表

1. 本地化 OverlayPlugin 资源：将 `public/index.html` 中的 `common.min.js` 从 `https://ngld.github.io/OverlayPlugin/assets/shared/common.min.js` 替换为 `https://overlays.ffcafe.cn/assets/overlayplugin/common.min.js`，改为使用 ffcafe 托管资源，提升访问稳定性。

除上述改动外，当前 `cn` 分支相对 `upstream/master` 未发现其他功能性差异。

## 构建方法

- 仅构建 `klondike`：`make klondike/dist`
- 构建全部 JS 模板：`make js`
- 组装完整站点：`make dist`

`Makefile` 中该模块对应的单独构建命令为：

```bash
cd klondike
npm install --legacy-peer-deps
NODE_OPTIONS=--openssl-legacy-provider npm run build
```
