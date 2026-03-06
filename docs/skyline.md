# skyline

[上游仓库](https://github.com/dsrkafuu/skyline-overlay)

[fork仓库](https://github.com/ffcafe-overlays/skyline-overlay)

## fork 改动列表

1. 本地化字体资源：将 `index.html` 中的 Google Fonts 外链替换为站点统一托管的 `/fonts/inter.css`、`/fonts/google-sans-flex.css`、`/fonts/noto-sans-cjk.css` 和 `/fonts/mi-sans.css`，同时把预连接地址切换到 `gf-static.xivcdn.com` / `mf-static.xivcdn.com`，减少对 Google 域名的直接依赖。
2. 统一 MiSans 加载方式：删除 `src/scss/fonts.ts` 中按 `BASE_URL` 拼接的本地 `@font-face` 定义，改为复用站点级 `mi-sans.css`，避免子模块重复内嵌字体声明。
3. 去除 GA：移除 `index.html` 中的 Google Analytics `gtag.js` 脚本和初始化代码，避免加载第三方统计。

除上述改动外，当前 `origin/cn` 相对 `upstream/main` 仅包含 `feat: localized webfonts` 这一组字体与统计相关调整。

## 构建方法

在仓库根目录执行：

```bash
make skyline/dist
```

`Makefile` 中该模块的构建步骤为：

```make
skyline/dist: $(shell find skyline/src -type f) $(shell find skyline/public -type f)
	cd skyline
	pnpm install --frozen-lockfile
	VITE_BASE_URL=/skyline pnpm build
```

如果需要连同其他模板一起组装到站点产物，也可以在仓库根目录执行：

```bash
make dist
```
