# Next-UI

[上游仓库](https://github.com/kaminaris/Next-UI)

[fork仓库](https://github.com/ffcafe-overlays/Next-UI)

## fork 改动列表

1. 本地化字体资源：将 `Inter` 字体的 `webFont` 从 Google Fonts 改为 `https://overlays.ffcafe.cn/fonts/inter.css`，避免直接依赖 Google Fonts。
2. 调整定时器类型声明：将多个 `setTimeout` / `setInterval` 变量从 `number` 改为 `ReturnType<typeof setTimeout>` 或 `ReturnType<typeof setInterval>`，兼容当前 TypeScript/Node typings。
3. 补充锁文件：新增 `package-lock.json`，固定依赖解析结果，便于在仓库内统一构建。

## 构建方法

在仓库根目录执行完整前端构建：

```bash
make js
```

在仓库根目录执行完整站点组装：

```bash
make dist
```

`Next-UI` 在 `Makefile` 中对应的单独构建命令为：

```bash
cd Next-UI
npm install --legacy-peer-deps
npm run build -- --base-href=/Next-UI/
```
