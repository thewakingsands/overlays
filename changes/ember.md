# ember

上游：https://github.com/GoldenChrysus/ffxiv-ember-overlay ｜ fork：https://github.com/ffcafe-overlays/ffxiv-ember-overlay

## 改动列表

1. 默认语言改为 `cn`，界面文案中文化。
2. 移除第三方服务相关代码：Google Analytics/GTM 统计、更新日志拉取、Twitch 主播列表、捐赠链接与服务，并删除对应依赖、语言条目和语言文件。
3. 构建升级：`react-scripts` 升到 5、`@craco/craco` 升到 7、`semantic-ui-react` 升到 2，新增 `rc-slider` 替换 `jquery-ui` 的滑块组件；新增 `.env-cmdrc` 与 `.yarnrc.yml`。
4. 部署基础路径改为 `/ember`，jQuery 由默认导入改为命名导入以适配新版构建。
