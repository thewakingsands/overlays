# canisminor

上游：https://github.com/canisminor1990/ffxiv-cmskin ｜ fork：https://github.com/ffcafe-overlays/ffxiv-cmskin

## 改动列表

1. 适配子目录部署：`publicPath` 改为空，静态资源引用改为相对路径，路由改用 hash 历史，构建输出由 `docs/` 改为 `dist/`。
2. 移除 Google Analytics 与页面评论入口。
3. 存储方式由 Cookie 改为带前缀的 localStorage。
4. 新增钐镰客与贤者的职业图标与角色分类。
5. 通过 OverlayPlugin API 打开外部链接，避免在悬浮窗内直接跳转。
6. 版本号升到 2.3.1，新增 `package-lock.json`。
