# amethyst

[上游仓库](https://github.com/lalafellsleep/FancyDetail)

[fork仓库](https://github.com/ffcafe-overlays/FancyDetail)

## fork 改动列表

1. 新增简体中文语言包，并将默认/兜底语言切换为中文，覆盖设置项、列名等主要文案。
2. 设置窗口里的 DPS/HPS 列名改为显示本地化文案，便于中文环境下调整显示列。
3. 将 Google Fonts 依赖改为仓库内置字体资源，补齐 `Aldrich` 和 `Material Icons` 的本地文件，避免外网请求。
4. 将远程加载的 `https://cleaveore.ffxiv.io/2.1.2/cleaveore.js` 改为随仓库分发的本地 `js/cleaveore.js`，减少外部依赖。
5. 默认界面字体改为系统无衬线字体栈，替换原先偏韩文环境的默认字体设置，提高中文系统兼容性。

## 构建方法

- 从主仓库根目录执行 `make dist`。
- `amethyst` 没有单独的前端构建步骤，`Makefile` 会在 `dist` 目标中直接执行 `cp -r amethyst dist/amethyst` 完成组装。
