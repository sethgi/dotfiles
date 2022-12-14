 
% HMC Math dept HW class file
% v0.04 by Eric J. Malm, 10 Mar 2005
% Improvements by Seth Isaacson, 26 August 2020
%%% IDENTIFICATION --------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}[1995/01/01]
\ProvidesClass{betterpsets}
    [2005/03/10 v0.04 HMC Math Dept problem set class. Updated by Seth Isaacson, 26 August 2020]

%%% INITIAL CODE ----------------------------------------------------------

% test whether the document is being compiled with PDFTeX
\RequirePackage{ifpdf}


%%% DECLARATION OF OPTIONS ------------------------------------------------
%% Header Options: header*, no header
\newif\ifhmcpset@header

% no header block in upper right hand corner
\DeclareOption{noheader}{%
    \hmcpset@headerfalse%
}

% do print header block
\DeclareOption{header}{%
    \hmcpset@headertrue%
}

%% Font Options: palatino*, cm
\newif\ifhmcpset@palatino

% use palatino fonts
\DeclareOption{palatino}{%
    \hmcpset@palatinotrue%
}

% use compuer modern fonts
\DeclareOption{cm}{%
    \hmcpset@palatinofalse%
}

%% Problem Boxing: boxed*, unboxed
\newif\ifhmcpset@boxed

% box problem statements
\DeclareOption{boxed}{%
    \hmcpset@boxedtrue%
}
   
% don't box problem statements
\DeclareOption{unboxed}{%
    \hmcpset@boxedfalse%
}
   
% pass remaining options to article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

%%% EXECUTION OF OPTIONS --------------------------------------------------
%% default to:
% including header, 
% loading mathpazo package for palatino fonts,
% boxing problem statements
\ExecuteOptions{header,palatino,boxed}

\ProcessOptions

%%% PACKAGE LOADING -------------------------------------------------------
%% based on std article class
\LoadClass{article}


%% Font loading: Palatino text/math fonts
\ifhmcpset@palatino
    \RequirePackage{mathpazo}
\fi

%% AMSLaTeX math environments and symbols
\RequirePackage{amsmath}
\RequirePackage{amssymb}

%% boxed minipage for boxed problem environment
\RequirePackage{boxedminipage}

%%% MAIN CODE -------------------------------------------------------------
%% Tell dvips/pdflatex correct page size
\ifpdf
  \AtBeginDocument{%
    \setlength{\pdfpageheight}{\paperheight}%
    \setlength{\pdfpagewidth}{\paperwidth}%
  }
\else
  \AtBeginDvi{\special{papersize=\the\paperwidth,\the\paperheight}}%
\fi


%% Problem set environments
% boxed problem environment
\newenvironment{problem}[1][]{%
  \ifhmcpset@boxed\def\hmcpset@probenv{boxed}\else\def\hmcpset@probenv{}\fi%
  \bigskip% put space before problem statement box %
  \noindent\begin{\hmcpset@probenv minipage}{\columnwidth}%
  \def\@tempa{#1}%
  \ifx\@tempa\empty\else%
    \hmcpset@probformat{#1}\hspace{0.5em}%
  \fi%
}{%
  \end{\hmcpset@probenv minipage}%
}
% display optional argument to problem in bold
\let\hmcpset@probformat\textbf

% solution environment with endmark and optional argument
\newenvironment{solution}[1][]{%
  \begin{trivlist}%
  \def\@tempa{#1}%
  \ifx\@tempa\empty%
    \item[]%
  \else%
    \item[\hskip\labelsep\relax #1]%
  \fi%
}{%
  \mbox{}\penalty10000\hfill\hmcpset@endmark%
  \end{trivlist}%
}

% default endmark is small black square
\def\hmcpset@endmark{\ensuremath{\scriptscriptstyle\blacksquare}}

%% Problem set list, for top of document
\newcommand{\problemlist}[1]{\begin{center}\large\sffamily{#1}\end{center}}

%% commands for upper-right id header block
\newcommand{\headerblock}{%
\begin{flushright}
\mbox{\hmcpset@name}\protect\\
\mbox{\hmcpset@class}\protect\\
\mbox{\hmcpset@assignment}\protect\\
\hmcpset@duedate%
\ifx\hmcpset@extraline\empty\else\protect\\\hmcpset@extraline\fi%
\end{flushright}%
}

% put id header block at start of document
\ifhmcpset@header\AtBeginDocument{\headerblock}\fi

% internal state for headerblock
\def\hmcpset@name{}
\def\hmcpset@class{}
\def\hmcpset@assignment{}
\def\hmcpset@duedate{}
\def\hmcpset@extraline{}

% commands to set header block info
\newcommand{\name}[1]{\def\hmcpset@name{#1}}
\newcommand{\class}[1]{\def\hmcpset@class{#1}}
\newcommand{\assignment}[1]{\def\hmcpset@assignment{#1}}
\newcommand{\duedate}[1]{\def\hmcpset@duedate{#1}}
\newcommand{\extraline}[1]{\def\hmcpset@extraline{#1}}


% Seth's Modifications
\RequirePackage[margin=0.5in]{geometry}

\newcommand{\floor}{\sfloor*}
\newcommand{\B}{\Leftarrow}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\C}{\mathbb{C}}
\renewcommand{\O}{\mathcal{O}}
\newcommand{\K}{\mathcal{K}}
\renewcommand{\P}{\mathcal{P}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\F}{\mathbb{F}}

\newcommand{\ve}{\varepsilon}

\newcommand{\bp}[1]{\begin{problem} \textbf{Problem #1:}}
\newcommand{\bpp}[3]{\begin{problem}\textbf{ Problem #1: #2 \hspace{2pt} [#3 points]}}
\newcommand{\bppl}[3]{ \noindent \textbf{\textbf{Problem #1: #2 [#3 Points]}} \\}
\newcommand{\epl}{\leavevmode \\ \noindent\rule{\textwidth}{1pt}}

\newcommand{\ep}{\end{problem}}
\newcommand{\bs}{\begin{solution}}
\newcommand{\es}{\end{solution} \clearpage}

%parts
\newcommand{\pp}[1]{\noindent \textbf{#1)} \\}

%Simple sets, sequences, etc
\newcommand{\pair}[2]{ \{ #1,#2 \} }
\newcommand{\set}[1]{ \{ #1 \} }

% Override bad default commands
\renewcommand{\bar}[1]{\overline{#1}}
\let\baseeps\eps
\let\epsiolon\varepsilon
\let\varepsilon\baseeps
\let\basephi\phi
\let\phi\varphi
\let\varphi\basephi

\newcommand{\inv}[1]{#1^{-1}}

\newcommand{\collab}[1]{\noindent \textbf{Collaborated with:} #1 \vspace{0.25cm}}
\newcommand{\reflection}[1]{\vspace{0.5cm} \textbf{Self Reflection: } #1}

% Various conveniences
\newcommand{\lcm}{\text{lcm}}
\newcommand{\where}{\ensuremath{\ | \ }}
\renewcommand{\mod}{\text{mod}\ }
\newcommand{\nsub}{\trianglelefteq}

\newcommand{\infdiv}{D\infdivx}
\DeclarePairedDelimiter{\norm}{\lVert}{\rVert}

\DeclareMathOperator*{\argmax}{arg\,max}
\DeclareMathOperator*{\argmin}{arg\,min}

