把论文图片放在本目录，推荐使用 PDF、PNG 或 JPG。

`nju-logo.jpg` 为用户提供的南京大学横版 JPG 原图，包含校徽及中英文校名，
作为首页单位 Logo 的排版示例。
在 `metadata.tex` 设置：

```latex
\LabLogo[1.1cm]{figures/nju-logo.jpg}
\LabLogoText{}
```

默认仅嵌入该图片，不另外排印单位文字。更换单位时替换图片路径；
需要额外文字时可设置 `\LabLogoText{单位名称}`。
使用 `\LabLogo{}` 可关闭首页 Logo。
示例图片原样保留，其权利归属不随模板代码许可变更。

`huggingface-logo.svg` 来自 [Hugging Face 官方品牌资源](https://huggingface.co/brand)，
原文件地址为 <https://huggingface.co/front/assets/huggingface_logo-noborder.svg>。
`huggingface-logo.pdf` 是该图标的矢量格式转换版，用于摘要框内的 Hugging Face 链接，
可直接在 pdfLaTeX / XeLaTeX 中编译，无需 shell escape。
品牌图标的权利归原权利人，不随模板代码的许可变更。
Project 与 Code 等图标由 TeX 发行版的 `fontawesome5` 宏包提供。

正文示例：

```latex
\includegraphics[width=0.9\linewidth]{figures/your-figure.pdf}
```

先上传实际文件，再取消正文示例注释；当前正文插图仍用 LaTeX 方框占位。
