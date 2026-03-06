# ikegami

[上游仓库](https://github.com/hibiyasleep/ikegami)

[fork仓库](https://github.com/ffcafe-overlays/ikegami)

## fork 改动列表

1. 引入 `vue-i18n`，并把下拉菜单、设置面板、详细信息、更新日志等主要界面文案整理为中英双语，同时在设置页新增语言切换选项。
2. 将默认界面语言设置为简体中文，首次加载时直接使用中文文案，并把语言选择持久化到设置存储中。
3. 本地化 Lato 字体资源：删除 `index.html` 里的 Google Fonts 外链，改为随仓库提交 Lato 字体文件并通过 `styles/_lato.sass` 本地加载，避免直接依赖 Google Fonts。
4. 为中文界面补充系统字体栈，并在根节点输出 `lang` 属性，让中文场景下的字体与排版更稳定。
5. 补充 `.yarnrc.yml`、`yarn.lock` 和 Yarn 安装产物，同时新增 `vue-i18n` 依赖，兼容当前仓库通过 `yarn vite build` 的构建方式，减少构建环境差异带来的失败。

## 构建方法

- 仅构建 `ikegami`：`make ikegami/dist`
- 构建全部 JS 模板：`make js`
- 组装完整站点：`make dist`
