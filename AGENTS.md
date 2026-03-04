# AGENTS

## 仓库概览
这是一个 FF14 ACT 悬浮窗模板的聚合仓库。多数模板以 git submodule 形式存在，根目录通过 `Makefile` 统一构建，产物汇总到 `dist/`，并发布为静态站点。`index.html` 是模板选择页，供 ACT 内加载使用。

## 关键路径
- `index.html`: 模板选择/启动页。
- `404.html`: 找不到模板时的兜底页。
- `Makefile`: 统一构建、组装、发布的入口。
- `dist/`: 构建产物（不要手工修改）。
- `fonts/`, `fonts-offline/`, `fonts.css`: 公共字体/资源。
- 子模块目录: 剩下的全部文件夹。

## 日常维护（核心流程）
- 拉取上游子模块更新并合并到本仓库。
- 统一构建并生成 `dist/`。
- 发布到服务器（`make deploy`）。

## 构建与组装
- 通过 `.envrc` + `.tool-versions` 使用 `mise` 管理 node/yarn/pnpm/bun。
- 构建所有 JS 模板:
  - `make js`
- 构建并组装完整站点:
  - `make dist`

## 子模块更新流程
- 首次初始化:
  - `git submodule sync --recursive`
  - `git submodule update --init --recursive`
- 日常更新（先 fetch 上游，再合并到本仓库）:
  - 在子模块内 `git fetch` 上游并合并/快进到目标分支
  - 返回根仓库，提交更新后的 submodule 指针

## 新增子模块流程
- 添加子模块并指定分支:
  - `git submodule add -b <branch> <repo_url> <path>`
- 初始化与拉取:
  - `git submodule update --init --recursive`
- 将模板加入构建与发布:
  - 需要构建的模板：在 `Makefile` 增加对应目标，并加入 `js` 与 `dist` 聚合流程
  - 无需构建的模板：在 `dist` 目标中加入拷贝逻辑
- 更新模板选择页:
  - 在 `index.html` 增加入口链接和说明

## 测试
不要测试

## 注意事项
- 不要手工编辑 `dist/`，必须用 `make dist` 重建。
