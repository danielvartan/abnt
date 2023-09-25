% tesesusp.cls, v-0.0.1

% Based on 'bntex2ppgsi.cls' and 'abntex2.csl'.
% See <https://www.overleaf.com/project/64f7bdf1641ad4a3a8482800>.
% to learn more.

\usepackage{anyfontsize}


% Declaration of the abntex2 class as an extension of the memoir class

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tesesusp}[2014/01/26 v1.9.2 abnTeX2]

\RequirePackage{ifthen}

%% Capture the options 'article' and 'twocolumn'.
\providecommand{\ABNTEXisarticle}{false}
\DeclareOption{article}{
	\renewcommand{\ABNTEXisarticle}{true}
	\PassOptionsToClass{article}{memoir}%}
}
\providecommand{\ABNTEXistwocolumn}{false}
\DeclareOption{twocolumn}{
	\renewcommand{\ABNTEXistwocolumn}{true}
	\PassOptionsToClass{twocolumn}{memoir}%}
}

\newboolean{ABNTEXupperchapter}
\newboolean{ABNTEXuppersection}
\newboolean{ABNTEXuppersubsection}
\newboolean{ABNTEXuppersubsubsection}
\newboolean{ABNTEXuppersubsubsubsection}
\setboolean{ABNTEXupperchapter}{false}
\setboolean{ABNTEXuppersection}{false}
\setboolean{ABNTEXuppersubsection}{false}
\setboolean{ABNTEXuppersubsubsection}{false}
\setboolean{ABNTEXuppersubsubsubsection}{false}

\DeclareOption{chapter=TITLE}{\setboolean{ABNTEXupperchapter}{true}}
\DeclareOption{section=TITLE}{\setboolean{ABNTEXuppersection}{true}}
\DeclareOption{subsection=TITLE}{\setboolean{ABNTEXuppersubsection}{true}}
\DeclareOption{subsubsection=TITLE}{\setboolean{ABNTEXuppersubsubsection}{true}}
\DeclareOption{subsubsubsection=TITLE}{\setboolean{ABNTEXuppersubsubsubsection}{true}}

\newboolean{ABNTEXsumario-tradicional}
\newboolean{ABNTEXsumario-abnt-6027-2012}
\setboolean{ABNTEXsumario-tradicional}{false}
\setboolean{ABNTEXsumario-abnt-6027-2012}{true}
\DeclareOption{sumario=tradicional}{%
  \setboolean{ABNTEXsumario-tradicional}{false}%
  \setboolean{ABNTEXsumario-abnt-6027-2012}{true}}
\DeclareOption{sumario=abnt-6027-2012}{%
  \setboolean{ABNTEXsumario-abnt-6027-2012}{true}
  \setboolean{ABNTEXsumario-tradicional}{false}}

\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{memoir}%
}
\ProcessOptions\relax
\LoadClass{memoir}

\ifdefined\settocpreprocessor
\else
  \setboolean{ABNTEXsumario-tradicional}{false}
  \setboolean{ABNTEXsumario-abnt-6027-2012}{true}
\fi


% Commands for handling custom options.

\RequirePackage{textcase}

\newcommand{\ABNTEXchapterupperifneeded}[1]{\ifthenelse{\boolean{ABNTEXupperchapter}}{\MakeTextUppercase{#1}}{#1}}
\newcommand{\ABNTEXsectionupperifneeded}{\ifthenelse{\boolean{ABNTEXuppersection}}{\MakeTextUppercase}{}}
\newcommand{\ABNTEXsubsectionupperifneeded}{\ifthenelse{\boolean{ABNTEXuppersubsection}}{\MakeTextUppercase}{}}
\newcommand{\ABNTEXsubsubsectionupperifneeded}{\ifthenelse{\boolean{ABNTEXuppersubsubsection}}{\MakeTextUppercase}{}}
\newcommand{\ABNTEXsubsubsubsectionupperifneeded}{\ifthenelse{\boolean{ABNTEXuppersubsubsubsection}}{\MakeTextUppercase}{}}


% Additional packages and general customizations of the memoir

\newcommand{\abntex@ifnotempty}[2]{\ifthenelse{\not\equal{#1}{}}{#2}{}}

\RequirePackage{hyperref}
\pdfstringdefDisableCommands{\def\\{, }\def\and{; }}

\RequirePackage{bookmark}
\RequirePackage[english]{babel}

\newcommand{\folhaderostoname}{Folha de rosto}
\newcommand{\epigraphname}{Ep\'igrafe}
\newcommand{\dedicatorianame}{Dedicat\'oria}
\newcommand{\errataname}{Errata}
\newcommand{\agradecimentosname}{Agradecimentos}
\newcommand{\anexoname}{Anexo}
\newcommand{\anexosname}{Anexos}
\newcommand{\apendicename}{Ap\^endice}
\newcommand{\apendicesname}{Ap\^endices}
\newcommand{\orientadorname}{Orientador:}
\newcommand{\coorientadorname}{Coorientador:}
\newcommand{\folhadeaprovacaoname}{Folha de aprova\c{c}\~ao}
\newcommand{\resumoname}{Resumo}
\newcommand{\listadesiglasname}{Lista de abreviaturas e siglas}
\newcommand{\listadesimbolosname}{Lista de s\'imbolos}
\newcommand{\sourcename}{Fonte}
\newcommand{\notaname}{Nota}

\addto\captionsbrazil{% Brazilian Portuguese
  %% Adjusts default babel names
%   \renewcommand{\bibname}{Refer\^encias}
  \renewcommand{\bibname}{Refer\^encias\protect\footnote{De acordo com a Associa\c{c}\~ao Brasileira de Normas T\'ecnicas. NBR 6023.}}
  \renewcommand{\indexname}{\'Indice}
  \renewcommand{\listfigurename}{Lista de figuras}
  \renewcommand{\listtablename}{Lista de tabelas}
  %% ajusta nomes usados com a macro \autoref
  \renewcommand{\pageautorefname}{p\'agina}
  \renewcommand{\sectionautorefname}{se{\c c}\~ao}
  \renewcommand{\subsectionautorefname}{subse{\c c}\~ao}
  \renewcommand{\subsubsectionautorefname}{subse{\c c}\~ao}
  \renewcommand{\paragraphautorefname}{subse{\c c}\~ao}
}
\addto\captionsenglish{% English
  %% Adjusts names from abnTeX2
  \renewcommand{\folhaderostoname}{Title page}
  \renewcommand{\epigraphname}{Epigraph}
  \renewcommand{\dedicatorianame}{Dedication}
  \renewcommand{\errataname}{Errata sheet}
  \renewcommand{\agradecimentosname}{Acknowledgements}
  \renewcommand{\anexoname}{ANNEX}
  \renewcommand{\anexosname}{Annex}
  \renewcommand{\apendicename}{APPENDIX}
  \renewcommand{\apendicesname}{Appendix}
  \renewcommand{\orientadorname}{Supervisor:}
  \renewcommand{\coorientadorname}{Co-supervisor:}
  \renewcommand{\folhadeaprovacaoname}{Approval}
  \renewcommand{\resumoname}{Abstract}
  \renewcommand{\listadesiglasname}{List of abbreviations and acronyms}
  \renewcommand{\listadesimbolosname}{List of symbols}
  \renewcommand{\sourcename}{Source}
  \renewcommand{\notaname}{Note}
   %% Adjusts names used by \autoref
  \renewcommand{\pageautorefname}{page}
  \renewcommand{\sectionautorefname}{section}
  \renewcommand{\subsectionautorefname}{subsection}
  \renewcommand{\subsubsectionautorefname}{subsubsection}
  \renewcommand{\paragraphautorefname}{subsubsubsection}
}

\RequirePackage{enumitem}
\RequirePackage{calc}
\setlrmarginsandblock{3cm}{2cm}{*}
\setulmarginsandblock{3cm}{2cm}{*}
\checkandfixthelayout
\OnehalfSpacing

\newcommand{\ABNTEXfontereduzida}{\footnotesize}
\newcommand{\abnTeX}{abn\TeX2}

%% Chapter 1 style
\newcommand{\ABNTEXchapterfont}{\normalfont\bfseries}
\newcommand{\ABNTEXchapterfontsize}{\fontsize{12}{0}\selectfont}

%% Section 1.1 style
\newcommand{\ABNTEXsectionfont}{\normalfont\itshape}
\newcommand{\ABNTEXsectionfontsize}{\fontsize{12}{0}\selectfont}

%% Subsection 1.1.1 style
\newcommand{\ABNTEXsubsectionfont}{\normalfont}
\newcommand{\ABNTEXsubsectionfontsize}{\fontsize{12}{0}\selectfont}

%% Subsection 1.1.1.1 style
\newcommand{\ABNTEXsubsubsectionfont}{\normalfont}
\newcommand{\ABNTEXsubsubsectionfontsize}{\fontsize{12}{0}\selectfont}

%% Estilo da subsection 1.1.1.1.1
\newcommand{\ABNTEXsubsubsubsectionfont}{\normalfont}
\newcommand{\ABNTEXsubsubsubsectionfontsize}{\fontsize{12}{0}\selectfont}

\newcounter{abntex@bookmarkcounter}
\setcounter{abntex@bookmarkcounter}{0}
\newcommand{\PRIVATEbookmarkthis}[1]{%
  \addtocounter{abntex@bookmarkcounter}{1}%
  \phantomsection\pdfbookmark[0]{#1}{chapterb\arabic{abntex@bookmarkcounter}}
}

\newcommand{\pretextualchapter}[1]{%
  \addtocounter{abntex@bookmarkcounter}{1}%
  \PRIVATEbookmarkthis{#1}%
  \chapter*[#1]{#1}%
  }
\provideboolean{abntex@apendiceousecao}
\setboolean{abntex@apendiceousecao}{false}

\newcommand{\PRIVATEclearpageifneeded}{%
  \ifthenelse{\equal{\ABNTEXisarticle}{true}}{%
    %
  }{ % else
    \cleardoublepage%
  }
}

% Layout configurations

%% Footnotes - NBR 14724/2011 - 5.2.1
\makeatletter
\renewcommand\@makefntext[1]{\hangindent=1.2em\leftskip=0.4em\hskip-0.4em\@makefnmark\hskip1.2em\relax#1}
%\renewcommand\@makefntext[1]{\leftskip=0.7cm\hskip-0.15cm\@makefnmark#1}
\makeatother
\renewcommand{\foottextfont}{\ABNTEXfontereduzida}

%% Comma in consecutive footnotes
\let\oldFootnote\footnote
\newcommand\nextToken\relax
\renewcommand\footnote[1]{%
    \oldFootnote{#1}\futurelet\nextToken\isFootnote}
\newcommand\isFootnote{%
    \ifx\footnote\nextToken\textsuperscript{,}\fi}

%% Continuous numbering of figures
\ifthenelse{\equal{\ABNTEXisarticle}{true}}{%
  \counterwithout{section}{chapter}
  \counterwithout{figure}{section}
  \counterwithout{table}{section}
  \counterwithout{equation}{chapter}
  \counterwithout{equation}{section}
}{%else
  \counterwithout{figure}{chapter}
  \counterwithout{table}{chapter}
  \counterwithout{equation}{chapter}
}

%% Estilos de caption
\hangcaption
\captiondelim{~\textendash~}

\newcommand{\IBGEtabfontsize}{\ABNTEXfontereduzida}
\AtBeginDocument{%
  \newcommand{\configurecaptions}{\captionstyle[\raggedright]{}}
  \newcommand{\configureseparator}{\captiondelim{: }}
  \newsavebox{\myptabbox}
  \newlength{\myptabboxwidth}
  \newcommand{\IBGEtab}[3]{%
    \savebox{\myptabbox}{{\IBGEtabfontsize #2}}%
    \settowidth{\myptabboxwidth}{\usebox{\myptabbox}}%
    \centering%
    \parbox{\myptabboxwidth}{%
    \configurecaptions
    #1%
    \par%
    {\IBGEtabfontsize%
    #2%
    }%
    \par%
    #3}%
  }
  \let\ibgetab\IBGEtab
}

\makeatletter
\newcommand{\source}[2][\sourcename]{%
  \M@gettitle{#2}%
  \memlegendinfo{#2}%
  \par
  \begingroup
     \@parboxrestore
     \if@minipage
       \@setminipage
     \fi
     \ABNTEXfontereduzida
     \configureseparator
     \vspace{-3pt}
     \@makecaption{\ABNTEXfontereduzida #1}{\ignorespaces\ABNTEXfontereduzida #2}\par
		 \vspace{-9pt}
  \endgroup}
\makeatother


\makeatletter
\newcommand{\nota}[2][\notaname]{\source[#1]{#2}}
\makeatother

\AtEndPackage{caption}{
  \AtBeginDocument{%
    \DeclareCaptionLabelSeparator{barr}{~\textendash~}
    \DeclareCaptionFont{ABNTEXfontereduzida}{\ABNTEXfontereduzida}
      \captionsetup{format=hang,
                    labelseparator=barr,
                    %labelfont=ABNTEXfontereduzida,
                    %font=ABNTEXfontereduzida
                    }
      \renewcommand{\configurecaptions}{%
                  \captionsetup{justification=justified,%
                                singlelinecheck=false}}
      \renewcommand{\configureseparator}{\captionsetup{labelsep=colon}}
  }
}

%% Table of Contents settings

\setsecnumdepth{subsection}
\settocdepth{subsection}
\setcounter{tocdepth}{3}
\setcounter{secnumdepth}{3}
\maxsecnumdepth{subsection}

\newcommand{\subsubsubsection}{\paragraph}
\newcommand{\cftbeforesubsubsubsectionskip}{\cftbeforeparagraphskip}
\newcommand{\cftsubsubsubsectionfont}{\cftparagraphfont}
\newcommand{\setsubsubsubsecheadstyle}{\setparaheadstyle}

\setafterparaskip{1.0\onelineskip plus 0.5\onelineskip minus 0.2\onelineskip}
\setparaheadstyle{\normalfont\rmfamily\raggedright}%

\renewcommand{\cftfigurename}{\figurename\space}
\renewcommand*{\cftfigureaftersnum}{\hfill\textendash\hfill}

\renewcommand{\cfttablename}{\tablename\space}
\renewcommand*{\cfttableaftersnum}{\hfill\textendash\hfill}
\renewcommand*{\cftchapterdotsep}{\cftdotsep}

\setlength{\cftbeforechapterskip}{0pt plus 0pt}
\renewcommand*{\insertchapterspace}{}

\cftinsertcode{A}{}

\newlength{\cftlastnumwidth}
\setlength{\cftlastnumwidth}{\cftsubsubsectionnumwidth+1em}

\newcommand{\tocprintchapter}{}
\newcommand{\tocinnonumchapter}{}
\newcommand{\tocprintchapternonum}{}
\newcommand{\tocpartapendices}{}
\newcommand{\tocpartanexos}{}

\cftinsertcode{A}{\renewcommand{\cftchapteraftersnum}{\hfill\textendash\hfill}}

\makeatletter
\ifthenelse{\boolean{ABNTEXsumario-abnt-6027-2012}}{
  \settocpreprocessor{chapter}{%
  \let\tempf@rtoc\f@rtoc%
  \def\f@rtoc{%
  \texorpdfstring{\tempf@rtoc}{\tempf@rtoc}}%
  %\texorpdfstring{\MakeTextUppercase{\tempf@rtoc}}{\tempf@rtoc}}%
  }
  \settocpreprocessor{part}{%
  \let\tempf@rtoc\f@rtoc%
  \def\f@rtoc{%
  \texorpdfstring{\tempf@rtoc}{\tempf@rtoc}}%
  %\texorpdfstring{\MakeTextUppercase{\tempf@rtoc}}{\tempf@rtoc}}%
  }
}{}
\makeatother
%
\ifthenelse{\boolean{ABNTEXsumario-abnt-6027-2012}}{%

  \cftsetindents{part}{0em}{\cftlastnumwidth}
  \cftsetindents{chapter}{0em}{\cftlastnumwidth}
  \cftsetindents{section}{1em}{\cftlastnumwidth}
  \cftsetindents{subsection}{2em}{\cftlastnumwidth}
  \cftsetindents{subsubsection}{3em}{\cftlastnumwidth}
  %\cftsetindents{paragraph}{4em}{\cftlastnumwidth}
  %\cftsetindents{subparagraph}{5em}{\cftlastnumwidth}
  %
  \renewcommand{\tocprintchapter}{%
    \addtocontents{toc}{\cftsetindents{chapter}{0em}{\cftlastnumwidth}}}
  %
  \renewcommand{\tocinnonumchapter}{%
    \addtocontents{toc}{\cftsetindents{chapter}{\cftlastnumwidth}{2em}}%
    \cftinserthook{toc}{A}}
  %
  \renewcommand{\tocprintchapternonum}{%
    \addtocontents{toc}{\cftsetindents{chapter}{\cftlastnumwidth}{2em}}}
  %
  \renewcommand{\tocpartapendices}{%
    \addtocontents{toc}{\cftsetindents{part}{\cftlastnumwidth}{2em}}
    \cftinserthook{toc}{A}}
  %
  \renewcommand{\tocpartanexos}{%
    \addtocontents{toc}{\cftsetindents{part}{\cftlastnumwidth}{2em}}
    \cftinserthook{toc}{A}}
  %
  \setlength{\cftbeforechapterskip}{1em}
  %
  % Fontes das entradas do sumario
  %
  %\renewcommand{\cftpartfont}{\bfseries\larger}
  %
  \renewcommand{\cftchapterfont}{\ABNTEXchapterfont\ABNTEXchapterfontsize}
  \renewcommand{\cftchapterpagefont}{\normalfont\normalsize}
  %
  \renewcommand{\cftsectionfont}{\ABNTEXsectionfont\ABNTEXsectionfontsize}
  \renewcommand{\cftsectionpagefont}{\normalfont\normalsize}
  %
  \renewcommand{\cftsubsectionfont}{\ABNTEXsubsectionfont\ABNTEXsubsectionfontsize}
  \renewcommand{\cftsubsectionpagefont}{\normalfont\normalsize}
  %
  \renewcommand{\cftsubsubsectionfont}{\ABNTEXsubsubsectionfont\ABNTEXsubsubsectionfontsize}
  \renewcommand{\cftsubsubsectionpagefont}{\normalfont\normalsize}
  %
  \renewcommand{\cftparagraphfont}{\ABNTEXsubsubsubsectionfont\ABNTEXsubsubsubsectionfontsize}
  \renewcommand{\cftparagraphpagefont}{\normalfont\normalsize}
}{}

\newcommand{\phantompart}{%
  \bookmarksetup{startatroot}%
  \phantomsection%
  \ifthenelse{\boolean{ABNTEXsumario-abnt-6027-2012}}{%
    \addtocontents{toc}{\vspace{\cftbeforechapterskip}}}{%
    \addtocontents{toc}{\vspace{\cftbeforepartskip}}}%
}

% Chapter titles configuration

%% ABNT NBR 14724-2011 - 5.2.2-5.2.4; ABNT NBR 6024-2003 - 3.1-3.8
\provideboolean{abntex@innonumchapter}
\setboolean{abntex@innonumchapter}{true}
\makechapterstyle{abnt}{%
  \renewcommand{\chapterheadstart}{}

  \ifx \chapternamenumlength \undefined
    \newlength{\chapternamenumlength}
  \fi

\setlength{\beforechapskip}{-\onelineskip} %com 0 nao funcionou
\setlength{\afterchapskip}{22pt} % antes do titulo de capitulo

\setbeforesecskip{32pt}
\setaftersecskip{22pt}

\setbeforesubsecskip{32pt}
\setaftersubsecskip{22pt}

\setbeforesubsubsecskip{32pt}
\setaftersubsubsecskip{22pt}

\setbeforeparaskip{32pt}
\setafterparaskip{22pt}

  \renewcommand{\chapnumfont}{\chaptitlefont}
  \renewcommand{\chaptitlefont}{\ABNTEXchapterfont\ABNTEXchapterfontsize}
  \setsecheadstyle{\ABNTEXsectionfont\ABNTEXsectionfontsize\ABNTEXsectionupperifneeded}
  \setsubsecheadstyle{\ABNTEXsubsectionfont\ABNTEXsubsectionfontsize\ABNTEXsubsectionupperifneeded}
  \setsubsubsecheadstyle{\ABNTEXsubsubsectionfont\ABNTEXsubsubsectionfontsize\ABNTEXsubsubsectionupperifneeded}
  \setsubsubsubsecheadstyle{\ABNTEXsubsubsubsectionfont\ABNTEXsubsubsubsectionfontsize\ABNTEXsubsubsubsectionupperifneeded}

  \renewcommand{\chapternamenum}{}

  \renewcommand{\printchaptername}{%
   \chaptitlefont
   \ifthenelse{\boolean{abntex@apendiceousecao}}{\appendixname}{}%
  }

  \def\printchaptertitle##1{%
    \chaptitlefont%
    \ifthenelse{\boolean{abntex@innonumchapter}}{\centering\ABNTEXchapterupperifneeded{##1}}{%
    \ifthenelse{\boolean{abntex@apendiceousecao}}{%
        \centering%
        \settowidth{\chapternamenumlength}{\printchaptername\printchapternum\afterchapternum}%
        \ABNTEXchapterupperifneeded{##1}%
      }{%
        \settowidth{\chapternamenumlength}{\printchaptername\printchapternum\afterchapternum}%
        \parbox[t]{\columnwidth-\chapternamenumlength}{\ABNTEXchapterupperifneeded{##1}}}%
     }
  }

  \renewcommand{\printchapternum}{%
     \tocprintchapter
     \setboolean{abntex@innonumchapter}{false}
     \chapnumfont%
     \space\thechapter\space%
     \ifthenelse{\boolean{abntex@apendiceousecao}}{%
       \tocinnonumchapter
       ~\textendash~%
     }{} % else
  }
  \renewcommand{\afterchapternum}{}

  \renewcommand\printchapternonum{%
     \tocprintchapternonum
     \setboolean{abntex@innonumchapter}{true}%
    }
}
\chapterstyle{abnt}

%% Header declarations
\makepagestyle{abntheadings}
\makeoddhead{abntheadings}{}{}{\ABNTEXfontereduzida\thepage}

\makepagestyle{abntchapfirst}
\makeoddhead{abntchapfirst}{}{}{\ABNTEXfontereduzida\thepage}

%% Layout configuration for pre-textual elements
\newcommand{\pretextual}{%
  \aliaspagestyle{chapter}{empty}% customizing chapter pagestyle
  \pagestyle{empty}
  \aliaspagestyle{cleared}{empty}
  \aliaspagestyle{part}{empty}
}
\renewcommand{\frontmatter}{\pretextual}

\AtBeginDocument{\pretextual}

%% Layout configuration for textual elements
\newcommand{\textual}{%
  \ifthenelse{\equal{\ABNTEXisarticle}{true}}{%
    \pagestyle{plain}%
  }{%else
    \pagestyle{abntheadings}%
    \aliaspagestyle{chapter}{abntchapfirst}% customizing chapter pagestyle
  }
  \nouppercaseheads%
  \bookmarksetup{startatroot}%
}
\renewcommand{\mainmatter}{\textual}

%% Layout configuration for post-textual elements
\newcommand{\postextual}{\phantompart}
\renewcommand{\backmatter}{\postextual}


% Data commands for cover and title page

\newcommand{\titulo}[1]{\title{#1}}
\newcommand{\imprimirtitulo}{\thetitle}

\newcommand{\autor}[1]{\author{#1}}
\newcommand{\imprimirautor}{\theauthor}

\let\olddate\date
\renewcommand{\date}[1]{\AtBeginDocument{\olddate{#1}}}
\newcommand{\data}[1]{\date{#1}}
\newcommand{\imprimirdata}{\thedate}

\providecommand{\imprimirinstituicao}{}
\newcommand{\instituicao}[1]{\renewcommand{\imprimirinstituicao}{#1}}

\providecommand{\imprimirlocal}{}
\newcommand{\local}[1]{\renewcommand{\imprimirlocal}{#1}}

\providecommand{\imprimirpreambulo}{}
\newcommand{\preambulo}[1]{\renewcommand{\imprimirpreambulo}{#1}}

\providecommand{\imprimirorientadorRotulo}{}
\providecommand{\imprimirorientador}{}
\newcommand{\orientador}[2][\orientadorname]%
  {\renewcommand{\imprimirorientadorRotulo}{#1}%
   \renewcommand{\imprimirorientador}{#2}}

\providecommand{\imprimircoorientadorRotulo}{}
\providecommand{\imprimircoorientador}{}
\newcommand{\coorientador}[2][\coorientadorname]%
  {\renewcommand{\imprimircoorientadorRotulo}{#1}%
   \renewcommand{\imprimircoorientador}{#2}}

\providecommand{\imprimirtipotrabalho}{}
\newcommand{\tipotrabalho}[1]{\renewcommand{\imprimirtipotrabalho}{#1}}


% Pre-textual typesetting commands and environments

%% Environment for defining the cover
\newenvironment{capa}{\begin{titlingpage}}{\end{titlingpage}\cleardoublepage}

%% Cataloging record
\newenvironment{fichacatalografica}{%
    \thispagestyle{empty}
    \begin{SingleSpacing}
      \ABNTEXfontereduzida
}{%
    \end{SingleSpacing}%
}%

%% Errata
\newenvironment{errata}[1][\errataname]{%
   \pretextualchapter{#1}
  }{\PRIVATEclearpageifneeded}

%% Approval sheet - NBR 14724/2011 - 4.2.1.3
\newenvironment{folhadeaprovacao}[1][\folhadeaprovacaoname]{%
   \clearpage%
   \PRIVATEbookmarkthis{#1}%
   \begin{Spacing}{1.0}
}{\end{Spacing}\PRIVATEclearpageifneeded}

%% Inscription
\newenvironment{dedicatoria}[1][]{%
   \ifthenelse{\equal{#1}{}}{%
    \PRIVATEbookmarkthis{\dedicatorianame}
    }{\pretextualchapter{#1}}
  }{\PRIVATEclearpageifneeded}

%% Acknowledgments
\newenvironment{agradecimentos}[1][\agradecimentosname]{%
   \pretextualchapter{#1}
  }{\PRIVATEclearpageifneeded}

%% Epigraph
\newenvironment{epigrafe}[1][]{%
   \ifthenelse{\equal{#1}{}}{%
    \PRIVATEbookmarkthis{\epigraphname}
    }{\pretextualchapter{#1}}
  }{\PRIVATEclearpageifneeded}

%% Resumo e abstracts em diferentes idiomas - NBR 14724/2011
\ifthenelse{\equal{\ABNTEXisarticle}{true}}{%
    % em artigos, margens e fontes são as mesmas de memoir
  }{ % else
  	% Ajusta as margens para serem a mesma do documento
    \setlength\absleftindent{0cm}
    \setlength\absrightindent{0cm}
    % Garante que a fonte do texto do abstract será a mesma do documento, pois
    % na classe memoir está \small
    \renewcommand{\abstracttextfont}{\normalfont\normalsize}
  }

\AtBeginDocument{%
   \setlength{\absparindent}{0pt}
}

\newenvironment{resumo}[1][\resumoname]{%
   \PRIVATEbookmarkthis{#1}
   \renewcommand{\abstractnamefont}{\chaptitlefont}
   \renewcommand{\abstractname}{\ABNTEXchapterupperifneeded{#1}}
%    \begin{abstract}
   \begin{abstract}\SingleSpacing
  }{\end{abstract}\PRIVATEclearpageifneeded}

\newenvironment{resumoumacoluna}[1][\resumoname]{%
   \PRIVATEbookmarkthis{#1}
   \renewcommand{\abstractnamefont}{\chaptitlefont}
   \renewcommand{\abstractname}{\ABNTEXchapterupperifneeded{#1}}
   \begin{onecolabstract}
}{\end{onecolabstract}\PRIVATEclearpageifneeded}

%% List of abbreviations and acronyms
\newenvironment{siglas}{%
  \pretextualchapter{\listadesiglasname}
  \begin{symbols}
}{%
  \end{symbols}
  \cleardoublepage
}

%% List of symbols
\newenvironment{simbolos}{%
  \pretextualchapter{\listadesimbolosname}
  \begin{symbols}
}{%
  \end{symbols}
  \cleardoublepage
}


% Typesetting commands and environments for appendices and attachments

%% Shared definitions between appendices and attachments
\makeatletter
\newcommand\@switch[1]{ \@writefile{toc}{\renewcommand*{\cftappendixname}{#1 \space}} }
\newcommand{\switchchapname}[1]{ \protected@write \@auxout {}{\string\@switch{#1} }}
\makeatother

\newcommand{\PRIVATEapendiceconfig}[2]{%
 \setboolean{abntex@apendiceousecao}{true}%
 \renewcommand{\appendixname}{#1}
 \ifthenelse{\boolean{ABNTEXsumario-abnt-6027-2012}}{
   \renewcommand{\appendixtocname}{\uppercase{#2}}
  }{%
  \renewcommand{\appendixtocname}{#2}}
 \renewcommand{\appendixpagename}{#2}
 \switchchapname{#1}% Corrected from \switchapname -> \switchchapname
 \renewcommand*{\cftappendixname}{#1 \space}
}

\newcommand{\apendices}{%
 \PRIVATEapendiceconfig{\apendicename}{\apendicesname}
 \appendix
}

\newenvironment{apendicesenv}{%
 \PRIVATEapendiceconfig{\apendicename}{\apendicesname}
 \begin{appendix}
}{
 \end{appendix}
 \setboolean{abntex@apendiceousecao}{false}
 \bookmarksetup{startatroot}
}

\newcommand{\anexos}{%
 \cftinserthook{toc}{AAA}

 \PRIVATEapendiceconfig{\anexoname}{\anexosname}
 \appendix
 \renewcommand\theHchapter{anexochapback.\arabic{chapter}}
}

\newenvironment{anexosenv}{%
 \cftinserthook{toc}{AAA}

 \PRIVATEapendiceconfig{\anexoname}{\anexosname}
 \begin{appendix}
 \renewcommand\theHchapter{anexochapback.\arabic{chapter}}
}{
 \end{appendix}
 \setboolean{abntex@apendiceousecao}{false}
 \bookmarksetup{startatroot}
}

\newcommand{\partpage}{%
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{part}{\appendixtocname}%
  \appendixpage*
}

\makeatletter
\newcommand{\partapendices}{%
\tocpartapendices%
\@ifstar{\appendixpage*}{\partpage}}

\newcommand{\partanexos}{%
\tocpartanexos%
\@ifstar{\appendixpage*}{\partpage}}
\makeatother


% Typesetting commands and environments for citation, paragraph, subsection, and signature

%% Direct quotation exceeding 3 lines - ABNT NBR 10520/2002 - 5.3
\newlength{\ABNTEXcitacaorecuo}% recuo de 4 cm da margem esquerda
\ifthenelse{\equal{\ABNTEXistwocolumn}{true}}{%
  \setlength{\ABNTEXcitacaorecuo}{1.8cm}
}{% else
  \setlength{\ABNTEXcitacaorecuo}{4cm}
}
\newenvironment*{citacao}[1][default]{%
   \list{}%
   \ABNTEXfontereduzida%
   \addtolength{\leftskip}{\ABNTEXcitacaorecuo}%
   \item[]%
   \begin{SingleSpace}%
   \ifthenelse{\not\equal{#1}{default}}{\itshape\selectlanguage{#1}}{}%
 }{%
   \end{SingleSpace}%
   \endlist}%

%% Environment for bullet points and sub-bullet points (subitems/incisions)
%% ABNT NBR 6024/2012 - 4.2 e 4.3
\newlist{alineas}{enumerate}{2}
\setlist[alineas,1]{label={\alph*)},topsep=0pt,itemsep=0pt,leftmargin=\parindent+\labelwidth-\labelsep}%
\setlist[alineas,2]{label={--},topsep=0pt,itemsep=0pt,leftmargin=*}
\newlist{subalineas}{enumerate}{1}
\setlist[subalineas,1]{label={--},topsep=0pt,itemsep=0pt,leftmargin=*}%
\newlist{incisos}{enumerate}{1}
\setlist[incisos,1]{label={--},topsep=0pt,itemsep=0pt,leftmargin=*}%

%% List redefinition - setting the spacing of items in lists
\let\itemizeant\itemize
\renewcommand{\itemize}
{ \itemizeant
  \setlength{\itemsep}{0pt}
  \setlength{\parskip}{0pt}
  \setlength{\parsep}{0pt}
}
\let\enumerateant\enumerate
\renewcommand{\enumerate}
{ \enumerateant
  \setlength{\itemsep}{0pt}
  \setlength{\parskip}{0pt}
  \setlength{\parsep}{0pt}
}

\newlength{\ABNTEXsignwidth}
\setlength{\ABNTEXsignwidth}{8cm}
\newlength{\ABNTEXsignthickness}
\setlength{\ABNTEXsignthickness}{1pt}
\newlength{\ABNTEXsignskip}
\setlength{\ABNTEXsignskip}{1cm}

\makeatletter
\newcommand{\assinatura}{\@ifstar{\ABNTEXsign}{\ABNTEXcsign}}
\makeatother

\newcommand{\ABNTEXsign}[1]{%
  \parbox[t]{\ABNTEXsignwidth}{\SingleSpacing\vspace*{\ABNTEXsignskip}\centering%
  \rule{\ABNTEXsignwidth}{\ABNTEXsignthickness}\\%
  \nopagebreak #1\par}%
}

\newcommand{\ABNTEXcsign}[1]%
  {\begingroup\par\centering\ABNTEXsign{#1}\par\endgroup}


% Standard prints of cover and title page

%% Cover
\newcommand{\imprimircapa}{%
  \begin{capa}%
    \center

    \normalfont\normalsize\imprimirinstituicao

    \vspace*{4cm}

    \normalfont\normalsize\imprimirautor

    \vspace*{5cm}

    \bfseries\normalsize\imprimirtitulo

    \vfill

    \normalfont\normalsize\imprimirlocal

    \normalfont\normalsize\imprimirdata

    \vspace*{1cm}
  \end{capa}
}

%% Title page
\newenvironment{folhaderosto}[1][\folhaderostoname]{\clearpage\PRIVATEbookmarkthis{#1}}{\cleardoublepage}
\newenvironment{folhaderosto*}[1][\folhaderostoname]{\clearpage\PRIVATEbookmarkthis{#1}}{\newpage}%

% Title page content
\makeatletter
\newcommand{\folhaderostocontent}{
  \begin{center}

    %\vspace*{1cm}
    {\normalfont\normalsize\imprimirautor}

    \vspace*{\fill}\vspace*{\fill}
    \begin{center}
      \bfseries\normalsize\imprimirtitulo
    \end{center}
    \vspace*{\fill}

    \abntex@ifnotempty{\normalfont\normalsize\imprimirpreambulo}{%
      \hspace{.45\textwidth}
      \begin{minipage}{.5\textwidth}
      	\SingleSpacing
         \normalfont\normalsize\imprimirpreambulo
         \vspace{2\baselineskip}
         {\normalfont\normalsize\imprimirorientadorRotulo~\imprimirorientador\par}
         \vspace{0.5\baselineskip}

		 \abntex@ifnotempty{\normalfont\normalsize\imprimircoorientador}{%
         {\normalfont\normalsize\imprimircoorientadorRotulo~\imprimircoorientador}%
    }%
    \vspace*{\fill}
       \end{minipage}%
       \vspace*{\fill}
    }%

    {\normalfont\normalsize\imprimirlocal}
    \par
    {\normalfont\normalsize\imprimirdata}
    \vspace*{1cm}

  \end{center}
}
\makeatother

\newcommand{\imprimirfolhaderostostar}[1]{%
  \begin{folhaderosto*}{#1}
     \folhaderostocontent
  \end{folhaderosto*}}

\newcommand{\imprimirfolhaderostonostar}[1]{%
  \begin{folhaderosto}{#1}
     \folhaderostocontent
  \end{folhaderosto}}

\makeatletter
\newcommand{\imprimirfolhaderosto}[1][\folhaderostoname]{%
   \@ifstar
     \imprimirfolhaderostostar
     \imprimirfolhaderostonostar
}
\makeatother


% Hack for the algorithm package

\usepackage{algorithm}

\makeatletter
\def\ALG@name{Algoritmo}
  \renewcommand{\listalgorithmname}{Lista de algoritmos}
  \def\algorithmautorefname{Algoritmo}
  \let\OLDlistofalgorithms\listofalgorithms
  \newcommand{\NEWnumberline}[1]{\hspace*{-48pt}Algoritmo #1~--~}
  \renewcommand{\listofalgorithms}{
    \let\OLDnumberline\numberline
    \let\numberline\NEWnumberline
    \OLDlistofalgorithms
    \let\numberline\OLDnumberline
  }
\makeatother