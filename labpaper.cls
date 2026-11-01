% labpaper.cls -- generic group manuscript class, version 1.1 (2026-11-01).
% Adapted from thuc3i.cls supplied by the user through TeXPage:
% https://tex.nju.edu.cn/share/b06399ae7af64309ace7ca896c544124
% The supplied class declares CC BY-SA 4.0 and credits earlier template work
% through its version history and a contact at shakir@. See NOTICE.md.
% This adapted class is also distributed under CC BY-SA 4.0.
% Changes: renamed class; consolidated options/fonts; rebuilt metadata/roles;
% fixed abstract and title handling; removed institution logos and paper data.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{labpaper}[2026/11/01 v1.1 Generic group manuscript]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

\RequirePackage{iftex,etoolbox}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{amsmath,amssymb,amsthm,mathtools}
\ifPDFTeX
  \RequirePackage[utf8]{inputenc}
  \RequirePackage[T1]{fontenc}
\fi
\ifdefstring{\LabFontProfile}{charter}{%
  \RequirePackage{XCharter}
  \RequirePackage[xcharter,bigdelims,vvarbb]{newtxmath}
}{\ifdefstring{\LabFontProfile}{times}{%
  \RequirePackage{newtxtext}
  \RequirePackage{newtxmath}
}{\ifdefstring{\LabFontProfile}{modern}{%
  \RequirePackage{lmodern}
}{\ClassError{labpaper}{Unknown font profile: \LabFontProfile}
  {Use charter, times, or modern in config.tex.}}}}
\RequirePackage[scaled=1.1]{zlmtt}
\RequirePackage[english]{babel}
\ifLabChinese
  \ifXeTeX
    \RequirePackage[UTF8,scheme=plain,fontset=fandol]{ctex}
  \else
    \ClassError{labpaper}{Chinese mode requires XeLaTeX}
      {Select XeLaTeX in your editor, or set LabChinese to false.}
  \fi
\fi
\RequirePackage{microtype}
\RequirePackage[a4paper,left=2.2cm,right=2.2cm,top=3cm,bottom=3cm,
  headheight=28pt,headsep=20pt]{geometry}
\RequirePackage{graphicx,booktabs,tabularx,array}
\RequirePackage{enumitem,caption,subcaption}
\RequirePackage{fancyhdr,titlesec}
\RequirePackage[most]{tcolorbox}
\RequirePackage[authoryear,round]{natbib}
\RequirePackage{xurl}
\RequirePackage[colorlinks=true]{hyperref}

\definecolor{TitleColor}{HTML}{\LabTitleColor}
\definecolor{HeadingColor}{HTML}{\LabHeadingColor}
\definecolor{BodyColor}{HTML}{\LabBodyColor}
\definecolor{LinkColor}{HTML}{\LabLinkColor}
\definecolor{RuleColor}{HTML}{\LabRuleColor}
\definecolor{AbstractBackground}{HTML}{\LabAbstractBackground}
\definecolor{AbstractBorder}{HTML}{\LabAbstractBorder}
\definecolor{NoteColor}{HTML}{\LabNoteColor}
\ifLabMonochrome
  \colorlet{TitleColor}{black}\colorlet{HeadingColor}{black}
  \colorlet{BodyColor}{black}\colorlet{LinkColor}{black}
  \colorlet{RuleColor}{black}\colorlet{NoteColor}{black}
  \colorlet{AbstractBackground}{gray!5}\colorlet{AbstractBorder}{gray!40}
\fi
\hypersetup{linkcolor=LinkColor,citecolor=LinkColor,urlcolor=LinkColor,
  pdfcreator={LaTeX with labpaper.cls}}
\urlstyle{same}
\setlength{\parindent}{0pt}
\setlength{\parskip}{0.5\baselineskip}
\setlist{noitemsep,topsep=3pt}
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}
\AtBeginDocument{\color{BodyColor}}

% Metadata uses separate names, affiliation numbers and role keys.
\newif\iflab@core
\newif\iflab@corr
\newif\iflab@lead
\newcommand{\LabCoreLabel}{Core Contributors}
\newcommand{\LabCorrespondingLabel}{Corresponding Authors}
\newcommand{\LabLeaderLabel}{Project Leader}
\newcommand{\lab@authors}{}
\newcommand{\lab@affiliations}{}
\newcommand{\lab@contacts}{}
\newcommand{\lab@resources}{}
\newcommand{\lab@projectlead}{}
\newcommand{\lab@date}{}
\newcommand{\lab@runningtitle}{}
\newcommand{\LabRunningTitle}[1]{\gdef\lab@runningtitle{#1}}
\newcommand{\LabDate}[1]{\gdef\lab@date{#1}}
\newcommand{\LabProjectLead}[1]{\gdef\lab@projectlead{#1}}
\newcommand{\lab@registerrole}[1]{%
  \ifstrequal{#1}{core}{\global\lab@coretrue}{%
  \ifstrequal{#1}{corr}{\global\lab@corrtrue}{%
  \ifstrequal{#1}{lead}{\global\lab@leadtrue}{%
    \ClassError{labpaper}{Unknown author role: #1}{Use core,corr,lead without spaces.}}}}}
\newcommand{\lab@rolesymbol}[1]{%
  \ifstrequal{#1}{core}{*}{%
  \ifstrequal{#1}{corr}{\ensuremath{\dagger}}{%
  \ifstrequal{#1}{lead}{\ensuremath{\ddagger}}{}}}}
\newcommand{\lab@printauthor}[3]{%
  \mbox{#1\textsuperscript{\normalfont#2\forcsvlist{\lab@rolesymbol}{#3}}}%
  \hspace{1em plus 0.3em minus 0.2em}\ignorespaces}
\newcommand{\LabAuthor}[3]{%
  \forcsvlist{\lab@registerrole}{#3}%
  \gappto\lab@authors{\lab@printauthor{#1}{#2}{#3}}}
\newcommand{\LabAffiliation}[2]{%
  \gappto\lab@affiliations{\noindent\textsuperscript{#1}~#2\par}}
\newcommand{\LabEmail}[1]{%
  \ifdefempty{\lab@contacts}{}{\gappto\lab@contacts{\quad\allowbreak}}%
  \gappto\lab@contacts{\href{mailto:#1}{\nolinkurl{#1}}}}
% Compatibility with v1.0: the author-name argument is no longer displayed.
\newcommand{\LabCorrespondence}[2]{\LabEmail{#2}}
\newcommand{\LabResource}[3]{%
  \gappto\lab@resources{\noindent\textbf{#1:} \href{#2}{#3}\quad\allowbreak}}

\newcommand{\lab@header}{%
  \ifdefempty{\lab@runningtitle}{\@title}{\lab@runningtitle}}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[C]{\small\lab@header}
\fancyfoot[C]{\small\thepage}
\renewcommand{\headrulewidth}{1pt}
\renewcommand{\footrulewidth}{0pt}
\let\lab@headrule\headrule
\renewcommand{\headrule}{\begingroup\color{RuleColor}\lab@headrule\endgroup}
\fancypagestyle{firststyle}{%
  \fancyhf{}
  \fancyhead[L]{\parbox[b]{0.78\textwidth}{\small\bfseries\lab@header}}
  \fancyhead[R]{\small\itshape\lab@date}}

\renewcommand{\maketitle}{%
  \thispagestyle{firststyle}
  \begingroup
    \setlength{\parskip}{0pt}
    {\raggedright\color{TitleColor}\bfseries
      \fontsize{\LabTitleSize}{\LabTitleLeading}\selectfont\@title\par}
    \vspace{11pt}
    \ifLabAnonymous
      {\fontsize{\LabAuthorSize}{15}\selectfont Anonymous Authors\par}
    \else
      {\raggedright\fontsize{\LabAuthorSize}{16}\selectfont\lab@authors\par}
      \vspace{5pt}
      {\fontsize{\LabAffiliationSize}{13}\selectfont\lab@affiliations}
      \vspace{5pt}
      {\small\bfseries
        \iflab@core\textsuperscript{*}\LabCoreLabel\quad\fi
        \iflab@corr\textsuperscript{\ensuremath{\dagger}}\LabCorrespondingLabel\quad\fi
        \iflab@lead\textsuperscript{\ensuremath{\ddagger}}\LabLeaderLabel\fi\par}
      \ifdefempty{\lab@projectlead}{}{\vspace{4pt}{\small
        \textbf{\LabLeaderLabel:} \lab@projectlead\par}}
      \ifdefempty{\lab@contacts}{}{\vspace{4pt}{\small\noindent\lab@contacts\par}}
      \ifdefempty{\lab@resources}{}{\vspace{4pt}{\small\lab@resources\par}}
    \fi
  \endgroup
  \vspace{8pt}
  \hypersetup{pdftitle={\@title},pdfauthor={}}}

% Abstract is a normal breakable environment; no hidden content capture.
\renewenvironment{abstract}{%
  \begin{tcolorbox}[breakable,colback=AbstractBackground,colframe=AbstractBorder,
    boxrule=0.5pt,arc=2mm,left=8pt,right=8pt,top=8pt,bottom=8pt,
    before skip=4pt,after skip=10pt]
  \small\textbf{Abstract}\par\smallskip\ignorespaces
}{\end{tcolorbox}}
\newcommand{\keywords}[1]{\par\smallskip\textbf{Keywords:} #1}

\titleformat{\section}{\color{HeadingColor}\bfseries
  \fontsize{\LabSectionSize}{16}\selectfont}{\thesection.}{0.5em}{}
\titleformat{\subsection}{\color{HeadingColor}\bfseries}{\thesubsection.}{0.5em}{}
\titleformat{\subsubsection}{\color{HeadingColor}\bfseries\itshape}
  {\thesubsubsection.}{0.5em}{}
\titlespacing*{\section}{0pt}{3ex plus 4pt minus 3pt}{5pt}
\titlespacing*{\subsection}{0pt}{2.5ex plus 3pt minus 2pt}{2pt}
\titlespacing*{\subsubsection}{0pt}{2ex plus 2pt minus 1pt}{2pt}
\DeclareCaptionLabelSeparator{pipe}{ $\vert$ }
\captionsetup{labelfont=bf,labelsep=pipe,justification=centering,
  singlelinecheck=false,font=small}

\newtheorem{theorem}{Theorem}[section]
\newtheorem{lemma}[theorem]{Lemma}
\theoremstyle{definition}
\newtheorem{definition}[theorem]{Definition}
\newcommand{\reviewnote}[2][Note]{%
  \ifLabShowNotes\textcolor{NoteColor}{\textbf{[#1: #2]}}\fi}
\endinput
