\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{phdthesis}[2015/11/54 PhD thesis class for LaTeX]

%-------------------------------------------------------------------------------
% Information
%-------------------------------------------------------------------------------
% By Rob Stanley, robert.stanley.10@ucl.ac.uk
% Latest version at: http://github.com/robjstan/latex-phdthesis

% A PhD thesis class for \LaTeX that attempts to follow the UCL thesis requirements.

% Currently only compilation with XeLaTeX/LuaLaTeX is supported.

%-------------------------------------------------------------------------------
% Declare options
%-------------------------------------------------------------------------------

\RequirePackage{xkeyval}

\DeclareOptionX{11pt}{
	\PassOptionsToClass{\CurrentOption}{memoir}
}

\DeclareOptionX{a4paper}{
	\PassOptionsToClass{\CurrentOption}{memoir}
}

\DeclareOptionX{twoside}{
	\PassOptionsToClass{\CurrentOption}{memoir}
}

\DeclareOptionX{openright}{
	\PassOptionsToClass{\CurrentOption}{memoir}
}

\DeclareOptionX*{
	\PassOptionsToClass{\CurrentOption}{memoir}
}

\ExecuteOptionsX{11pt,a4paper,twoside,openright}

\ProcessOptionsX
\LoadClass{memoir}


%-------------------------------------------------------------------------------
% Required packages
%-------------------------------------------------------------------------------

\PassOptionsToPackage{final}{graphicx}
\RequirePackage{xspace} % spaces in macros
\RequirePackage{xcolor}

%-------------------------------------------------------------------------------
% Math mode
%-------------------------------------------------------------------------------

\RequirePackage[fleqn]{mathtools}
\RequirePackage{amssymb}
\RequirePackage{amsfonts}

% allow page breaks in math mode
\allowdisplaybreaks

%-------------------------------------------------------------------------------
% Font setup
%-------------------------------------------------------------------------------

\RequirePackage{fontspec}
\RequirePackage{unicode-math}
\RequirePackage{csquotes}
\RequirePackage[british]{babel}     % British hypernation

\defaultfontfeatures{Scale=MatchLowercase}
\setmainfont[Ligatures={Common, TeX}]{TeX Gyre Pagella}
\setmathfont{TG Pagella Math}

\RequirePackage{microtype}
\microtypesetup{final, babel=true, factor=1200}

\RequirePackage{ifluatex}
\ifluatex
	\microtypesetup{tracking=true}
	
	% correct smallcaps
	\expandafter\def\expandafter\scshape\expandafter{\scshape\microtypesetup{tracking=false}}

	% disable ligatures in smallcaps
	\DisableLigatures[ff,ffi,fj,fi,th]{encoding = *, family = sc* }
\fi

% protrusion for superscript numbers
\SetProtrusion{encoding={*},family={bch},series={*},size={6,7}}
              {1={ ,750},2={ ,500},3={ ,500},4={ ,500},5={ ,500},
               6={ ,500},7={ ,600},8={ ,500},9={ ,500},0={ ,500}}

% double spacing
\RequirePackage{setspace}
\OnehalfSpacing

\setlength{\parindent}{1em} % paragraph indent
\setlength{\parskip}{0pt plus 0.1em} % stop parskip
\setlength{\mathindent}{\parindent} % set indent to paragraph indent

%-------------------------------------------------------------------------------
% Titles
%-------------------------------------------------------------------------------

% section numbers hanging into left margin
\hangsecnum
\chapterstyle{hangnum}

% fonts
\renewcommand*{\chaptitlefont}{\Huge\raggedright}
\setsecheadstyle{\LARGE\raggedright}
\setsubsecheadstyle{\Large\raggedright}
\setsubsubsecheadstyle{\large\raggedright}

%-------------------------------------------------------------------------------
% Page geometry
%-------------------------------------------------------------------------------

\RequirePackage{geometry}

\geometry{top=40mm, bottom=45mm, outer=40mm, inner=40mm,
		  marginparwidth=25mm, marginparsep=5mm, headsep=5mm,
		  footskip=15mm}
		  
\reversemarginpar

%-------------------------------------------------------------------------------
% Headers and footers
%-------------------------------------------------------------------------------

% headers
\nouppercaseheads
\createmark{chapter}{left}{nonumber}{}{}
\createmark{section}{right}{nonumber}{}{}

\newlength{\pagenumpadd}
\setlength{\pagenumpadd}{11pt}
\addtolength{\pagenumpadd}{5mm}

% plain style
\makeevenhead{plain}{\hspace{-\pagenumpadd}\makebox[\pagenumpadd]{\thepage}\textsc{\leftmark}}{}{}
\makeoddhead{plain}{}{}{\textsc{\rightmark}\makebox[\pagenumpadd]{\hfill\thepage}\hspace{-\pagenumpadd}}
\makeoddfoot{plain}{}{}{}
\makeevenfoot{plain}{}{}{}

% chapter style
\makepagestyle{chapter}
\copypagestyle{chapter}{plain}
\makeevenhead{chapter}{\hspace{-\pagenumpadd}\makebox[\pagenumpadd]{\thepage}}{}{}
\makeoddhead{chapter}{}{}{\makebox[\pagenumpadd]{\hfill\thepage}\hspace{-\pagenumpadd}}

\pagestyle{plain}

%-------------------------------------------------------------------------------
% Table of contents
%-------------------------------------------------------------------------------

% font
\renewcommand*{\cftchapterfont}{\large}
\renewcommand*{\cftchapterpagefont}{\large}
\renewcommand{\cftchapterdotsep}{\cftdotsep}

% dot mark
\renewcommand{\cftdot}{.}

% section depth
\setsecnumdepth{subsubsection}
\maxtocdepth{subsubsection}

%-------------------------------------------------------------------------------
% Figures and captions
%-------------------------------------------------------------------------------

\RequirePackage[figuresright]{rotating} % rotated figures
\RequirePackage{array,booktabs} % more table options

%\DisemulatePackage{caption}
%\RequirePackage{caption}	% better (sub)caption controls

%\DeclareCaptionSubType*{figure}
%\DeclareCaptionSubType*{table}

\RequirePackage{subfig}

% make floats appear quickly
\renewcommand{\floatpagefraction}{.1}

% make subfigures capital lettered
\renewcommand\thesubfigure{\textsf{\Alph{subfigure}}}
\makeatletter\renewcommand\p@subfigure{\thefigure}\makeatother

% setup captions
\captionsetup{indention=\parindent, labelfont={bf}, labelsep=quad}

% setup subcaptions
\captionsetup[subfigure]{labelformat=simple, labelsep=quad,
						 labelfont=bf, singlelinecheck=off,
						 justification=centering}
					
% \subcap for referring to subcaptions in the main caption
%\newcommand{\subcap}[1]{\textbf{\protect\subref{#1}}\xspace}

%-------------------------------------------------------------------------------
% Bibliography
%-------------------------------------------------------------------------------

\RequirePackage[
  backend=biber, 
  bibencoding=utf8, 
  useprefix=true,%
	uniquename=false, 
  uniquelist=false, %
	style=authoryear, 
  firstinits=true, 
  dashed=false, %
	maxcitenames=2, 
  maxbibnames=99
]{biblatex}
\renewcommand{\cite}[1]{\parencite{#1}}

\renewcommand*{\multicitedelim}{\addcomma\space}


				
% bibliography paragraphs
\setlength{\bibhang}{\parindent}
\setlength{\bibitemsep}{\parskip}
\renewcommand*{\bibfont}{\raggedright}

% remove month
\AtEveryBibitem{\clearfield{month}}

% final and = &
\renewcommand*{\finalnamedelim}{%
  \ifnumgreater{\value{liststop}}{2}{}{}%
  \addspace \& \space}
  
% no "In: "
\renewbibmacro{in:}{%
  \ifentrytype{article}{}{\printtext{\bibstring{in}\intitlepunct}}}

% volume (number)
\renewbibmacro*{volume+number+eid}{%
  \printfield{volume}%
  \printfield{number}%
  \setunit{\addcomma\space}%
  \printfield{eid}}
\DeclareFieldFormat[article]{volume}{\mkbibbold{#1}}
\DeclareFieldFormat[article]{number}{\mkbibparens{#1}}

% no page prefix
\DeclareFieldFormat{pages}{#1}

% all names last-first
\DeclareNameAlias{sortname}{last-first}

% Try for smaller dois in bib


% remove final dot. This is nicer for dois.
\renewcommand{\finentrypunct}{}

                               		
%-------------------------------------------------------------------------------
% Labels
%-------------------------------------------------------------------------------

\RequirePackage{hyperref}
\hypersetup{final, colorlinks, linkcolor=black, citecolor=black,
			  urlcolor=black,
        pdfsubject={PhD Thesis on pathogen richness in bats},
        pdfkeywords={chiroptera, bats, zoonotic disease, pathogen richness, ecology},
        pdfauthor={Tim Lucas},
        pdftitle={The role of social ecology in Chiropteran pathogen richness and zoonotic potential},
    }

\usepackage{url}

%% Define a new 'leo' style for the package that will use a smaller font.
\makeatletter
\def\url@leostyle{%
  \@ifundefined{selectfont}{\def\UrlFont{\sf}}{\def\UrlFont{\small\rmfamily}}}
\makeatother
%% Now actually use the newly defined style.
\urlstyle{leo}


\RequirePackage[noabbrev]{cleveref}
\creflabelformat{equation}{#2#1#3}
\crefrangelabelformat{equation}{#3#1#4 to #5#2#6}
                               		
%-------------------------------------------------------------------------------
% Table of contents
%-------------------------------------------------------------------------------

\RequirePackage{ifthen}

\def\thedegree{Doctor of Philosophy}
\def\theuniversity{}
\def\theprimarysv{}
\def\thesecondarysv{}
\newcommand{\university}[1]{\def\theuniversity{#1}}
\newcommand{\unidegree}[1]{\def\thedegree{#1}}
\newcommand{\primarysupervisor}[1]{\def\theprimarysv{#1}}
\newcommand{\secondarysupervisor}[1]{\def\thesecondarysv{#1}}

\renewcommand{\maketitle}[1]{%
\begin{titlingpage*}%
    \vspace*{\fill}%
    \begin{center}%
    \begin{minipage}{1.0\textwidth}%
        {\HUGE\renewcommand{\baselinestretch}{2}\thetitle}\par%
        \vspace{1.25cm}%
        \emph{\LARGE\theauthor}\par%
	    \vspace{1.25cm}%
	    A thesis submitted in partial fulfilment of the\\requirements for the degree of:\par%
	    \vspace{0.5cm}%
	    {\LARGE\emph{\thedegree} \ifthenelse{\equal{\theuniversity}{}}{}{of\\[0.3cm]\emph{\theuniversity}}}\par%
	    \vspace{0.5cm}%
	    {\LARGE\the\year}\par%
    	\vspace{2.5cm}%
    	\ifthenelse{\equal{\theprimarysv}{}}{}{Primary supervisor:\\\emph{\theprimarysv}\par}%
    	\ifthenelse{\equal{\thesecondarysv}{}}{}{\vspace{0.5cm}Secondary supervisor:\\\emph{\thesecondarysv}\par}%
	\end{minipage}%
    \end{center}%
    \vspace*{\fill}%
\end{titlingpage*}%
\cleardoublepage%
\thispagestyle{chapter}%
\vspace*{\fill}%
\begin{quote}
    \textit{I, \theauthor, confirm that the work presented in this thesis
is my own. Where information has been derived from other sources,
I confirm that this has been indicated in the thesis.}
\end{quote}%
\vspace*{\stretch{2}}}
                               		
%-------------------------------------------------------------------------------
% Other preamble
%-------------------------------------------------------------------------------

\renewenvironment{abstract}{\cleardoublepage\chapter*{Abstract}\itshape}{}
\newenvironment{acknowledgements}{\thispagestyle{chapter}\chapter*{Acknowledgements}\markboth{Acknowledgements}{}}{}

\let\savedtocdef\tableofcontents
\renewcommand{\tableofcontents}{\cleardoublepage\thispagestyle{chapter}\savedtocdef}

\let\savedtofdef\listoffigures
\renewcommand{\listoffigures}{\cleardoublepage\thispagestyle{chapter}\savedtofdef}

\let\savedtotdef\listoftables
\renewcommand{\listoftables}{\cleardoublepage\thispagestyle{chapter}\savedtotdef}

\endinput
