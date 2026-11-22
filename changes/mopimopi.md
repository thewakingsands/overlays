# mopimopi

上游：https://github.com/miranquil/mopimopizhhkcn ｜ fork：https://github.com/ffcafe-overlays/mopimopi

## 改动列表

1. 本地化 Material Icons 字体：`css/icon.css` 的字体改为仓库内 woff2 文件。
2. 新增钐镰客与贤者的团队高亮图标，并在配色映射中加入 RPR 与 SGE。
3. 重写自动隐藏逻辑：定时器改为集中管理，隐藏期间跳过数据刷新与重复隐藏，战斗开始后重置隐藏状态。
4. 修复历史记录去重条件写成 `lastCombat` 导致的判断错误，并把历史面板的清理挪到新增记录时执行。
