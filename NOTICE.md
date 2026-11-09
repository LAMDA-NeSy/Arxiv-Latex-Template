# 模板来源与修改说明

本模板的排版参考用户提供的 TeXPage 项目：
https://tex.nju.edu.cn/share/b06399ae7af64309ace7ca896c544124

该项目随附 `thuc3i.cls`，其源文件声明：

> Licence: This template is released under the Creative Commons licence
> Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)

原文件的版本历史从 2018 年 12 月延续至 2025 年 3 月，提及 Google、Google
DeepMind 和 THU-C3I 等历史模板名称，并留有 `shakir@` 联系标识。原文件未给出
完整作者姓名或可核验的完整版权归属；此处保留其实际提供的署名信息，不推断作者。
上述机构名称仅作为来源记录，不是本通用模板的机构归属或背书。

2026-11-01 制作的 `labpaper.cls` 是对上述模板的整理改编，继续采用 CC BY-SA 4.0：
https://creativecommons.org/licenses/by-sa/4.0/

主要修改：

- 改名为 `labpaper.cls`，保留单栏、Charter 字体、深蓝标题、灰色摘要框与页眉线。
- 重写作者与单位登记，支持自动生成 core、corr、lead 标记及图例。
- 分离配置、稿件信息和正文；补充字体配对、颜色、匿名与黑白输出选项。
- 修复原类文件的摘要捕获和标题处理，清理重复加载、机构 logo 与专用内容。
- 所有正文、姓名、单位、邮箱、项目资源及参考文献均改为显式占位示例。

v1.1 调整：通讯邮箱改为同一行显示且省略姓名前缀；Figure、Table 题注居中；
Related Work 从引言子节调整为独立章节。新增单参数 `\LabEmail{邮箱}`，
并保留旧版 `\LabCorrespondence{姓名}{邮箱}` 的兼容入口。

v1.2（2026-11-06）新增可配置的首页单位 Logo 与可选名称，支持自动调整页眉高度、
无 Logo 时恢复文字页眉，并在匿名模式隐藏单位标识。新增 `\LabLogo[高度]{图片路径}`
和 `\LabLogoText{单位名称}`；默认示例使用用户提供的南京大学校徽
`figures/nju-logo.jpg`。该图片原样保留，仅作为排版示例，其权利归属不随模板代码的
CC BY-SA 4.0 许可变更。同步更新使用说明与模板预览。

v1.2.1（2026-11-06）将首页示例调整为仅显示校徽，保留可选单位名称接口。
摘要框改为近白浅灰蓝底色与 0.35pt 细边框，缩小圆角并增加内边距；
同步减淡黑白模式下的摘要底色和边框，更新说明及 PDF 预览。

随后按用户要求，将 `figures/nju-logo.jpg` 原样替换为其提供的南京大学横版 JPG，
图片包含校徽及中英文校名；仍不在图片之外额外排印单位名称。

v1.3（2026-11-09）将项目主页、代码及新增的 Hugging Face 链接移入摘要框底部，
增加细分隔线与逐行左对齐的可点击图标链接；保留原有三参数资源命令，并支持可选的自定义图标。
Abstract 标题居中、正文左对齐，并移除默认摘要中的 Keywords 行。
匿名模式或无资源时不显示链接栏。单位 Logo 仍位于首页页眉。同步更新说明与 PDF 预览。
Hugging Face 图标来源于官方品牌资源：https://huggingface.co/brand ，
保留原始 SVG 并附带矢量 PDF 转换版；品牌图标权利归原权利人，不适用模板代码的许可。
其他资源图标通过 TeX 发行版的 `fontawesome5` 宏包提供，遵循该宏包及字体的许可。

本项目新增的模板代码和说明也以 CC BY-SA 4.0 提供；TeX 宏包、字体等外部依赖
仍遵循各自许可，并未复制进模板包。后续撰写的论文内容的许可由作者另行确定。
