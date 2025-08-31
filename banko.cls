% Please be sure to run the compiler at least 3 times to have all correct placement for the different parts of this document. It is recommended to run the compiler more than 3 times. I compile for release at least 4 times (Line number, svg and images alignments, text formatting and biber, fonts etc.).

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{banko}[A document class called banko]

\RequirePackage{kvoptions}
\RequirePackage{datetime}

\DeclareStringOption[ieee]{bibstyle}        % Citation style
\DeclareStringOption[english]{language}     % Language
\DeclareBoolOption{unicode}                 % Unicode
\DeclareBoolOption{placeins}                % Prevent floats from skipping sections
\ProcessKeyvalOptions*\relax

% Pass unknown to article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions\relax

% Base class: article with one-column layout
\LoadClass[onecolumn]{article}

\RequirePackage{chemfig}


% Load required packages
\RequirePackage[table,svgnames]{xcolor}           % Color
\RequirePackage{fontspec}         % Font
\RequirePackage[bottom]{footmisc} % Footnotes
\RequirePackage{lastpage}         % Last page
% \RequirePackage{luacode} Disabled
\RequirePackage[                                        % Title settings
%explicit,
compact,
% nobottomtitles,
]{titlesec}  
\RequirePackage{svg}
\RequirePackage{tipa}
\RequirePackage{alphalph}
\RequirePackage{float}
\RequirePackage{microtype}
\RequirePackage{tikz}
\usetikzlibrary{cd}

\RequirePackage{mathrsfs}

% Math typesetting
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amstext}
\RequirePackage{amsfonts}
\RequirePackage{bm}
\RequirePackage[most]{tcolorbox}

% Math structures
\RequirePackage{array}                                  % Arrays
\RequirePackage{empheq}                                 % Grouped equations
\RequirePackage{amsthm}                                 % Theorems
\RequirePackage{thmtools}                               % List of theorems


% Math and scientific symbols and utilities
\RequirePackage{siunitx}                                % Units
\sisetup{detect-all}
\RequirePackage[                                        % Chemistry typesetting
version=4
]{mhchem}
\RequirePackage{extarrows}                              % Labelled arrows and signs
\RequirePackage{gensymb}                                % Generic symbols for text and math mode
\RequirePackage{latexsym}                               % Additional symbols
\RequirePackage{optidef}                                % Bolza problems

% Links and cross-references
\RequirePackage[                                        % Links and cross-references
colorlinks = false,
allcolors  = blue,
unicode    = true
]{hyperref} % Adding Autoref
\RequirePackage{xurl}

\RequirePackage{titling}

\RequirePackage{graphicx} % Required for inserting images
\RequirePackage{lipsum}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{contour}                                % Underlines
\RequirePackage[                                        % Underlines: normalem to avoid underlining all \emph'sized words (bibliography entries)
normalem
]{ulem}

% Bibliography
\RequirePackage[
backend=biber,
style=ieee, % \BPN@bibstyle
citestyle=numeric-comp
]{biblatex}                                             % Biblatex citation engine and style
\RequirePackage[capitalise]{cleveref}                   % Chained citations
\RequirePackage{csquotes}                               % Recommended addition for citations
\RequirePackage[bottom]{footmisc}                       % Footnotes
\RequirePackage{enotez}


\RequirePackage{chemformula}
\RequirePackage{mhchem}

\RequirePackage{booktabs}

%\RequirePackage[htt]{hyphenat}
\RequirePackage{caption}                                % Captions
\RequirePackage{fmtcount}  

% Tables
\RequirePackage{tabularx}
\RequirePackage{array}	

%\captionsetup[table]{labelfont=bf, font=small, skip=6pt}
\renewcommand{\arraystretch}{1.3} % Increase line spacing
% Caption
\DeclareCaptionFormat{custom}{%
	\textcolor{gray!90}{\small\textbf{#1#2}}% "Figure X" part in darker grey
	\textcolor{gray}{\small\ #3}% caption text in lighter grey
}

\captionsetup{
	format=custom,
	labelfont=bf,
	singlelinecheck=true
}

\RequirePackage{xeCJK}


\setCJKmainfont{NotoSerifCJK}[
Path=./fonts/,
Extension=.ttc,
UprightFont=*,
BoldFont=*,
UprightFeatures	= {FontIndex=10},
BoldFeatures    = {FontIndex=30} % also 20
]

% Line spacing and compatibility
\linespread{1.1} % Adjust spacing for CJK text


\RequirePackage[overlap, CJK]{ruby}
% \renewcommand{\rubysize}{1}
\renewcommand{\rubysep}{0.1ex}

\RequirePackage[english]{babel}

% PAGE NUMBER MODE
% Roman Number for Pages
\newcommand{\romanPage}{
	\pagenumbering{Roman}
}

\newcommand{\arabicPage}{
	\pagenumbering{arabic}
}

\makeatletter

% Macro
\newcommand*{\BPNyear}[1]{\def\BPN@year{#1}}\BPNyear{}
\newcommand*{\BPNlocation}[1]{\def\BPN@location{#1}}\BPNlocation{}
\newcommand*{\BPNdates}[1]{\def\BPN@dates{#1}}\BPNdates{}

\newcommand*{\BPNmode}[1]{%
	\ifx\relax#1\relax % Check if no argument is provided
	\def\BPN@mode{0}% Default value is 0
	\else
	\def\BPN@mode{#1}% Set provided value
	\fi
}\BPNmode{}


\newcommand{\BPNcopyright}[2]{\def\BPN@copyright{Copyright \copyright\,#1 by #2. All rights reserved.}}
\newcommand*{\BPNarchive}[1]{\def\BPN@archive{#1}}\BPNarchive{}
\newcommand*{\BPNundertitle}[1]{\def\BPN@undertitle{#1}}\BPNundertitle{}
\newcommand*{\BPNsubundertitle}[1]{\def\BPN@subundertitle{#1}}\BPNsubundertitle{}
\newcommand*{\BPNRevision}[1]{\def\BPN@revision{#1}}\BPNRevision{}
\newcommand*{\BPNVersion}[1]{\def\BPN@version{#1}}\BPNVersion{}
\newcommand*{\BPNLogo}[1]{\def\BPN@logo{#1}}\BPNLogo{}
%\newcommand*{\BPNLogoMode}[1]{\def\BPN@logo{#1}}\BPNLogo{0}
% For 0 std position, 1 right to the titles etc.

\newcommand*{\BPNdoi}[1]{\def\BPN@doi{#1}}\BPNdoi{10.xxxx/xxxxx}

\newcounter{authcount}
\newcounter{contactauthor}
\NewDocumentCommand{\BPNauthor}{ s m m m }{%
	\stepcounter{authcount}%
	\csdef{BPN@author\theauthcount}{#2}%
	\csdef{BPN@affiliationID\theauthcount}{#3}%
	\csdef{BPN@emailID\theauthcount}{#4}%
	\IfBooleanT{#1}{\setcounter{contactauthor}{\theauthcount}}%
}

\newcounter{afficount}
\NewDocumentCommand{\BPNaffiliation}{ s m }{%
	\stepcounter{afficount}%
	\csdef{BPN@affiliation\theafficount}{#2}%
}

\newcounter{emailcount}
\NewDocumentCommand{\BPNemail}{ s m }{%
	\stepcounter{emailcount}%
	\csdef{BPN@email\theemailcount}{#2}%
}

% Footers & Headers
\RequirePackage{fancyhdr} % Load the fancyhdr package

% --- Fancy Header & Footer Setup ---
\pagestyle{fancy}

% Clear default
\fancyhf{}

% Header (top of page)
\fancyhead[L]{{\footnotesize\color{gray} Banko Version: \version~\BPN@copyright}}
\fancyhead[R]{{\footnotesize\color{gray}\BPN@dates}} % Right-aligned header

% Footer (bottom of page)
\fancyfoot[L]{{\footnotesize\color{gray}Archive ID: \BPN@year--\BPN@archive \quad Title: \@title}}
\fancyfoot[C]{}
\fancyfoot[R]{{\footnotesize\color{gray}Page {\color{important}\thepage}\ of \pageref{LastPage}}}

% Line thickness and color
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{\rulerthinkness}
\renewcommand{\footrule}{\hbox to\headwidth{\color{gray}\leaders\hrule height \footrulewidth\hfill}}

\fancypagestyle{titlepage}{
	\fancyhf{} % Clear all header and footer fields
	\fancyhead[C]{{\footnotesize\color{gray} Banko Version: \version~\BPN@copyright}} % Custom header
	\renewcommand{\headrulewidth}{0pt} % Header line thickness
	\renewcommand{\footrulewidth}{0pt} % No footer line
	
	\fancyfoot[L]{}
	\fancyfoot[C]{}
	\fancyfoot[R]{{\footnotesize\color{gray}Page {\color{important}\thepage}\ of \pageref{LastPage}}}
}

% Title page
\RequirePackage{ragged2e} % in preamble
\RequirePackage{eso-pic}

\renewcommand{\abstract}[1]{%
	\def\BPN@abstract{%
		\vspace*{1em}%
		{\noindent\bfseries Abstract\par\vspace{0.2em}}%
		\setlength{\parindent}{0.5cm}%
		\setlength{\parskip}{0pt}%
		\justifying % it is optional
		\noindent#1%
	}%
}

\newcommand{\subundertitleFormat}{%
	\ifx\BPN@subundertitle\empty
	% Do nothing
	\else
	\\ \BPN@subundertitle
	\fi
}

\renewcommand\maketitle{
	%\onecolumn
	\begingroup
	\global\@topnum\z@   % Prevents figures from going at top of page.
	\@maketitle
	\@thanks
	\endgroup
}
\def\@maketitle{%
	\begingroup
		\thispagestyle{titlepage}
		%\AddToShipoutPictureBG*{%
		%	\AtPageLowerLeft{%
		%		\includegraphics[width=\paperwidth,height=\paperheight]{./BG/Cover-BG.pdf}%
		%	}%
		%}

		{\noindent\DMSerifDisplay\huge\bfseries
			\setlength{\baselineskip}{0.7\baselineskip}
			\@title\par
		}
		{\noindent\Large \bfseries{\BPN@undertitle}  \bfseries{\large\subundertitleFormat{} }} {\itshape on \BPN@dates \space in \BPN@location}
		{Version \BPN@version \space Revision \BPN@revision \par}
				
		\noindent
		\makebox[\textwidth][c]{%
			\begin{minipage}[c][2cm][c]{\textwidth}
				\begin{center}
					\lineskip .5em%
					\newcounter{authnum}%
					\setcounter{authnum}{0}
					\whileboolexpr%
					{ test {\ifnumcomp{\value{authnum}}{<}{\theauthcount}} }%
					{%
						\stepcounter{authnum}%
						\mbox{								
							\ifboolexpr%
							{ test {\ifnumcomp{\value{authnum}}{=}{\thecontactauthor}}}%
							{\textit{\large\csuse{BPN@author\theauthnum}\textbf{\textsuperscript{{\csuse{BPN@emailID\theauthnum}}}}\textbf{\textsuperscript{{\csuse{BPN@affiliationID\theauthnum}}}}}}%
							{\textbf{\large\csuse{BPN@author\theauthnum}\textbf{\textsuperscript{{\csuse{BPN@emailID\theauthnum}}}}\textbf{\textsuperscript{{\csuse{BPN@affiliationID\theauthnum}}}}}}%					
							\ifboolexpr%
							{ test {\ifnumcomp{\value{authnum}}{=}{\thecontactauthor}}}%
							{\textbf{\textsuperscript{\kern-1pt$\conv$}}}%
							{}%
							\ifboolexpr%
							{ test {\ifnumcomp{\value{authnum}}{<}{\theauthcount}}}%
							{,~}%
							{}%
						}
					}%
				\end{center}
			\end{minipage}%
		}
				
		\begin{multicols}{2}
			{\small\itshape\selectfont%
				\newcounter{affinum}
				\whileboolexpr%
				{ test {\ifnumcomp{\value{affinum}}{<}{\theafficount}} }%
				{%
					\noindent
					\stepcounter{affinum}%
					\parbox{0.75em}{\normalfont\selectfont\textsuperscript{\alph{affinum}}}\csuse{BPN@affiliation\theaffinum}\par
				}%
			}
			
			{\small\itshape\selectfont%
				\newcounter{emailnum}
				\whileboolexpr%
				{ test {\ifnumcomp{\value{emailnum}}{<}{\theemailcount}} }%
				{%
					\noindent
					\stepcounter{emailnum}%
					\parbox{0.75em}{\normalfont\selectfont\textsuperscript{{\theemailnum}}}\uline{\csuse{BPN@email\theemailnum}}\par
				}%
			}
		\end{multicols}
		\vspace{-0.4cm}
		\noindent\parbox{0.75em}{\textsuperscript{*}}Corresponding Author
				
		{\BPN@logo\par}
		
		{\centering Archive-ID: \BPN@archive \space DOI: \BPN@doi \par}
		
		{\BPN@abstract\par}
		\vspace{1.5em}
		%\noindent\rule{\textwidth}{\rulerthinkness}
		\vspace{1em}	
	\endgroup
}


\def\version{1.5.7}
\def\rulerthinkness{0.4pt}
\setmainfont{Times New Roman}%[Scale= 1.1] % Times New Roman, Scale = 1


\newfontfamily{\DMSerifDisplay}{DMSerifDisplay}[
Path=./fonts/DMSerifDisplay/,
Extension=.ttf,
UprightFont=*-Regular,
ItalicFont  = *-Italic
]

%MATH
% Symbols
\let\@forall\forall
\renewcommand{\forall}{\ensuremath{\,\@forall\,}}
\DeclareRobustCommand{\vect}[1]{\vec{#1}}
\newcommand{\indep}{\ensuremath{\perp\!\!\!\perp}}

% Character definitions
\mathchardef\mathmul=\mathcode`*
\mathcode`*=\cdot

% Operators
\DeclareMathOperator{\E}{\mathbb{E}}
\DeclareMathOperator{\prob}{p}
\DeclareMathOperator{\tr}{tr}
\DeclareMathOperator{\diff}{\mathop{}\!{d}}
\DeclareMathOperator{\conv}{\ast}

% Equation spacing
\g@addto@macro\normalsize{%
	\setlength\abovedisplayskip{2.5pt}%
	\setlength\belowdisplayskip{7.5pt}%
	\setlength\abovedisplayshortskip{2.5pt}%
	\setlength\belowdisplayshortskip{7.5pt}%
}

% Footnotes
\renewcommand*{\thefootnote}{\footnotesize\color{important}\Roman{footnote}}

% Format
\RequirePackage[
margin=2cm,
top=2.5cm,
headsep=1cm,
bottom=2.5cm,
footskip=0.6in
]{geometry}
\renewcommand{\headwidth}{\textwidth}

\RequirePackage{calc}
\RequirePackage{physics}
\RequirePackage{bm}

\onecolumn
% Page layout rotation using only multicols: 1 -> 2 -> 3 -> 1...
\RequirePackage{multicol}

% --- Global toggle counter for page-level layout ---
\newcounter{colcounter}
\setcounter{colcounter}{1} % start with 1 column

% Track if a multicol environment is currently open (global or local)
\newif\ifmulticolopen
\multicolopenfalse

% --- Global toggle layout using only multicols ---
\newcommand{\togglelayout}{%
	% Close previous multicol if open
	\ifmulticolopen
\end{multicols}%
\multicolopenfalse
\fi

% Switch layout based on counter
\ifnum\value{colcounter}=1
	\setcounter{colcounter}{2}%
	\else\ifnum\value{colcounter}=2
	\begin{multicols}{2}%
		\multicolopentrue
		\setcounter{colcounter}{3}%
		\else
		\begin{multicols}{3}%
			\multicolopentrue
			\setcounter{colcounter}{1}%
			\fi\fi
		}
		
		% --- Local toggle to specific number of columns ---
		\newcommand{\toggleto}[1]{%
			% Close previous multicol if open
			\ifmulticolopen
		\end{multicols}%
		\multicolopenfalse
		\fi
		% Start new column layout locally
		\ifnum#1=1
		\else\ifnum#1=2
		\begin{multicols}{2}%
			\multicolopentrue
		\else\ifnum#1=3
		\begin{multicols}{3}%
			\multicolopentrue
		\else
		\PackageWarning{toggleto}{Invalid column number: #1, using 1 column}%
		\fi\fi\fi
		}
					
		% --- Safety at end of document ---
		\AtEndDocument{%
			\ifmulticolopen
		\end{multicols}%
		\multicolopenfalse
		\fi
		}
		
		
% Section
\newcommand{\sectionfont}{\normalfont}



\titleformat{\section}[block]
{\normalfont\normalsize\bfseries\sectionfont}
{\thesection}{1em}{}
[\titlerule]

\titleformat{\subsection}[block]
{\normalfont\normalsize\itshape}
{\thesubsection}{1em}{}
[] % No rule after subsection

\titleformat{\subsubsection}[block]
{\normalfont\normalsize\itshape}
{\thesubsubsection}{1em}{}
[] % No rule after subsubsection

\titleformat{\part}[block]
{\normalfont\Huge\bfseries}
{\thepart}{1em}{}
[]

% Custom section command with hierarchical numbering style x.y.z
\renewcommand{\thesection}{\arabic{section}} % Section format: 1, 2, 3...
\renewcommand{\thesubsection}{\thesection.\arabic{subsection}} % Subsection format: 1.1, 1.2, 1.3...
\renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}} % Subsubsection format: 1.1.1, 1.1.2, etc.
	
% Sidenotes

\RequirePackage{etoolbox, expl3}

% Counter for sidenotes and list storage
\newcounter{sidenote}
\newcommand{\sidenote@list}{} 

% Define sidenote command
\newcommand{\sidenote}[1]{%
	\refstepcounter{sidenote}% Increment counter
	\mbox{\textsuperscript{\color{important}\alph{sidenote}}}% Show reference in text
	\marginpar{\footnotesize\raggedright\strut
		\textsuperscript{\color{important}\alph{sidenote}} #1}% Display sidenote in margin
	% Store sidenote for Table of Sidenotes without repeating numbers
	\g@addto@macro\sidenote@list{%
		\item Sidenote:  #1%
	}
}

% Command to generate Table of Sidenotes
\newcommand{\sidenotestable}{%
	\newpage
	\section*{Table of Sidenotes}
	\begin{enumerate}
		\sidenote@list % Insert stored sidenotes
	\end{enumerate}
}

% Set margin width and spacing
\setlength{\marginparwidth}{.7in}
\setlength{\marginparsep}{.2in}
\reversemarginpar

\newcommand\elec{\mathrm{e^-}}
\newcommand\prot{\mathrm{p^+}}
\newcommand\neut{\mathrm{n^0}}

\newcommand{\appendices}{
	\clearpage
	\appendix
	\renewcommand{\thepart}{\Alph{part}} % Change part numbering to 
	\setcounter{part}{0} % Reset part counter to start from A
}

\tcbset{
	mycodebox/.style={
		colback=codebg,
		colframe=black!30,
		boxrule=0.5pt,
		arc=2pt,
		outer arc=2pt,
		boxsep=5pt,
		left=5pt,
		right=5pt,
		top=5pt,
		bottom=5pt,
		enhanced,
		breakable,
		sharp corners,
	}
}

\newcommand{\code}[1]{%
	\begin{tcolorbox}[mycodebox]
		\textcolor{codered}{\texttt{#1}}
	\end{tcolorbox}
}

\definecolor{codered}{RGB}{220, 50, 47}
\definecolor{codebg}{RGB}{245, 245, 245}

\tcbset{highlight code inline/.style={
		enhanced,
		boxsep=0pt,
		sharp corners,
		colback=codebg,
		colframe=codebg,
		boxrule=0pt,
		borderline west={0pt}{0pt}{codebg},
		borderline east={0pt}{0pt}{codebg},
		frame empty,
		interior style={fill=codebg},
		overlay={},
		before upper={\let\item\@item},
		breakable,
		size=fbox,
		box align=base,
		halign=left,
		valign=center,
}}

% Makro für inline-Code mit Umbruch
\newtcbox{\codeIN}{highlight code inline,
	on line,
	left=2pt, right=2pt, top=1pt, bottom=1pt,
	nobeforeafter,
	coltext=codered,
	fontupper=\ttfamily\footnotesize,
}

\newfloat{scheme}{htbp}{los}
\floatname{scheme}{Scheme}
\newfloat{chart}{htbp}{loc}
\floatname{chart}{Chart}
\newfloat{graph}{htbp}{loh}
\floatname{graph}{Graph}
%\newcommand*\schemename{Scheme}
%\newcommand*\chartname{Chart}
%\newcommand*\graphname{Graph}
\floatplacement{table}{htbp}
\floatplacement{figure}{htbp}
\floatstyle{plaintop}
\restylefloat{table}

\RequirePackage{ifthen}
\tcbuselibrary{skins, breakable} % Für schöne und flexible Boxen
\RequirePackage{xparse}         % Für \NewDocumentEnvironment etc.



\tcbset{
	mathblock/.style={
		colback=gray!5,
		colframe=gray!10,
		coltext=black!80,
		boxrule=0.2pt,
		arc=2pt,
		boxsep=5pt,
		left=5pt, right=5pt,
		top=-3pt,
		bottom=5pt,
		enhanced,
		breakable,
		before skip=10pt,
		after skip=10pt,
		valign=center,
		overlay={
			\vspace*{-5pt} % Inhalt 5pt nach oben ziehen
		},
	}
}

\NewDocumentEnvironment{mathboxenv}{}%
{%
	\begingroup

	\begin{tcolorbox}[mathblock]%
		}%
		{%
		\end{tcolorbox}%
		\endgroup
	}

% --- Originale Umgebungen sichern ---
\let\equationbox\equation
\let\endequationbox\endequation

\let\alignbox\align
\let\endalignbox\endalign

\let\eqnarraybox\eqnarray
\let\endeqnarraybox\endeqnarray

\let\oldDisplayMath\[
\let\oldEndDisplayMath\]

\RenewDocumentEnvironment{equation}{}%
{\begin{mathboxenv}\equationbox}%
	{\endequationbox\end{mathboxenv}}
	
\RenewDocumentEnvironment{eqnarray}{}%
{\begin{mathboxenv}\eqnarraybox}%
	{\endeqnarraybox\end{mathboxenv}}

\RenewDocumentEnvironment{align}{}%
{\alignbox}%
	{\endalignbox}

\renewcommand{\[}{\begin{mathboxenv}\oldDisplayMath}
	\renewcommand{\]}{\oldEndDisplayMath\end{mathboxenv}}

% Colors
\definecolor{important}{HTML}{AB2341} % Default headline color (blood red)
		
% Better \clearpage and \newpage
\fancypagestyle{blankpage}{
	\fancyhf{} % Clear all header and footer fields
	\fancyhead[C]{{\footnotesize\color{gray} Banko Version: \version~\BPN@copyright}} % Custom header
	\renewcommand{\headrulewidth}{0pt} % Header line thickness
	\renewcommand{\footrulewidth}{0pt} % No footer line
	
	\fancyfoot[L]{}
	\fancyfoot[R]{}
	\fancyfoot[C]{\null\vfill{\footnotesize\color{gray}Page {\color{important}\thepage}\ of \pageref{LastPage}}\null\vfill}
}

\newcommand{\blankpage}{
	\clearpage
	\thispagestyle{blankpage}
	\null\vfill
	\begin{center}
		\color{important!50}\textit{This page is left intentionally blank}
	\end{center}
	\vfill\null
	
	\AddToShipoutPictureBG*{%
		\AtPageLowerLeft{%
			\includegraphics[width=\paperwidth,height=\paperheight]{./BG/Front-Page-BG.pdf}%
		}%
	}
	
	\clearpage
}

% TODO: Right aligned language
% TODO: Box for small text and a mode that shifts all to right.

% Better ToC

\makeatother