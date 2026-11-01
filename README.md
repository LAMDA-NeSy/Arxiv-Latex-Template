# 组内公用论文 LaTeX 模板

本模板参考所给 TeXPage 项目的排版：A4 单栏、Charter 正文与配套数学字体、
深蓝标题、黑色页眉线、灰底摘要、作者与单位集中展示、作者—年份引用。
源论文的标题、作者、单位、邮箱、项目地址、研究内容和参考文献均已替换为占位内容。

这是组内写作与预印本的通用底稿。向会议或期刊投稿时，应迁移到目标出版方规定的模板。

## 1. 三分钟开始

1. 将整个文件夹压缩上传到 TeXPage / Overleaf，或导入随附 ZIP。不要只上传 `main.tex`。
2. 将主文件设为 `main.tex`，默认编译器选 **pdfLaTeX**，参考文献使用 **BibTeX**。
3. 修改 `metadata.tex` 中的标题、作者、单位、邮箱及资源链接。
4. 修改 `sections/` 中的正文，替换 `references.bib` 的占位条目。
5. 需要换字体、颜色或显示方式时，修改 `config.tex`。

本地编译（在本项目根目录执行）：

```sh
latexmk -pdf main.tex
```

没有 latexmk 时：

```sh
pdflatex main.tex
bibtex main
pdflatex main.tex
pdflatex main.tex
```

中文正文：将 `config.tex` 最后一项改为 `\LabChinesetrue`，并选择 XeLaTeX：

```sh
latexmk -xelatex main.tex
```

切换编译器后，若平台报告缓存冲突，清除缓存再编译。模板内置 Fandol 中文字体设置，
不要求组员安装宋体或某个操作系统字体。

## 2. 文件分工

| 文件 | 用途 |
| --- | --- |
| `main.tex` | 编译入口、章节顺序、参考文献入口；正文大小为 11pt |
| `config.tex` | 字体、颜色、字号和显示开关 |
| `metadata.tex` | 标题、作者、单位、角色、邮箱、项目地址 |
| `sections/*.tex` | 分章撰写的正文与附录 |
| `references.bib` | BibTeX 文献数据库；目前只有显式虚构的占位条目 |
| `figures/` | 图片目录；目前无具体论文图片 |
| `labpaper.cls` | 样式实现，普通组员通常无需编辑 |
| `docs/guide.tex`、`guide.pdf` | 可编辑中文说明源码及阅读版；独立使用 XeLaTeX 编译 |
| `main.pdf` | 使用默认配置编译的模板预览 |
| `NOTICE.md` | 原模板许可、来源及本次修改记录 |

## 3. 标题、页眉与日期

在 `metadata.tex` 中修改：

```latex
\title{Your Manuscript Title}
\LabRunningTitle{Short Running Title}
\LabDate{}                   % 不显示日期
% \LabDate{\today}           % 显示当前编译日期
% \LabDate{YYYY-MM-DD}       % 固定显示某个版本日期
```

短页眉可以避免长标题挤占页眉空间；标题太长时可在 `\title` 中用 `\\` 手工换行。
固定版本建议填写固定日期，避免每次编译产生日期变化。

## 4. 添加作者、单位和角色

每位作者用一条命令，三个参数依次是：**姓名、单位编号、角色列表**。
编号与角色用英文逗号分隔，角色键之间不要加空格。不带角色也要保留第三个空参数 `{}`。

```latex
\LabAuthor{Author One}{1,2}{core}
\LabAuthor{Author Two}{1}{corr}
\LabAuthor{Author Three}{2}{corr,lead}
\LabAuthor{Author Four}{1}{}

\LabAffiliation{1}{Laboratory, Institution, City, Country}
\LabAffiliation{2}{Department, Institution, City, Country}
```

| 角色键 | 自动上标 | 默认图例 |
| --- | --- | --- |
| `core` | `*` | Core Contributors |
| `corr` | `†` | Corresponding Authors |
| `lead` | `‡` | Project Leader |
| 空 `{}` | 无角色上标 | 不增加图例 |

单位编号和角色上标由模板组合，角色图例会根据实际使用情况出现，不必手写。
作者显示顺序由 `\LabAuthor` 的顺序决定；单位编号必须与 `\LabAffiliation` 一一对应。

### 多位通讯作者

给所有通讯作者加 `corr`，并填写邮箱。所有邮箱并列显示在同一行，前面不显示作者姓名：

```latex
\LabAuthor{Author Two}{1}{corr}
\LabAuthor{Author Three}{2}{corr,lead}
\LabEmail{author.two@example.org}
\LabEmail{author.three@example.org}
```

**角色和邮箱是两个独立设置。** `corr` 控制上标与图例，`\LabEmail` 控制
邮箱显示；添加通讯作者时应同时修改两处。邮箱用示例中的普通形式填写，命令会处理下划线。
旧版 `\LabCorrespondence{姓名}{邮箱}` 仍可使用，但姓名参数不再显示。

### Project Leader

如果 Project Leader 同时是论文作者，在其角色列表加入 `lead`：

```latex
\LabAuthor{Author Three}{2}{lead}
% 同时担任通讯作者和 Project Leader：
% \LabAuthor{Author Three}{2}{corr,lead}
```

多位作者都可加 `lead`，并把图例改为复数：

```latex
\renewcommand{\LabLeaderLabel}{Project Leaders}
```

如需单独说明未列入作者的项目负责人，可在 `metadata.tex` 取消下面一行的注释：

```latex
\LabProjectLead{Project Leader Name}
```

此命令仅增加项目负责人说明行，不会增加作者或单位。设置 `lead` 不会自动成为通讯作者。

### 共同一作 / 核心贡献者文字

`core` 默认写为 Core Contributors，不预设其等同于共同第一作者。
如组内需要表示等贡献，可修改图例：

```latex
\renewcommand{\LabCoreLabel}{Equal Contribution}
```

## 5. 项目主页、代码和数据地址

命令的三个参数是：**显示标签、实际 URL、链接文字**。

```latex
\LabResource{Project}{https://example.org/project}{Project page}
\LabResource{Code}{https://example.org/code}{Code repository}
\LabResource{Data}{https://example.org/data}{Dataset}
```

可重复添加。没有链接时删除或注释整行，不要留下 `example.org` 地址。

## 6. 修改字体与字号

在 `config.tex` 中只保留一个 `\LabFontProfile` 定义，将其参数改为所需选项：

| 值 | 正文字体 | 数学字体 | 用途 |
| --- | --- | --- | --- |
| `charter` | XCharter | newtxmath 的 Charter 配置 | 默认，接近参考项目 |
| `times` | newtxtext | newtxmath | Times 风格 |
| `modern` | Latin Modern | Latin Modern 数学字体 | LaTeX 常见风格 |

```latex
\newcommand{\LabFontProfile}{times}
```

这些是成对配置，不需要自己再加载 `times`、`mathpazo` 或 `unicode-math`。
默认方案无需系统字体文件。中文模式中此项控制西文字体，中文字体使用 Fandol。

正文基本字号在 `main.tex` 的类选项中修改，只选 `10pt`、`11pt` 或 `12pt`：

```latex
\documentclass[12pt,a4paper]{labpaper}
```

标题、作者、单位、一级标题字号在 `config.tex` 修改：

```latex
\newcommand{\LabTitleSize}{21}
\newcommand{\LabTitleLeading}{23}
\newcommand{\LabAuthorSize}{11}
\newcommand{\LabAffiliationSize}{10}
\newcommand{\LabSectionSize}{13}
```

行距应大于字号。字号增大或作者较多时，需重新检查首页和页眉，必要时缩短文字。

## 7. 修改颜色

`config.tex` 中的颜色值为 **6 位 HTML 十六进制数，不带 `#`**。修改现有定义，
不要把同一个 `\newcommand` 复制两次。

```latex
\newcommand{\LabTitleColor}{0000B3}         % 标题：深蓝
\newcommand{\LabHeadingColor}{000000}       % 章节标题：黑
\newcommand{\LabBodyColor}{000000}          % 正文：黑
\newcommand{\LabLinkColor}{000080}          % 引用、交叉引用、URL
\newcommand{\LabRuleColor}{000000}          % 页眉线
\newcommand{\LabAbstractBackground}{F2F2F2} % 摘要背景
\newcommand{\LabAbstractBorder}{B3B3B3}     % 摘要边框
\newcommand{\LabNoteColor}{B45309}          % 组内批注
```

局部文字颜色可直接使用已定义的颜色名：

```latex
\textcolor{LinkColor}{A short colored phrase}
{\color{red} This paragraph is red.}
```

大括号限定颜色范围。新颜色需在 `main.tex` 的 `\documentclass` 之后、
`\begin{document}` 之前定义，不能放进提前读取的 `config.tex`：

```latex
\definecolor{HighlightColor}{HTML}{0F766E}
% 正文中：\textcolor{HighlightColor}{Highlighted text}
```

若启用 `\LabMonochrometrue`，配置文件中的标题、正文、链接、线条和批注颜色会被统一
改为黑色，摘要使用灰色。该开关不改变外部图片或自行写死的 `\textcolor{red}`。

## 8. 目录、封面、附录与批注

在 `config.tex` 中把对应一行末尾的 `true` 改成 `false`，或反过来：

| 开关 | 默认 | 作用 |
| --- | --- | --- |
| `\LabCoverPagetrue` | 开 | 摘要后换页，保留参考项目的独立首页结构 |
| `\LabShowTOCtrue` | 开 | 插入独立目录页 |
| `\LabShowAppendixtrue` | 开 | 在参考文献后插入附录 |
| `\LabShowNotestrue` | 开 | 显示组内批注 |
| `\LabAnonymousfalse` | 关 | 打开时隐藏首页身份、邮箱、资源及致谢 |
| `\LabMonochromefalse` | 关 | 打开时使用黑白主题 |
| `\LabChinesefalse` | 关 | 打开时支持中文正文，需 XeLaTeX |

短论文常用设置：

```latex
\newif\ifLabCoverPage  \LabCoverPagefalse
\newif\ifLabShowTOC    \LabShowTOCfalse
```

这两行用于替换 `config.tex` 中已有的两行，不要额外重复声明 `\newif`。

批注示例：

```latex
\reviewnote[AB]{Please check this argument.}
```

关掉 `\LabShowNotes` 后整条批注不出现在 PDF 中，也不会留下占位空白。

匿名模式是排版辅助：它隐藏首页作者区、邮箱、项目资源和本模板的致谢段，并令 PDF 作者
元数据为空。它不会扫描正文、图片、参考文献、文件名或补充材料中的身份线索，也不会
隐藏源码中的 `metadata.tex`。双盲投稿仍需按目标要求人工检查。

## 9. 图、表、公式、引用

Figure 和 Table 的题注默认居中，包含多行题注。

所有 `\label` 建议带类型前缀（`sec:`、`fig:`、`tab:`、`eq:`）。图表的 `\label`
放在 `\caption` 后面。图表位置由 LaTeX 浮动规则安排，`[htbp]` 不保证原地显示。

```latex
\begin{figure}[htbp]
  \centering
  \includegraphics[width=0.9\linewidth]{figures/your-figure.pdf}
  \caption{Describe the figure.}
  \label{fig:example}
\end{figure}

\begin{equation}\label{eq:example}
  a^2+b^2=c^2.
\end{equation}

Figure~\ref{fig:example}; Equation~\eqref{eq:example}.
\citet{your-key}; \citep{your-key}.
```

新增章节时，在 `sections/` 建立 `.tex` 文件，并在 `main.tex` 添加相应的
`\input{sections/your-section}`。子文件不包含 `\documentclass` 或 `\begin{document}`。
默认结构为 Introduction、Related Work、Method、Experiments、Conclusion；
Related Work 是独立的一级章节，内容位于 `sections/related-work.tex`。

默认引用风格是 natbib 作者—年份，参考文献样式为 `plainnat`。如果组内改用数字引用，
在 `main.tex` 中加载类之后、正文之前加入 `\setcitestyle{numbers,square}`，
并把文末样式换为 `\bibliographystyle{unsrtnat}`。不要在 natbib 之上再加载 biblatex。

## 10. 常见问题与交付前整理

- `??` / `undefined citation`：核对键名；执行 LaTeX → BibTeX → LaTeX → LaTeX。
- `File ... not found`：检查文件是否上传、路径和大小写是否一致。先放入实际图片再引用。
- `Undefined control sequence`：确认未漏传 `labpaper.cls`，并检查命令拼写。
- `Unknown author role`：角色键仅支持 `core,corr,lead`；逗号之间不要有空格。
- 中文空白或字体缺失：将中文开关设为 true，并使用 XeLaTeX；本地安装完整中文 TeX 支持。
- 作者行太长：减少不必要头衔，或适当减小 `\LabAuthorSize`；模板会在作者之间自动换行。
- 页眉重叠：缩短 `\LabRunningTitle`。作者/标题字号大幅增加后需重新检查布局。
- 内容含特殊字符：普通文本中的 `& % $ # _ { }` 分别写作
  `\& \% \$ \# \_ \{ \}`；网址使用 `\url` 或本模板的资源命令。
- 需要特定期刊样式：迁移正文、图表和 BibTeX 数据，使用出版方的正式类文件。

对外发稿前替换全部方括号占位说明、Author One 等姓名、example.org 链接及虚构文献；
填写真实结果，删去附录中的写作示例，关闭批注，并核对作者顺序、角色和邮箱。

## 11. 中文说明书源码

在项目根目录执行以下命令，生成中文说明 PDF：

```sh
xelatex -jobname=guide docs/guide.tex
xelatex -jobname=guide docs/guide.tex
```

不要把 `docs/guide.tex` 设为论文项目的主文件。默认上传项目仍以 `main.tex` 为入口。
来源、改编与再分发说明见 `NOTICE.md`。
