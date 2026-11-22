# kagerou

上游：https://github.com/hibiyasleep/kagerou ｜ fork：https://github.com/ffcafe-overlays/kagerou

## 改动列表

1. 构建方式改为 Parcel 与 yarn 4 的 ESM 打包：新增 `package.json`，`overlay/index.html` 与 `config/index.html` 改用 `index.js` 入口，构建输出路径为 `/kagerou/`，并删除旧的逐文件 script 引用。
2. 新增 GitHub Actions 构建与 Pages 发布流程。
3. 默认语言改为 `cn`，补充 `share/lang/cn.json` 的中文翻译，字体改为系统字体栈并移除 Google Fonts 外链。
4. 目录结构整理：`overlay/css` 迁移到 `share/css`，配置文件加载与本地化改为动态导入，`config/index.css` 拆分为入口与 `_index.css`。
