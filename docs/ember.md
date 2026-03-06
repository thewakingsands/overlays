# ember

[上游仓库](https://github.com/GoldenChrysus/ffxiv-ember-overlay)

[fork仓库](https://github.com/ffcafe-overlays/ffxiv-ember-overlay)

## fork 改动列表

1. 将默认语言从英文改为中文，首次加载时直接使用中文界面。
2. 为静态站点部署补齐 `REACT_APP_ROUTER_BASE`、`REACT_APP_HTTP_BASE`、`REACT_APP_REDIRECT_URL` 等环境配置，固定使用 `/ember` 子路径和 ffcafe 的仓库链接。
3. 禁用 Semantic UI 的 Google Fonts 引用，改用系统字体栈，避免在线字体依赖。
4. 移除 Google Tag Manager、`manifest.json` 引用和相关环境变量，去掉站点埋点与多余的 PWA 资源。
5. 删除面向原作者站点的 Discord、更新日志、直播推广和内置捐助入口，只保留指向原仓库的说明，减轻本地维护负担。
6. 将 `jquery-ui` 滑块替换为 `rc-slider`，并同步升级 `react-scripts`、`semantic-ui-react` 与 less/craco 配置，适配当前构建链。
7. 用 `URLSearchParams` 等现代 API 替换旧的 `querystring` 用法，并统一整理若干 `jquery` 引入写法，减少旧环境兼容代码。

## 构建方法

- 仅构建 Ember：`make ember/build`
- 构建全部 JS 模板：`make js`
- 组装完整站点：`make dist`
