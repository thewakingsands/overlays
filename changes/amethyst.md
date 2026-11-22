# amethyst

上游：https://github.com/lalafellsleep/FancyDetail ｜ fork：https://github.com/ffcafe-overlays/FancyDetail

## 改动列表

1. 新增简体中文语言包：`js/lang.js` 默认语言由 `en` 改为 `zh`，并为设置窗口的列名等文案补充中文。
2. 字体本地化：`css/default.css` 与 `css/setting.css` 内嵌 Aldrich 与 Material Icons 字体，移除 Google Fonts 外链，默认字体栈改为系统字体。
3. 将远程加载的 `cleaveore.js` 改为仓库内 `js/cleaveore.js`。
4. `index.html` 与 `popup.html` 相应移除外部资源引用，改用本地文件，设置窗口的列名显示走本地化文案。
