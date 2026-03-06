# horizoverlay

[上游仓库](https://github.com/bsides/horizoverlay)

[fork仓库](https://github.com/ffcafe-overlays/horizoverlay)

## fork 改动列表

1. 将默认语言从英文切换为中文：把默认配置中的 `locale` 从 `enUS` 改为 `zhCN`，首次加载时直接使用中文界面。
2. 调整页面语言标记：将 `public/index.html` 里的 `<html lang>` 从 `en` 改为 `zh-Hans`，让浏览器和辅助工具按简体中文处理页面。
3. 移除 Google Analytics：删除 `gtag.js` 脚本和 `UA-50702825-3` 初始化逻辑，避免额外的第三方请求与站点埋点。

## 构建方法

- 仅构建该模板：`make horizoverlay/build`
- 构建全部 JS 模板：`make js`
- 组装完整站点：`make dist`

`make horizoverlay/build` 实际执行的子模块命令为：`cd horizoverlay && npm install && NODE_OPTIONS=--openssl-legacy-provider npm run build`
