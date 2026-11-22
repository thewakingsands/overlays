# Next-UI

上游：https://github.com/kaminaris/Next-UI ｜ fork：https://github.com/ffcafe-overlays/Next-UI

## 改动列表

1. `src/app/Data/Config/Profiles/Mini/miniConfig.ts` 的 Inter 字体地址由 Google Fonts 改为 `https://overlays.ffcafe.cn/fonts/inter.css`。
2. 多个组件中定时器变量的类型由 `number` 改为 `ReturnType<typeof setTimeout>` 或 `ReturnType<typeof setInterval>`，兼容当前 TypeScript 类型定义。
3. 新增 `package-lock.json`，固定依赖版本。
