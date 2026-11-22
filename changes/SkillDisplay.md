# SkillDisplay

上游：https://github.com/Rawrington/SkillDisplay ｜ fork：https://github.com/ffcafe-overlays/SkillDisplay

## 改动列表

1. `src/Action.js` 的动作数据与图标接口由 `xivapi.com` 改为 `xivapi-v2.xivcdn.com`，改用 `/api/sheet/Action` 与 `/api/asset`，并按新的 `fields` 结构读取字段。
2. `src/App.js` 战斗技能动作 ID 的合法上限由 `30000` 提高到 `40000`，适配新增技能。
