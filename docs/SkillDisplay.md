# SkillDisplay

[上游仓库](https://github.com/Rawrington/SkillDisplay)

[fork仓库](https://github.com/ffcafe-overlays/SkillDisplay)

## fork 改动列表

1. 适配 Dawntrail 技能范围：将 `src/App.js` 中战斗技能动作 ID 的合法范围上限从 `30000` 放宽到 `40000`，避免新版本技能被错误过滤。
2. 切换技能数据与图标源：将 `src/Action.js` 中的动作数据与图标请求从 `https://xivapi.com` 改为 `https://cafemaker.wakingsands.com`，规避 XIVAPI 异常时的访问问题。

## 构建方法

在仓库根目录执行完整前端构建：

```bash
make js
```

在仓库根目录执行完整站点组装：

```bash
make dist
```

`SkillDisplay` 在 `Makefile` 中对应的单独构建命令为：

```bash
cd SkillDisplay
npm install
npm run build
```
