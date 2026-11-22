# skyline

上游：https://github.com/dsrkafuu/skyline-overlay ｜ fork：https://github.com/ffcafe-overlays/skyline-overlay

## 改动列表

1. `index.html` 的 Google Fonts 外链改为站点托管的 `inter.css`、`google-sans-flex.css`、`noto-sans-cjk.css` 与 `mi-sans.css`，预连接地址改为 `gf-static.xivcdn.com` 与 `mf-static.xivcdn.com`。
2. `index.html` 移除 Google Analytics 的 gtag 脚本。
3. `src/scss/fonts.ts` 删除按 `BASE_URL` 拼接的 MiSans `@font-face` 定义，改用站点级 `mi-sans.css`。
