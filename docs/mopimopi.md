# mopimopi

[上游仓库](https://github.com/miranquil/mopimopizhhkcn)

[fork仓库](https://github.com/ffcafe-overlays/mopimopi)

## fork 改动列表

1. 本地化字体资源：将 `css/icon.css` 中的 `Material Icons` 字体从 `fonts.gstatic.com` 改为读取仓库内置的 `css/2fcrYFNaTjcS6g4U3t-Y5ZjZjT5FdEJ140U2DJYC3mY.woff2`，避免直接依赖 Google Fonts。
2. 补充新职业发光图标：新增 `images/glow/rpr.png` 和 `images/glow/sge.png`，为 `Reaper` / `Sage` 提供对应的职业高亮资源。
3. 修复自动隐藏状态机：在 `js/mopimopi.js` 中新增 `hidden` 与定时器数组控制，避免重复注册自动隐藏定时器，并在重新显示时统一清理历史定时器。
4. 修复战斗开始后表格不显示的问题：根据 `lastCombat.isActive` 更新 `startFlag`，并在界面已隐藏时跳过 `onUpdateUserData` 刷新，配合自动隐藏逻辑避免战斗开始后界面状态错乱。
5. 修复历史记录与职业配色细节：更正 `encounterArray[1].lastCombat.combatKey` 的比较逻辑，避免历史记录判重异常；同时为 `SGE` 和 `RPR` 复用现有治疗/输出配色分组。

## 构建方法

- 从主仓库根目录执行 `make dist`。
- `mopimopi` 没有单独的前端构建步骤，`Makefile` 会在 `dist` 目标中直接执行 `cp -r mopimopi dist/mopimopi` 完成组装。
