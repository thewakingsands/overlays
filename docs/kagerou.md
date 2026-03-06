# kagerou

[上游仓库](https://github.com/hibiyasleep/kagerou)

[fork仓库](https://github.com/ffcafe-overlays/kagerou)

## fork 改动列表

1. 将默认语言从韩文改为中文，并补充、修正文案翻译，例如千位分隔符、紧凑顶栏等设置项，首次打开时直接使用中文界面。
2. 调整默认样式与字体：把主界面的默认字体栈改成系统字体，减少对在线 `Lato` / `Source Han Sans` 字体的依赖，更适合本地悬浮窗场景。
3. 重做前端构建链：新增 `package.json`、`yarn.lock` 和 `Parcel` 打包流程，把 `overlay` / `config` 两个入口改为模块化构建，并固定 `--public-url /kagerou/` 以适配聚合站点按子目录部署。
4. 精简配置页依赖：移除外链 `ace` 编辑器和仓库内置的 `sortable-1.10.2-min.js`，改为 npm 引入 `sortablejs`，同时把自定义 CSS 编辑器改成原生 `textarea`，降低维护成本。
5. 修复运行兼容性：针对新版 ACT 战斗数据多线程导致的历史记录判定问题，改用 `isActive` 区分新战斗；同时补齐 `VPR`、`PCT` 等 7.0 职业支持。
6. 补充 fork 侧工程化维护：新增 GitHub Pages 发布工作流、启用 Corepack / Yarn 4，并将 `cn` 作为主要维护分支，方便独立发布与持续同步上游。

## 构建方法

- 仅构建 Kagerou：`make kagerou/dist`
- 构建全部 JS 模板：`make js`
- 组装完整站点：`make dist`

`make kagerou/dist` 实际执行的子模块命令为：`cd kagerou && yarn && yarn build && mkdir -p dist && touch dist`
