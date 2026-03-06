# faceroll

[上游仓库](https://github.com/yorushika/facerolloverlay)

[fork仓库](https://github.com/ffcafe-overlays/facerolloverlay)

## fork 改动列表

1. 补齐 6.x 新职业文本：在 `faceroll_config.ini` 中为 `Rpr`、`Sge` 增加单汉字职业简称和职业描述，避免新职业名称显示缺失。
2. 更新职业分组逻辑：在 `faceroll_parse.js` 中把 `Rpr` 纳入 DPS、把 `Sge` 纳入 Healer，保证角色识别与展示逻辑覆盖新职业。
3. 补充缺失职业图标：新增 `jobicon/Dnc.png`、`jobicon/Gnb.png`、`jobicon/Rpr.png`、`jobicon/Sge.png`，让 5.x/6.x 新增职业可以正常显示图标资源。

除上述改动外，当前 `origin/master` 相对 `upstream/master` 未发现其他功能性差异。

## 构建方法

在仓库根目录执行：

```bash
make dist
```

`Makefile` 中该模块没有单独的前端构建步骤，而是在 `dist` 目标里直接执行：

```make
cp -r faceroll dist/faceroll
```
