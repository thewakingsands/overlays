# ikegami

上游：https://github.com/hibiyasleep/ikegami ｜ fork：https://github.com/ffcafe-overlays/ikegami

## 改动列表

1. 引入 `vue-i18n`，新增 `lib/i18n.js` 的中英文文案；设置面板增加界面语言选项，并将各面板、导航栏、详情面板中的固定文案改为 `$t` 调用。
2. 默认语言设为 `zh-CN`，中文界面使用系统字体栈。
3. 字体本地化：移除 Google Fonts 的 Lato 外链，改为 `styles/_lato.sass` 与仓库内字体文件。
