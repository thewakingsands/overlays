# canisminor

[上游仓库](https://github.com/canisminor1990/ffxiv-cmskin)

[fork仓库](https://github.com/ffcafe-overlays/ffxiv-cmskin)

## fork 改动列表

1. 调整构建输出目录与资源路径：将产物从 `docs/` 改到 `dist/`，并把站点资源从绝对路径改为相对路径，方便主仓库把它部署到 `/canisminor` 子目录下使用。
2. 切换为 Hash 路由：从 `createBrowserHistory` 改成 `createHashHistory`，设置页等页面改用 `#/setting/...` 形式打开，避免静态托管子路径下的路由刷新问题。
3. 移除埋点脚本：删除 `Google Analytics` 和 `Baidu Tongji`，减少额外第三方请求与跟踪。
4. 将设置存储从 Cookie 改为 LocalStorage：避免依赖根路径 Cookie，也更适合悬浮窗场景下的本地配置持久化。
5. 优化外链打开方式：新增 `OverlayPluginApi.openUrlInBrowser` 适配，设置页中的外部链接优先在系统浏览器中打开。
6. 移除上游提交的构建产物：不再在子模块仓库里保留 `docs/` 发布结果，由聚合仓库统一构建与分发。
7. 同步游戏版本内容：补充 `Reaper` / `Sage` 职业图标与文案，并更新版本号到 `2.3.1`。
8. 更新构建依赖与兼容性修复：将 `node-sass` 切换为 `sass` 别名，并补充锁文件修复，降低新环境下安装失败的概率。

## 构建方法

- 仅构建该模板：`make canisminor/dist`
- 构建全部 JS 模板：`make js`
- 组装完整站点：`make dist`

`make canisminor/dist` 实际执行的子模块命令为：`cd canisminor && npm install --legacy-peer-deps && npm run build`
