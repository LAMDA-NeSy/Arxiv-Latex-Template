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

本项目新增的模板代码和说明也以 CC BY-SA 4.0 提供；TeX 宏包、字体等外部依赖
仍遵循各自许可，并未复制进模板包。后续撰写的论文内容的许可由作者另行确定。
