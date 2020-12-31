%%% ====================================================================
%%
%%         \normalsize = 10 pt
%%
%%% ====================================================================
%%
%% This file `PublMath.cls' is the document class for articles for
%% Publicationes Mathematicae Debrecen
%%
%% 1995 Copyright Publicationes Mathematicae Debrecen
%%
%% Version 2.0, March 9, 2006
%%    by Bujdoso Gyongyi
%% 
%% Support: publi@math.klte.hu
%%
%%          Publicationes Mathematicae Debrecen
%%          H-4010 Debrecen, P.O.B. 12
%%
%% The original source file was:
%% amsclass.dtx  (with options: `amsart,classes')
%%
%%% ====================================================================
\NeedsTeXFormat{LaTeX2e}% LaTeX 2.09 can't be used (nor non-LaTeX)
[1994/12/01]% LaTeX date must December 1994 or later
%%%%
\ProvidesClass{publmathdeb}[2006/03/09 v2.0]
%%%%
\global\expandafter\let\csname ver@amsthm.sty\expandafter\endcsname
  \csname ver@\@currname.\@currext\endcsname
\let\@xp=\expandafter
\let\@nx=\noexpand
\def\@oparg#1[#2]{\@ifnextchar[{#1}{#1[#2]}}
\long\def\@ifempty#1{\@xifempty#1@@..\@nil}
\long\def\@xifempty#1#2@#3#4#5\@nil{%
  \ifx#3#4\@xp\@firstoftwo\else\@xp\@secondoftwo\fi}
\long\def\@ifnotempty#1{\@ifempty{#1}{}}
\def\setboxz@h{\setbox\z@\hbox}
\def\@addpunct#1{\ifnum\spacefactor>\@m \else#1\fi}
\def\frenchspacing{\sfcode`\.1006\sfcode`\?1005\sfcode`\!1004%
  \sfcode`\:1003\sfcode`\;1002\sfcode`\,1001 }
\def\@tempa#1#2\@nil{\edef\@classname{#1}}
\expandafter\@tempa\@currnamestack{}{}{}\@nil
\ifx\@classname\@empty \edef\@classname{\@currname}\fi
\def\@True{00}
\def\@False{01}
\newif\ifoooldal \oooldalfalse
\newcommand\newswitch[2][False]{%
  \expandafter\@ifdefinable\csname ?@#2\endcsname{%
    \global\expandafter\let\csname ?@#2\expandafter\endcsname
      \csname @#1\endcsname
  }%
}
\newcommand{\setFalse}[1]{%
  \expandafter\let\csname ?@#1\endcsname\@False
}
\newcommand{\setTrue}[1]{%
  \expandafter\let\csname ?@#1\endcsname\@True
}
\newswitch{}
\DeclareRobustCommand{\except}[1]{%
  \if\csname ?@#1\endcsname \expandafter\@gobble
  \else \expandafter\@firstofone
  \fi
}
\DeclareRobustCommand{\for}[1]{%
  \if\csname ?@#1\endcsname \expandafter\@firstofone
  \else \expandafter\@gobble
  \fi
}
\DeclareRobustCommand{\forany}[1]{%
  \csname for@any@01\endcsname#1,?,\@nil
}
\@namedef{for@any@\@False}#1,{%
  \csname for@any@%
    \csname ?@\zap@space#1 \@empty\endcsname
  \endcsname
}
\@namedef{?@?}{x}
\@namedef{for@any@\@True}#1\@nil#2{#2}
\def\for@any@x{\@car\@gobble}
\DeclareOption{a4paper}{\paperheight 297mm\paperwidth 210mm}
%  \textheight 54.5pc }
\DeclareOption{letterpaper}{\paperheight 11in\paperwidth 8.5in }
\DeclareOption{landscape}{\@tempdima\paperheight
  \paperheight\paperwidth \paperwidth\@tempdima}
\DeclareOption{portrait}{}
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\overfullrule5\p@
  \ClassWarning{\@classname}{%
    When the draft option is used, the
      \protect\includegraphics\MessageBreak
    command will print blank placeholder boxes\MessageBreak
    for the graphics}%
}
\DeclareOption{final}{\overfullrule\z@ }

%%%%
%%%%
\newcount\cpvol \cpvol=0
 \def\pyear#1{\def\PYEAR{#1}} \def\PYEAR{}
 \def\pvol#1{\def\PVOL{#1}\global\cpvol=#1} \def\PVOL{}
 \def\pinfo#1{\def\PINFO{#1}} \def\PINFO{}
 \def\pissue#1{\def\PISSUE{#1}} \def\PISSUE{}
 \def\receivedinfo#1{\def\RECINFO{#1}} \def\RECINFO{}
 \def\itemspace{3cm}
   \newdimen\firstspace
   \firstspace=20pt %%%8pt %%% 12pt volt
   \def\fspace{\vspace{\firstspace}}
 \def\potty{\leavevmode\hbox{\raise 1pt\hbox{\scriptsize$\bullet$}}}
%%%%
 \def\dspqed{
        \eqno
        \let\eqno\relax \let\leqno\relax \let\veqno\relax
        \hbox{\qedsymbol}%
   }
 \def\eqqed{
     \iftagsleft@
      \hbox{\phantom{\quad\qedsymbol}}%
      \gdef\alt@tag{%
        \rlap{\hbox to\displaywidth{\hfil\qedsymbol}}%
        \global\let\alt@tag\@empty
      }%
    \else
      \gdef\alt@tag{%
        \global\let\alt@tag\@empty
        \vtop{\ialign{\hfil####\cr
                \tagform@\theequation\cr
                \qedsymbol\cr}}%
        \setbox\z@
      }%
    \fi
    }
\def\ref#1{\expandafter\@setref\csname r@#1\endcsname\@firstoftwo{#1}}
\def\pageref#1{\expandafter\@setref\csname r@#1\endcsname
                                   \@secondoftwo{#1}}
%%%%
%%%%
\def\bkey#1{\def\KULCS{#1}}
\def\bshkey#1{\def\MEGJKULCS{#1}}
\def\bauthor#1{\def\SZERZ{#1}}
\baselineskip=14.3pt plus 1pt

\def\btitle#1{\def\CIM{#1}}
\def\bjour#1{\def\FOLYOIRAT{#1}}
\def\bvol#1{\def\KOTET{#1}}
\def\byear#1{\def\EV{#1}}
\def\bpages#1{\def\OLDAL{#1}}

\def\KULCS{}
\def\MEGJKULCS{}
\def\SZERZ{}
\def\CIM{}
\def\FOLYOIRAT{}
\def\KOTET{}
\def\EV{}
\def\OLDAL{}

\def\es{{\rm and} }

\def\genbib{
    \ifx\@empty\MEGJKULCS
     \bibitem{\KULCS}
    \else
     \bibitem[\MEGJKULCS]{\KULCS}
    \fi
    {\sc\SZERZ}, {\CIM}, {\it\FOLYOIRAT} {\bf\KOTET} (\EV), \OLDAL.
    \def\KULCS{}
    \def\MEGJKULCS{}
    \def\SZERZ{}
    \def\CIM{}
    \def\FOLYOIRAT{}
    \def\KOTET{}
    \def\EV{}
    \def\OLDAL{}
   }
%%%%
%%%%
%%%%

\def\dateposted#1{\def\@dateposted{#1}}%
\let\@dateposted\@empty
\def\@setdateposted{%
  \newline Article electronically published on \@dateposted}
\def\article@logo{%
  \set@logo{%
    \publname
    \ifx\@empty\currentvolume
    \else \newline\volinfo, \pageinfo
    \fi
    \newline \@PII
    \ifx\@empty\@dateposted \else \@setdateposted\fi
  }%
}
\def\eonly@logo{%
  \set@logo{%
    \publname
    \newline\volinfo, \pageinfo
    \ifx\@empty\@dateposted \else \@setdateposted\fi
    \newline \@PII
  }%
}
\long\def\set@logo#1{%
  \vbox to\headheight{%
    \@parboxrestore \fontsize{6}{7\p@}\selectfont
    \noindent#1\par\vss
  }%
}
\DeclareOption{e-only}{%
  \def\volinfo{Volume \currentvolume}%
  \dateposted{Xxxx XX, XXXX}%
  \def\@setdateposted{\ (\@dateposted)}%
  \let\article@logo\eonly@logo
}
\newif\if@titlepage
\DeclareOption{titlepage}{\@titlepagetrue}
\DeclareOption{notitlepage}{\@titlepagefalse}
\DeclareOption{onecolumn}{\@twocolumnfalse}
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{nomath}{}
\DeclareOption{noamsfonts}{}
\DeclareOption{psamsfonts}{%
  \PassOptionsToPackage{psamsfonts}{amsfonts}%
  \PassOptionsToPackage{cmex10}{amsmath}}
\newif\iftagsleft@
\DeclareOption{leqno}{%
  %
  \tagsleft@true \PassOptionsToPackage{leqno}{amsmath}}
  %
\DeclareOption{reqno}{%
  \tagsleft@false \PassOptionsToPackage{reqno}{amsmath}}
\newif\ifctagsplit@
\DeclareOption{centertags}{%
  \ctagsplit@true \PassOptionsToPackage{centertags}{amsmath}}
\DeclareOption{tbtags}{%
  \ctagsplit@false \PassOptionsToPackage{tbtags}{amsmath}}
\DeclareOption{fleqn}{}%
%%%%
  \newcommand{\@mainsize}{10}  %% ez 11 volt
%%%%
\newcommand{\@ptsize}{0}
\newcommand{\larger}[1][1]{%
  \count@\@currsizeindex \advance\count@#1\relax
  \ifnum\count@<\z@ \count@\z@ \else\ifnum\count@>12 \count@12 \fi\fi
  \ifcase\count@
    \Tiny\or\Tiny\or\tiny\or\SMALL\or\Small\or\small
    \or\normalsize
    \or\large\or\Large\or\LARGE\or\huge\or\Huge\else\Huge
  \fi
}

\newcommand{\smaller}[1][1]{\larger[-#1]}
\def\@adjustvertspacing{%
  \bigskipamount.7\baselineskip plus.7\baselineskip
  \medskipamount\bigskipamount \divide\medskipamount\tw@
  \smallskipamount\medskipamount \divide\smallskipamount\tw@
  \jot\baselineskip \divide\jot 4 \relax
}
%\showthe\abovedisplayshortskip
\renewcommand\normalsize{\@xsetfontsize\normalsize 6%
  \@adjustvertspacing \let\@listi\@listI}
\newcommand\Tiny{\@xsetfontsize\Tiny 1}
\newcommand\tiny{\@xsetfontsize\tiny 2}
\newcommand\SMALL{\@xsetfontsize\SMALL 3}
\newcommand\Small{\@xsetfontsize\Small 4%
  \@adjustvertspacing
  \def\@listi{
       \topsep\z@skip
       \parsep\z@skip
       \itemsep\z@skip}
       }
\newcommand\small{\@xsetfontsize\small 5\@adjustvertspacing}
%%%%
\newcommand\newsmall{\@xsetfontsize\newsmall 5\@adjustvertspacing} % szoveg
\newcommand\newsmalli{\@xsetfontsize\newsmalli 3\@adjustvertspacing} % abstract
%%%%
\def\footnotesize{\Small}
\def\scriptsize{\SMALL}
\newcommand\large{\@xsetfontsize\large 7\@adjustvertspacing}
\newcommand\Large{\@xsetfontsize\Large 8\@adjustvertspacing}
\newcommand\LARGE{\@xsetfontsize\LARGE 9}
\newcommand\huge{\@xsetfontsize\huge{10}}
\newcommand\Huge{\@xsetfontsize\Huge{11}}
\def\@xsetfontsize#1#2{%
  \chardef\@currsizeindex#2\relax
  \edef\@tempa{\@nx\@setfontsize\@nx#1%
    \@xp\ifcase\@xp\@currsizeindex\@typesizes
      \else{99}{99}\fi}%
  \@tempa
}
\chardef\@currsizeindex=6
%%% OLDALTORESEK
\widowpenalty=10000 
\clubpenalty=300 % 10000
\brokenpenalty=10000 
%%%
\newdimen\linespacing
%%%% 
 \lineskip=1pt \lineskiplimit=1pt
 \normallineskip=1pt \normallineskiplimit=1pt
\def\baselinestretch{1}
%%%%
\headheight=21pt \headsep=14pt
\footskip=12pt
%%%%
\textheight=547pt   % 50.5pc
%%%%
% \topskip=10pt
%%%%
\textwidth=352.2pt          % 30pc
%%%%
\columnsep=10pt \columnseprule=0pt
\marginparwidth=90pt
\marginparsep=11pt
\marginparpush=5pt
\AtBeginDocument{\settoheight{\footnotesep}{\footnotesize M$^1$}}
\skip\footins=7pt plus5pt  %%% plus11pt
\skip\@mpfootins=\skip\footins
\fboxsep=3pt \fboxrule=.4pt
\arrayrulewidth=.4pt    \doublerulesep=2pt
\labelsep=5pt           \arraycolsep=\labelsep
\tabcolsep=\labelsep    \tabbingsep=\labelsep
\floatsep=15pt plus 12pt    \dblfloatsep=15pt plus 12pt
\textfloatsep=\floatsep  \dbltextfloatsep=15pt plus 12pt
\intextsep=\floatsep
\@fptop=0pt plus1fil     \@dblfptop=0pt plus1fil
\@fpbot=0pt plus1fil     \@dblfpbot=0pt plus1fil
\@fpsep=8pt plus2fil     \@dblfpsep=8pt plus2fil\relax
\parskip=0pt \relax
\newdimen\normalparindent
\normalparindent=20pt %%% 12pt volt
\parindent=\normalparindent
\partopsep=0pt \relax \parsep=0pt \relax \itemsep=0pt \relax
\@lowpenalty=51         \@medpenalty=151        \@highpenalty=301
\@beginparpenalty=-\@lowpenalty
\@endparpenalty=-\@lowpenalty
\@itempenalty=-\@lowpenalty
\DeclareOption{10pt}{\def\@mainsize{10}\def\@ptsize{0}%
  \def\@typesizes{%
    \or{5}{6}\or{6}{7}\or{7}{8}\or{8}{10}\or{9}{11.7}%
    \or{10}{13.4}% normalsize
    \or{\@xipt}{13}\or{\@xiipt}{14}\or{\@xivpt}{17}%
    \or{\@xviipt}{20}\or{\@xxpt}{24}}%
  \normalsize \linespacing=\baselineskip
}
\DeclareOption{11pt}{\def\@mainsize{11}\def\@ptsize{1}%
  \def\@typesizes{%
%%%%
    \or{5}{7}\or{7}{8}\or{8}{10}\or{9}{11}\or{10}{12}%
%%%%
    \or{\@xipt}{14.3}% normalsize
    \or{\@xiipt}{15}\or{\@xivpt}{19}\or{\@xviipt}{22}%
    \or{\@xxpt}{24}\or{\@xxvpt}{30}}%
  \normalsize \linespacing=\baselineskip
}

\DeclareOption{12pt}{\def\@mainsize{12}\def\@ptsize{2}%
  \def\@typesizes{%
    \or{7}{8}\or{8}{10}\or{9}{11}\or{10}{12}\or{\@xipt}{13}%
    \or{\@xiipt}{14}% normalsize
    \or{\@xivpt}{17}\or{\@xviipt}{20}\or{\@xxpt}{24}%
    \or{\@xxvpt}{30}\or{\@xxvpt}{30}}%
  \normalsize \linespacing=\baselineskip
}
\DeclareOption{8pt}{\def\@mainsize{8}\def\@ptsize{8}%
  \def\@typesizes{%
    \or{5}{6}\or{5}{6}\or{5}{6}\or{6}{7}\or{7}{8}%
    \or{8}{10}% normalsize
    \or{9}{11}\or{10}{12}\or{\@xipt}{13}%
    \or{\@xiipt}{14}\or{\@xivpt}{17}}%
  \normalsize \linespacing=\baselineskip
}
\DeclareOption{9pt}{\def\@mainsize{9}\def\@ptsize{9}%
  \def\@typesizes{%
    \or{5}{6}\or{5}{6}\or{6}{7}\or{7}{8}\or{8}{10}%
    \or{9}{11}% normalsize
    \or{10}{12}\or{\@xipt}{13}\or{\@xiipt}{14}%
    \or{\@xivpt}{17}\or{\@xviipt}{20}}%
  \normalsize \linespacing=\baselineskip
}
\def\ps@empty{\let\@mkboth\@gobbletwo
  \let\@oddhead\@empty \let\@evenhead\@empty
  \let\@oddfoot\@empty \let\@evenfoot\@empty
  \global\topskip\normaltopskip}
\def\ps@plain{
   \ps@empty
  \def\@oddfoot{\normalfont\scriptsize \hfil\thepage\hfil}%
  \let\@evenfoot\@oddfoot
}
\newswitch{runhead}

%%%%
\def\publname{Publ.\ Math.\ Debrecen}
\def\shortlefthead#1{\def\slhead{#1}}
\def\shortrighthead#1{\def\srhead{#1}}
\def\slhead{\leftmark{}{}}
\def\srhead{\rightmark{}{}}
%%%%
\newif\ifketoldalas \ketoldalastrue
\def\NoDoubleHead{\ketoldalasfalse}

\def\ps@headings{\ps@empty
  \def\@evenhead{%
    \setTrue{runhead}%
    \normalfont\small %%%% \scriptsize
%%%%
%%%%  \rlap{\thepage}\hfil \leftmark{}{}\hfil
 \rlap{\thepage}\hfil \ifodd \c@utol \leftmark{}{} \else
      \ifnum \c@page=\c@utol
       \slhead\ifketoldalas\space{:}\space\srhead\fi
       %\leftmark{}{} : \rightmark{}{}XXXXXX
       \else \leftmark{}{}
 \fi
   \fi
\hfil
%%%%
    }%
  \def\@oddhead{%
    \setTrue{runhead}%
    \normalfont \small \hfil %%%\scriptsize \hfil
    \rightmark{}{}\hfil \llap{\thepage}}%
  \let\@mkboth\markboth
}
\let\sectionname\@empty
\let\subsectionname\@empty
\let\subsubsectionname\@empty
\let\paragraphname\@empty
\let\subparagraphname\@empty
\def\leftmark{\expandafter\@firstoftwo\topmark{}{}}
\def\rightmark{\expandafter\@secondoftwo\botmark{}{}}
%%%%
%%%%
\def\psubmitted{}
\def\submitted#1{\global\def\psubmitted{{#1}}}
\def\prefno{}
\def\refno#1{\global\def\prefno{#1}}
\def\ps@firstpage{\ps@plain
  \def\@oddfoot{
     %\normalfont\scriptsize \hfil\thepage
     \hfil
     \global\topskip\normaltopskip
     }%
  \let\@evenfoot\@oddfoot
%%%
  \def\@oddhead{
    \ifx\@empty\PVOL
       \ifx\@empty\PYEAR
         \hfill\vtop{%
           \hbox to 8.3cm{\hfill\small\textit{\publname}}%
           \kern6.5pt
           \hbox to 8.3cm{\hss\small\textit{Manuscript%
              \ifx\@empty\psubmitted
              \else
              \space(\psubmitted)%
              \fi}}%
          }
       \else
         \hfill\vtop{%
           \hbox to 8.3cm{\hfill\small\textit{\publname}}
           \kern6.5pt
           \hbox to 8.3cm{\hfill\small\textrm{(\PYEAR),\ \theelso--\theutol}}
          }
       \fi
    \else
       \ifnum\cpvol=1
         \hfill\vtop{\hbox to 8.3cm{\hfill\small\textit{\publname}}
         \kern6.5pt
         \hbox to 8.3cm{\hfill\small\emph{Proof-sheets 
           for paper} \textrm{Ref.\ no.:~\prefno \ (\PYEAR),\ \theelso--\theutol}}}
       \else
         \hfill\vtop{\hbox to 8.3cm{\hfill\small\textit{\publname}}
         \kern6.5pt
         \ifnum\cpvol=2 %*1
           \hbox to 8.3cm{\hfill\small\it Received \RECINFO} %*1
         \else %*1
         		\hbox to 8.3cm{\hfill\small
            		  \ifx\@empty\PINFO
          		    \else
              	     \textit{\PINFO}%
            		  \fi
         		    \textrm{\enskip\textbf{\PVOL}%
            		  \ifx\@empty\PISSUE
                  \else%
                	   /\textbf{\PISSUE}%
                  \fi 
                \ (\PYEAR),\ \theelso--\theutol}}%
         \fi %*1
         }
       \fi
   \fi
}
}
%%%%
%%%%
\long\def\@nilgobble#1\@nil{}
\def\markboth#1#2{%
  \begingroup
    \@temptokena{{#1}{#2}}\xdef\@themark{\the\@temptokena}%
    \mark{\the\@temptokena}%
  \endgroup
  \if@nobreak\ifvmode\nobreak\fi\fi}
\def\ps@myheadings{\ps@headings \let\@mkboth\@gobbletwo}
\newskip\normaltopskip
\normaltopskip=10pt \relax
\let\sectionmark\@gobble
\let\subsectionmark\@gobble
\let\subsubsectionmark\@gobble
\let\paragraphmark\@gobble

\DeclareOption{makeidx}{}
%%%%
\ExecuteOptions{centertags,a4paper,portrait,%
  10pt,twoside,onecolumn,final}
%%%%
\ProcessOptions\relax
\if@compatibility
  \def\@tempa{\RequirePackage{amstex}\relax}%
\else
  \@ifclasswith{\@classname}{nomath}{%
    \let\@tempa\relax
  }{%
    \def\@tempa{\RequirePackage{amsmath}\relax}%
  }%
\fi
\@tempa % load amstex.sty or amsmath.sty
\@ifundefined{numberwithin}{%
  \newcommand{\numberwithin}[3][\arabic]{%
    \@ifundefined{c@#2}{\@nocounterr{#2}}{%
      \@ifundefined{c@#3}{\@nocnterr{#3}}{%
        \@addtoreset{#2}{#3}%
        \@xp\xdef\csname the#2\endcsname{%
          \@xp\@nx\csname the#3\endcsname .\@nx#1{#2}}}}%
  }
  \csname newtoks\endcsname\@emptytoks
}{}
\if@compatibility
\else
  \@ifclasswith{\@classname}{noamsfonts}{%
    % amsfonts package is not wanted
  }{%
    % amsfonts package IS wanted; test whether a recent enough version
    % seems to be installed
    \begingroup \fontencoding{U}\fontfamily{msa}\try@load@fontshape\endgroup
    \global\@xp\let\csname U+msa\endcsname\relax % reset
    \@ifundefined{U/msa/m/n}{%
      \ClassError{\@classname}{%
  Package `amsfonts' not installed, or version too old?\MessageBreak
  Unable to get font info for the `msam' fonts in the expected form%
      }{%
  The amsfonts package will not be loaded, to avoid probable\MessageBreak
  incompatibility problems. You can (a) use the `noamsfonts'
      documentclass\MessageBreak
  option next time, or (b) check that the amsfonts package is
      installed\MessageBreak
  correctly, and is not too old to be compatible.%
      }%
    }{%
      \RequirePackage{amsfonts}[1995/01/01]\relax
    }%
  }
\fi % end yesamsfonts branch
\let\cleardouble@page\cleardoublepage
\AtBeginDocument{%
  \ifx\cleardouble@page\cleardoublepage
    \def\cleardoublepage{\clearpage{\pagestyle{empty}\cleardouble@page}}
  \fi
}
\newcommand{\uppercasenonmath}[1]{\toks@\@emptytoks
  \@xp\@skipmath\@xp\@empty#1$$%
  \edef#1{\@nx\protect\@nx\@upprep\the\toks@}%
}
\newcommand{\@upprep}{%
  \spaceskip1.3\fontdimen2\font plus1.3\fontdimen3\font
  \upchars@}
\newcommand{\upchars@}{%
  \def\ss{SS}\def\i{I}\def\j{J}\def\ae{\AE}\def\oe{\OE}%
  \def\o{\O}\def\aa{\AA}\def\l{\L}\def\Mc{M{\scshape c}}}
\providecommand{\Mc}{Mc}
\newcommand{\@skipmath}{}
\long\def\@skipmath#1$#2${%
  \@xskipmath#1\(\)%
  \@ifnotempty{#2}{\toks@\@xp{\the\toks@$#2$}\@skipmath\@empty}}%
\newcommand{\@xskipmath}{}
\long\def\@xskipmath#1\(#2\){%
  \uppercase{\toks@\@xp\@xp\@xp{\@xp\the\@xp\toks@#1}}%
  \@ifnotempty{#2}{\toks@\@xp{\the\toks@\(#2\)}\@xskipmath\@empty}}%
\def\altucnm#1{%
  \MakeTextUppercase{\toks@{#1}}%
  \edef#1{\the\toks@}%
}
\AtBeginDocument{%
  \@ifundefined{MakeTextUppercase}{}{\let\uppercasenonmath\altucnm}%
}
\@ifundefined{MakeUppercase}{\let\MakeUppercase\uppercase}{}%
\newcommand{\today}{%
  \relax\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
%%\if@compatibility
%%\else
%%  \def\@obsolete@fontswitch#1#2#3{%
%%    \@latex@warning@no@line{%
%%      Command {\string#1...}\on@line\space is obsolete;\MessageBreak
%%      the LaTeX2e equivalent is \string#3{...}}%

%%    \gdef#1{\@fontswitch\relax#3}%
%%  }
%%  \DeclareRobustCommand*\cal{%
%%    \@xp\@obsolete@fontswitch\csname cal \endcsname\relax\mathcal}
%%  \DeclareRobustCommand*\mit{%
%%    \@xp\@obsolete@fontswitch\csname mit \endcsname\relax\mathnormal}
%%\fi
\renewcommand*{\title}[2][]{\gdef\shorttitle{#1}\gdef\@title{#2}}
\edef\title{\@nx\@dblarg
  \@xp\@nx\csname\string\title\endcsname}
\renewcommand{\author}[2][]{%
  \ifx\@empty\authors
    \gdef\authors{#2}%
  \else
    \g@addto@macro\authors{\and#2}%
    \g@addto@macro\addresses{\author{}}%
  \fi
  \@ifnotempty{#1}{%
    \ifx\@empty\shortauthors
      \gdef\shortauthors{#1}%
    \else
      \g@addto@macro\shortauthors{\and#1}%
    \fi
  }%
}
\edef\author{\@nx\@dblarg
  \@xp\@nx\csname\string\author\endcsname}
\let\shortauthors\@empty   \let\authors\@empty
\let\addresses\@empty      \let\thankses\@empty
\newcommand{\address}[2][]{\g@addto@macro\addresses{\address{#1}{#2}}}
\newcommand{\curraddr}[2][]{\g@addto@macro\addresses{\curraddr{#1}{#2}}}
\newcommand{\email}[2][]{\g@addto@macro\addresses{\email{#1}{#2}}}
\newcommand{\urladdr}[2][]{\g@addto@macro\addresses{\urladdr{#1}{#2}}}
\renewcommand{\thanks}[1]{%
  \@ifnotempty{#1}{\g@addto@macro\thankses{\thanks{#1}}}%
}
\def\enddoc@text{\ifx\@empty\@translators \else\@settranslators\fi
  \ifx\@empty\addresses \else\@setaddresses\fi}
\AtEndDocument{\enddoc@text}
\let\varuppercase\uppercase
\def\uppercase#1{\varuppercase{\upchars@ #1}}
\def\@setaddresses{
\font\kicsi=cmr6
\font\kicsii=cmti8
\font\kicsiii=cmss8
\scriptsize%\tiny
\kicsi
  \par
  \nobreak \begingroup 
  \def\author##1{
   \nobreak
   \addvspace\bigskipamount}%
  \def\address##1##2{\begingroup 
    \lineskip=-5pt
    \lineskiplimit=-5pt    
    \normallineskip=-5pt
    \normallineskiplimit=-5pt    
    \par\addvspace\bigskipamount
    %%%%
    \noindent
%%%%
    \@ifnotempty{##1}{(\ignorespaces##1\unskip) }%
    %%%%%
    % {
    %\scshape
    %%%%% A vegen a cimek!!!
    %    \small
    %   \scshape
    {\uppercase{\ignorespaces##2}}\par\endgroup}%
    %%%%%%
  \def\curraddr##1##2{\begingroup
    \@ifnotempty{##2}{\nobreak
%%%%
       \noindent
%%%%
       {\itshape Current address}%
      \@ifnotempty{##1}{, \ignorespaces##1\unskip}\/:\space
      ##2\par}\endgroup}%
  \def\email##1##2{\begingroup
    \@ifnotempty{##2}{\par\vskip 5pt
    \nobreak
%%%%
       \noindent
%%%%
    %{
    %\tiny
    %{
    %\itshape
    {{\kicsii\ignorespaces E-mail:}\space %%%% address}%
    %  \@ifnotempty{##1}{, \ignorespaces##1\unskip}
    % \/:\space
%%%%
      % \sffamily
      \kicsiii##2}\par}\endgroup}%
%      \ttfamily##2\par}\endgroup}%
%%%%
  \def\urladdr##1##2{\begingroup
    \@ifnotempty{##2}{\nobreak
%%%%
       \noindent
%%%%
   {\itshape URL}%
      \@ifnotempty{##1}{, \ignorespaces##1\unskip}\/:\space
      \ttfamily##2\par}\endgroup}%
  \addresses
%%%%
% ide jon a received!!!!! XXXXXX
 \par\vspace{15pt}
   %
   \ifx\@empty\RECINFO
   \else
     \begin{center} \normalsize\textit{(Received \RECINFO)}\end{center}
%    \noindent\hbox to\hsize{\hfill\normalsize\textit{(Received \RECINFO)}\hfill}
   \fi
% \ifx\@empty\recdate
% \else
%   \ifx\@empty\recplus
%     \noindent\hbox to\hsize{\hfill\normalsize \textit{(Received \recdate)} \hfill}
%   \else
%     \noindent\hbox to\hsize{\hfill\normalsize \textit{(Received \recdate;{}~\recplus)} \hfill}
%   \fi
% \fi
%%%
  \endgroup
}
\let\@date\@empty
\def\dedicatory#1{\def\@dedicatory{#1}}
\let\@dedicatory=\@empty
\def\keywords#1{\def\@keywords{#1}}
\let\@keywords=\@empty
\newcommand*\subjclass[2][1991]{%
  \def\@subjclass{#2}%
  \@ifundefined{subjclassname@#1}{%
    \ClassWarning{\@classname}{Unknown edition (#1) of Mathematics
      Subject Classification; using '1991'.}%
  }{%
    \@xp\let\@xp\subjclassname\csname subjclassname@#1\endcsname
  }%
}
\let\@subjclass=\@empty
\def\commby#1{\def\@commby{(Communicated by #1)}}
\let\@commby=\@empty
\def\translator#1{%
  \ifx\@empty\@translators \def\@translators{#1}%
  \else\g@addto@macro\@translators{\and#1}\fi}
\let\@translators=\@empty
\def\@settranslators{\par\begingroup
  \addvspace{6\p@\@plus9\p@}%
  \hbox to\columnwidth{\hss\normalfont\normalsize
    Translated by %
    \andify\@translators \uppercasenonmath\@translators
    \@translators}
  \endgroup
}
\newcommand{\xandlist}[4]{\@andlista{{#1}{#2}{#3}}#4\and\and}
\def\@andlista#1#2\and#3\and{\@andlistc{#2}\@ifnotempty{#3}{%
  \@andlistb#1{#3}}}
\def\@andlistb#1#2#3#4#5\and{%
  \@ifempty{#5}{%
    \@andlistc{#2#4}%
  }{%
    \@andlistc{#1#4}\@andlistb{#1}{#3}{#3}{#5}%
  }}
\let\@andlistc\@iden
\newcommand{\nxandlist}[4]{%
  \def\@andlistc##1{\toks@\@xp{\the\toks@##1}}%
  \toks@{\toks@\@emptytoks \@andlista{{#1}{#2}{#3}}}%
  \the\@xp\toks@#4\and\and
  \edef#4{\the\toks@}%
  \let\@andlistc\@iden}
\newcommand{\andify}{%
  \nxandlist{\unskip, }{\unskip{} and~}
  %%%%%
  {\unskip{} and~}}
  %%%%%
\def\and{\unskip{ }and \ignorespaces}
\def\maketitle{\par
  \@topnum\z@ % this prevents figures from falling at the top of page 1
%%%%
  %  \@setcopyright
%%%%
  %%%%
  \thispagestyle{firstpage}   % firstpage}% this sets first page specifications
  %%%%
  %\uppercasenonmath\shorttitle
  \ifx\@empty\shortauthors \let\shortauthors\shorttitle
  \else \andify\shortauthors
  \fi
  \@maketitle@hook
  \begingroup
  \@maketitle
  \toks@\@xp{\shortauthors}\@temptokena\@xp{\shorttitle}%
  \toks4{\def\\{ \ignorespaces}}% defend against questionable usage
  \edef\@tempa{%
    \@nx\markboth{\the\toks4
      \@nx %\MakeUppercase
      {\the\toks@}}{\the\@temptokena}}%
  \@tempa
  \endgroup
  \c@footnote\z@
  \def\do##1{\let##1\relax}%
  \do\maketitle \do\@maketitle \do\title \do\@xtitle \do\@title
  \do\author \do\@xauthor \do\address \do\@xaddress
  \do\email \do\@xemail \do\curraddr \do\@xcurraddr
  \do\commby \do\@commby
  \do\dedicatory \do\@dedicatory \do\thanks \do\thankses
  \do\keywords \do\@keywords \do\subjclass \do\@subjclass
\ifoooldal\oldkiir\fi} %%% 
\def\@maketitle@hook{\global\let\@maketitle@hook\@empty}
\def\@maketitle{%
  \normalfont\normalsize
  \let\@makefnmark\relax  \let\@thefnmark\relax
  \ifx\@empty\@date\else \@footnotetext{\@setdate}\fi
  \ifx\@empty\@subjclass\else \@footnotetext{\@setsubjclass}\fi
  \ifx\@empty\@keywords\else \@footnotetext{\@setkeywords}\fi
  \ifx\@empty\thankses\else \@footnotetext{%
    \def\par{\let\par\@par}\@setthanks}\fi
  \@mkboth{\@nx\shortauthors}{\@nx\shorttitle}%
%%%%
%  \begin{flushright}
%  jhjh
%  \end{flushright}
%%%%
  \global\topskip115\p@
  %42\p@
  \relax % 5.5pc   "   "   "     "     "
  \@settitle
  \ifx\@empty\authors \else \@setauthors \fi
  \ifx\@empty\@dedicatory
  \else
   %%%%
   % \baselineskip18\p@
   \baselineskip35\p@
   %%%%
    \vtop{\centering{
       %%%%
       % \footnotesize\itshape\@dedicatory\@@par}%
       \normalsize\itshape\@dedicatory\@@par}%
       %%%%
      \global\dimen@i\prevdepth}\prevdepth\dimen@i
  \fi
  \@setabstract
  \normalsize
  \if@titlepage
    \newpage
  \else
%%%%
  %  \dimen@34\p@ \advance\dimen@-\baselineskip
    \dimen@16\p@ \advance\dimen@-\baselineskip
%%%%
   \vskip\dimen@\relax
  \fi
} % end \@maketitle
\AtBeginDocument{%
  \@ifundefined{publname}{%
    \let\publname\@empty
    \let\@serieslogo\@empty
  }{%
    \def\@serieslogo{\article@logo}%
  }%
}
\AtBeginDocument{%
  \@ifundefined{volinfo}{%
    \def\volinfo{%
      Volume \currentvolume, Number \number0\currentissue
      \if\@printyear , \currentmonth\ \currentyear\fi
    }%
  }{}%
}
\def\@printyear{TF}% boolean false
%%%%%
%%%%%
\def\issueinfo#1#2#3#4{\def\currentvolume{#1}\def\currentissue{#2}%
  \def\currentmonth{#3}\def\currentyear{#4}}
\issueinfo{00}% volume number
  {0}%        % issue number
  {Xxxx}%     % month
  {XXXX}%     % year
%%%%%
  \newcounter{elso}
  \newcounter{utel}
  \newcounter{utol}
%%%%
%\def\copyrightinfo#1#2{
%  \def\copyrightyear{#1}
%  \def\copyrightholder{#2}
%  }
%  \copyrightinfo{0000}{(copyright holder)}
%%%%
%%%% atirni magyar nevure!!!!!
%%%%
\def\pagespan#1#2{\setcounter{page}{#1}%
  \ifnum\c@page<\z@ \pagenumbering{roman}\setcounter{page}{-#1}\fi
  \def\start@page{#1}\def\end@page{#2}
%%%%
  \global\setcounter{elso}{\start@page}
  \global\setcounter{utel}{\end@page}
  \global\setcounter{utol}{\end@page}
  \global\addtocounter{utel}{-2}
%%%%
}
\pagespan{000}{000}
\AtBeginDocument{%
  \@ifundefined{pageinfo}{%
    \def\pageinfo{%
      \ifnum\start@page=\z@
        Pages 000--000
      \else
        \ifx\start@page\end@page
          Page \start@page
        \else
          Pages \start@page--\end@page
        \fi
      \fi}%
  }{}%
}
\@ifundefined{ISSN}{\def\ISSN{0000-0000}}{}
\newcommand\PII[1]{\def\@PII{#1}}
\PII{S \ISSN(XX)0000-0}
\newinsert\copyins
\skip\copyins=1.5pc
\count\copyins=1000 % magnification factor, 1000 = 100%
\dimen\copyins=.5\textheight % maximum allowed per page
\def\@setcopyright{%
  \ifx\@empty\@serieslogo
  \else\ifx\@empty\copyrightyear
  \else
    \insert\copyins{\hsize\textwidth
      \parfillskip\z@ \leftskip\z@\@plus.9\textwidth
      \fontsize{6}{7\p@}\normalfont\upshape
      \everypar{}%
      \vskip-\skip\copyins \nointerlineskip
      \noindent\vrule\@width\z@\@height\skip\copyins
      \copyright\copyrightyear\ \copyrightholder
      \par
      \kern\z@}%
  \fi\fi
}
\def\@combinefloats{%
  \ifx \@toplist\@empty \else \@cflt \fi
  \ifx \@botlist\@empty \else \@cflb \fi
  \ifvoid\copyins \else \@cflci \fi
}
\def\@cflci{%
  \setbox\@outputbox\vbox{%
    \unvbox\@outputbox
    \vskip\skip\copyins
    \if@twocolumn \else \vskip\z@ plus\p@ \fi
    \hbox to\columnwidth{%
      \hss\vbox to\z@{\vss
        \if@twocolumn
          \if@firstcolumn \else \unvbox\copyins \fi
        \else
          \unvbox\copyins
        \fi
        }}}%
  \if@twocolumn \if@firstcolumn
    \insert\copyins{\unvbox\copyins}%
  \fi\fi
  \global\count\copyins=999 \relax
}
\newcommand{\abstractname}{Abstract}
\newcommand{\keywordsname}{Key words and phrases}
\newcommand{\subjclassname}{%
  %%%%%
  % \textup{1991}
  %%%%%
  Mathematics Subject Classification}
\@xp\let\csname subjclassname@1991\endcsname \subjclassname
\@namedef{subjclassname@2000}{%
  \textup{2000} Mathematics Subject Classification}
\def\@tempb{amsart}
\ifx\@classname\@tempb
  \newcommand{\datename}{\textit{Date}:}
\else
  \newcommand{\datename}{Received by the editors}
\fi
\def\@settitle{\begin{center}%
  \baselineskip14\p@\relax
    \large\bfseries
    %%%%
    % \uppercasenonmath
    %%%% \@title
  \boldmath{\@title}
  \end{center}%
}
\def\@setauthors{%
  \begingroup
  \trivlist
  \centering\footnotesize
%%%
 %  \@topsep30\p@\relax
  \@topsep20\p@\relax
%%%
  \advance\@topsep by -\baselineskip
  \item\relax
  \andify\authors
  \def\\{\protect\linebreak}%
%%%%
   By \authors                    % \MakeUppercase{\authors}%
%%%%
  \endtrivlist
  \endgroup
}
\def\@setdate{\datename\ \@date\@addpunct.}
\def\@setsubjclass{%
  %%%%
  {\itshape\subjclassname:}\enspace\@subjclass\@addpunct.}
  %%%%
\def\@setkeywords{%
  %%%%
  {\itshape \keywordsname:}\enspace \@keywords\@addpunct.}
  %%%%
\def\@setthanks{\def\thanks##1{\par##1\@addpunct.}\thankses}
\newbox\abstractbox
\newenvironment{abstract}{%
  \ifx\maketitle\relax
    \ClassWarning{\@classname}{Abstract should precede
      \protect\maketitle\space in AMS documentclasses; reported}%
  \fi
  \global\setbox\abstractbox=\vtop \bgroup
    \normalfont\small %%%\Small
      \list{}
      {\labelwidth\z@
      %%%%
      \leftmargin 0pc %3pc
      \rightmargin\leftmargin
      %%%%
       \listparindent \normalparindent \itemindent\z@
       \parsep\z@ \@plus\p@
       \let\fullwidthdisplay\relax
    }%
    %%%%
     \item[\hskip\labelsep
    %%%%
    % \scshape
    %%%%
    %\bf
    %%\indent{\newsmalli\bfseries{\abstractname.}}]%
    \indent{\textbf{\abstractname.}}]%
}{%
  \endlist\egroup
  \ifx\@setabstract\relax \@setabstracta \fi
}
\def\@setabstract{\@setabstracta \global\let\@setabstract\relax}
\def\@setabstracta{%
  \ifvoid\abstractbox
  \else
  %%%%
  %  \skip@20\p@ \advance\skip@-\lastskip
  \skip@28\p@ \advance\skip@-\lastskip
  %%%%
    \advance\skip@-\baselineskip \vskip\skip@
    \box\abstractbox
    \prevdepth\z@ % because \abstractbox is a vtop
  \fi
}
\def\titlepage{%
  \clearpage
  \thispagestyle{empty}\setcounter{page}{0}}
\def\endtitlepage{\newpage}
\def\labelenumi{(\theenumi)}
\def\theenumi{\@arabic\c@enumi}
\def\labelenumii{(\theenumii)}
\def\theenumii{\@alph\c@enumii}
\def\p@enumii{\theenumi}
\def\labelenumiii{(\theenumiii)}
\def\theenumiii{\@roman\c@enumiii}
\def\p@enumiii{\theenumi(\theenumii)}
\def\labelenumiv{(\theenumiv)}
\def\theenumiv{\@Alph\c@enumiv}
\def\p@enumiv{\p@enumiii\theenumiii}
% \def\labelitemi{$\m@th\bullet$}
\def\labelitemi{\potty}
\def\labelitemii{\bfseries --}% \upshape already done by \itemize
\def\labelitemiii{$\m@th\ast$}
\def\labelitemiv{$\m@th\cdot$}
\newenvironment{verse}{\let\\\@centercr
  \list{}{\itemsep\z@ \itemindent -1.5em\listparindent\itemindent
  \rightmargin\leftmargin \advance\leftmargin 1.5em}\item[]%
}{%
  \endlist
}
\let\endverse=\endlist % for efficiency
\newenvironment{quotation}{\list{}{%
    \leftmargin3pc \listparindent\normalparindent
    \itemindent\z@
    \rightmargin\leftmargin \parsep\z@ \@plus\p@}%
  \item[]%
}{%
  \endlist
}
\let\endquotation=\endlist % for efficiency
\newenvironment{quote}{%
  \list{}{\rightmargin\leftmargin}\item[]%
}{%
  \endlist
}
\let\endquote=\endlist % for efficiency
\def\trivlist{\parsep\parskip\@nmbrlistfalse
  \@trivlist \labelwidth\z@ \leftmargin\z@
  \itemindent\z@
  \let\@itemlabel\@empty
  \def\makelabel##1{\upshape##1}}
\renewenvironment{enumerate}{%
  \ifnum \@enumdepth >3 \@toodeep\else
      \advance\@enumdepth \@ne
      \edef\@enumctr{enum\romannumeral\the\@enumdepth}\list
      {\csname label\@enumctr\endcsname}{\usecounter
        {\@enumctr}\def\makelabel##1{\hss\llap{\upshape##1}}}\fi
}{%
  \endlist
}
\let\endenumerate=\endlist % for efficiency
\renewenvironment{itemize}{%
  \ifnum\@itemdepth>3 \@toodeep
  \else \advance\@itemdepth\@ne
    \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
    \list{\csname\@itemitem\endcsname}%
      {\def\makelabel##1{\hss\llap{\upshape##1}}}%
  \fi
}{%
  \endlist
}
\let\enditemize=\endlist % for efficiency

\newcommand{\descriptionlabel}[1]{\hspace\labelsep \upshape\bfseries #1:}
\newenvironment{description}{\list{}{%
  \advance\leftmargini6\p@ \itemindent-12\p@
  \labelwidth\z@ \let\makelabel\descriptionlabel}%
}{
  \endlist
}
\let\enddescription=\endlist % for efficiency
\let\upn=\textup
\AtBeginDocument{%
  \labelsep=5pt\relax
  \setcounter{enumi}{13}\setcounter{enumii}{13}%
  \setcounter{enumiii}{13}\setcounter{enumiv}{13}%
  \settowidth\leftmargini{\labelenumi\hskip\labelsep}%
  \advance\leftmargini by \normalparindent
  \settowidth\leftmarginii{\labelenumii\hskip\labelsep}%
  \settowidth\leftmarginiii{\labelenumiii\hskip\labelsep}%
  \settowidth\leftmarginiv{\labelenumiv\hskip\labelsep}%
  \setcounter{enumi}{0}\setcounter{enumii}{0}%
  \setcounter{enumiii}{0}\setcounter{enumiv}{0}%
  \leftmarginv=10pt  \leftmarginvi=\leftmarginv
  \leftmargin=\leftmargini
  \labelwidth=\leftmargini \advance\labelwidth-\labelsep
  \@listi}
\newskip\listisep
\listisep\smallskipamount
\def\@listI{\leftmargin\parindent            %22\p@ %\leftmargini
  \topsep\smallskipamount
%  \parsep\smallskipamount
  \itemsep\smallskipamount
  \parsep\z@skip
%  \topsep\z@skip
%  \itemsep\z@skip
  \listparindent\normalparindent}
\let\@listi\@listI
\def\@listii{\leftmargin\leftmarginii
  \labelwidth\leftmarginii \advance\labelwidth-\labelsep
  \topsep\smallskipamount
 % \topsep\z@skip
 % \parsep\z@skip
   \partopsep\z@skip
 %  \itemsep\z@skip
  \itemsep\smallskipamount
 }
\def\@listiii{\leftmargin\leftmarginiii
  \labelwidth\leftmarginiii \advance\labelwidth-\labelsep}
\def\@listiv{\leftmargin\leftmarginiv
  \labelwidth\leftmarginiv \advance\labelwidth-\labelsep}
\def\@listv{\leftmargin\leftmarginv
  \labelwidth\leftmarginv \advance\labelwidth-\labelsep}
\def\@listvi{\leftmargin\leftmarginvi
  \labelwidth\leftmarginvi \advance\labelwidth-\labelsep}
\@ifclasswith{\@classname}{fleqn}{%
  \let\@tempa\@iden
  \AtBeginDocument{\mathindent\leftmargini}%
}{\let\@tempa\@gobble}%
\@ifpackageloaded{amsmath}{\let\@tempa\@gobble}{%
  \@ifpackageloaded{amstex}{\let\@tempa\@gobble}{}%
}
\@tempa{%
  \def\[{\relax
    \ifmmode\@badmath
    \else
      \begin{trivlist}%
      \@beginparpenalty\predisplaypenalty
      \@endparpenalty\postdisplaypenalty
      \item[]\leavevmode
      \hbox to\linewidth\bgroup$\displaystyle
      \hskip\mathindent\bgroup
    \fi}%
  \def\]{\relax
    \ifmmode
      \egroup \m@th$\hfil \egroup
      \end{trivlist}%
    \else \@badmath
    \fi}%
  \renewenvironment{equation}{%
    \@beginparpenalty\predisplaypenalty
    \@endparpenalty\postdisplaypenalty
    \refstepcounter{equation}%
    \@topsep\abovedisplayskip \trivlist
    \item[]\leavevmode
    \hbox to\linewidth\bgroup\hskip\mathindent$\displaystyle
  }{%
    \m@th$\hfil \displaywidth\linewidth \hbox{\@eqnnum}\egroup
    \endtrivlist
  }%
  \renewenvironment{eqnarray}{%
    \stepcounter{equation}\let\@currentlabel\theequation
    \global\@eqnswtrue \global\@eqcnt\z@ \tabskip\mathindent
    \let\\=\@eqncr \abovedisplayskip\topsep
    \ifvmode \advance\abovedisplayskip\partopsep \fi
    \belowdisplayskip\abovedisplayskip
    \belowdisplayshortskip\abovedisplayskip
    \abovedisplayshortskip\abovedisplayskip
    $$\everycr{}\halign to\linewidth\bgroup
      \hskip\@centering
      $\displaystyle\tabskip\z@skip####\m@th$&%
      \@eqnsel \global\@eqcnt\@ne
      \hfil${}####{}\m@th$\hfil&%
      \global\@eqcnt\tw@
      $\displaystyle ####\m@th$\hfil\tabskip\@centering&%
      \global\@eqcnt\thr@@
      \hbox to \z@\bgroup\hss####\egroup\tabskip\z@skip\cr
    }{%
      \@@eqncr \egroup \global\advance\c@equation\m@ne$$%

      \global\@ignoretrue
    }%
  \newdimen\mathindent
  \mathindent\leftmargini
}
\def\@startsection#1#2#3#4#5#6{%
 \if@noskipsec \leavevmode \fi
 \par \@tempskipa #4\relax
 \@afterindenttrue
 \ifdim \@tempskipa <\z@ \@tempskipa -\@tempskipa \@afterindentfalse\fi
 \if@nobreak \everypar{}\else
     \addpenalty\@secpenalty\addvspace\@tempskipa\fi
 \@ifstar{\@dblarg{\@sect{#1}{\@m}{#3}{#4}{#5}{#6}}}%
         {\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}%
}
\def\@seccntformat#1{%
  \protect\textup{\protect\@secnumfont
    \csname the#1\endcsname
    \protect\@secnumpunct
  }%
}
%%%%
% \def\@secnumfont{\mdseries}
%%%%
 \def\@secnumfont{\bfseries}
\def\@sect#1#2#3#4#5#6[#7]#8{%
  \edef\@toclevel{\ifnum#2=\@m 0\else\number#2\fi}%
  \ifnum #2>\c@secnumdepth \let\@secnumber\@empty
  \else \@xp\let\@xp\@secnumber\csname the#1\endcsname\fi
  \@tempskipa #5\relax
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
    \edef\@secnumpunct{%
      \ifdim\@tempskipa>\z@ % not a run-in section heading
        \@ifnotempty{#8}{.\@nx\enspace}%
      \else .\@nx\enspace
      \fi
    }%
    \protected@edef\@svsec{%
      \ifnum#2<\@m
        \@ifundefined{#1name}{}{%
          \ignorespaces\csname #1name\endcsname\space
        }%
      \fi
      \@seccntformat{#1}%
    }%
  \fi
  \ifdim \@tempskipa>\z@ % then this is not a run-in section heading
    \begingroup #6\relax
    \@hangfrom{\hskip #3\relax\@svsec}{\interlinepenalty\@M \@vastag{#8}\par}%
    \endgroup
    \ifnum#2>\@m \else \@tocwrite{#1}{#8}\fi
  \else
  \def\@svsechd{#6\hskip #3\@svsec
    \@ifnotempty{#8}{\ignorespaces#8\unskip
       \@addpunct.}%
    \ifnum#2>\@m \else \@tocwrite{#1}{#8}\fi
  }%
  \fi
  \global\@nobreaktrue
  \@xsect{#5}}
\let\@ssect\relax
\newcounter{part}
\newcounter{section}
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]
\newcounter{subparagraph}[paragraph]
\renewcommand\thepart          {\arabic{part}}
\renewcommand\thesection       {\arabic{section}}
\renewcommand\thesubsection    {\thesection.\arabic{subsection}}
\renewcommand\thesubsubsection {\thesubsection .\arabic{subsubsection}}
\renewcommand\theparagraph     {\thesubsubsection.\arabic{paragraph}}
\renewcommand\thesubparagraph  {\theparagraph.\arabic{subparagraph}}
\setcounter{secnumdepth}{3}
\def\partname{Part}
\def\part{\@startsection{part}{0}%
  \z@{\linespacing\@plus\linespacing}{.5\linespacing}%
  {\normalfont\bfseries\raggedright}}
\def\specialsection{\@startsection{section}{1}%
  \z@{\linespacing\@plus\linespacing}{.5\linespacing}%
  {\normalfont\centering}}
\newif\ifboldsection \boldsectiontrue
\def\@vastag#1{\ifboldsection\boldmath{#1}\else#1\fi}
\def\section{\@startsection{section}{1}%
  \z@{2\linespacing\@plus\linespacing
  }{.75\linespacing}%
  {\bfseries
  \centering}}
\def\subsection{\@startsection{subsection}{2}%
  \z@{.5\linespacing\@plus.7\linespacing}{-.5em}%
  {%\normalfont
  %%%%
  %\small
  %%%%
  %\newsmall
  \bfseries}}
\def\subsubsection{\@startsection{subsubsection}{3}%
  \z@{.5\linespacing\@plus.7\linespacing}{-.5em}%
  {\normalfont\itshape}}
\def\paragraph{\@startsection{paragraph}{4}%
  \z@\z@{-\fontdimen2\font}%
  \normalfont}
\def\subparagraph{\@startsection{subparagraph}{5}%
  \z@\z@{-\fontdimen2\font}%
  \normalfont}
\def\appendix{\par\c@section\z@ \c@subsection\z@
   \let\sectionname\appendixname
   \def\thesection{\@Alph\c@section}}
\def\appendixname{Appendix}
\def\@Roman#1{\@xp\@slowromancap
  \romannumeral#1@}%
\def\@slowromancap#1{\ifx @#1% then terminate
  \else
    \if i#1I\else\if v#1V\else\if x#1X\else\if l#1L\else\if
    c#1C\else\if m#1M\else#1\fi\fi\fi\fi\fi\fi
    \@xp\@slowromancap
  \fi
}
\newcommand{\@pnumwidth}{1.6em}
\newcommand{\@tocrmarg}{2.6em}
\setcounter{tocdepth}{2}
\newswitch{toc}
\newswitch{lof}
\newswitch{lot}
\newcommand\contentsnamefont{\scshape}
\def\@starttoc#1#2{\begingroup
  \setTrue{#1}%
  \par\removelastskip\vskip\z@skip
  \@startsection{}\@M\z@{\linespacing\@plus\linespacing}%
    {.5\linespacing}{\centering\contentsnamefont}{#2}%
  \ifx\contentsname#2%
  \else \addcontentsline{toc}{section}{#2}\fi
  \makeatletter
  \@input{\jobname.#1}%
  \if@filesw
    \@xp\newwrite\csname tf@#1\endcsname
    \immediate\@xp\openout\csname tf@#1\endcsname \jobname.#1\relax
  \fi
  \global\@nobreakfalse \endgroup
  \addvspace{32\p@\@plus14\p@}%
  \let\tableofcontents\relax
}
\def\contentsname{Contents}
\def\listfigurename{List of Figures}
\def\listtablename{List of Tables}
\def\tableofcontents{%
  \@starttoc{toc}\contentsname
}
\def\listoffigures{\@starttoc{lof}\listfigurename}
\def\listoftables{\@starttoc{lot}\listtablename}
\AtBeginDocument{%
  \@for\@tempa:=-1,0,1,2,3\do{%
    \@ifundefined{r@tocindent\@tempa}{%
      \@xp\gdef\csname r@tocindent\@tempa\endcsname{0pt}}{}%
  }%
}
\def\@writetocindents{%
  \begingroup
  \@for\@tempa:=-1,0,1,2,3\do{%
    \immediate\write\@auxout{%
      \string\newlabel{tocindent\@tempa}{%
        \csname r@tocindent\@tempa\endcsname}}%
  }%
  \endgroup}
\AtEndDocument{\@writetocindents}

\let\indentlabel\@empty
\def\@tochangmeasure#1{\sbox\z@{#1}%
  \ifdim\wd\z@>\csname r@tocindent\@toclevel\endcsname\relax
    \@xp\xdef\csname r@tocindent\@toclevel\endcsname{\the\wd\z@}%
  \fi
}
\def\@toclevel{0}
\def\@tocline#1#2#3#4#5#6#7{\relax
  \ifnum #1>\c@tocdepth % then omit
  \else
    \par \addpenalty\@secpenalty\addvspace{#2}%
    \begingroup \hyphenpenalty\@M
    \@ifempty{#4}{%
      \@tempdima\csname r@tocindent\number#1\endcsname\relax
    }{%
      \@tempdima#4\relax
    }%
    \parindent\z@ \leftskip#3\relax \advance\leftskip\@tempdima\relax
    \rightskip\@pnumwidth plus4em \parfillskip-\@pnumwidth
    #5\leavevmode\hskip-\@tempdima #6\nobreak\relax
    \hfil\hbox to\@pnumwidth{\@tocpagenum{#7}}\par
    \nobreak
    \endgroup
  \fi}
\def\@tocpagenum#1{\hss{\mdseries #1}}
\def\@tocwrite#1{\@xp\@tocwriteb\csname toc#1\endcsname{#1}}
\def\@tocwriteb#1#2#3{%
  \begingroup
    \def\@tocline##1##2##3##4##5##6{%
      \ifnum##1>\c@tocdepth
      \else \sbox\z@{##5\let\indentlabel\@tochangmeasure##6}\fi}%
    \csname l@#2\endcsname{#1{\csname#2name\endcsname}{\@secnumber}{}}%
  \endgroup
  \addcontentsline{toc}{#2}%
    {\protect#1{\csname#2name\endcsname}{\@secnumber}{#3}}}
\def\l@section{\@tocline{1}{0pt}{1pc}{}{}}
\newcommand{\tocsection}[3]{%
  \indentlabel{\@ifnotempty{#2}{\ignorespaces#1 #2.\quad}}#3}
\def\l@subsection{\@tocline{2}{0pt}{1pc}{5pc}{}}
\let\tocsubsection\tocsection
\def\l@subsubsection{\@tocline{3}{0pt}{1pc}{7pc}{}}
\let\tocsubsubsection\tocsection
\let\l@paragraph\l@subsubsection
\let\tocparagraph\tocsection
\let\l@subparagraph\l@subsubsection
\let\tocsubparagraph\tocsection
\def\l@part{\@tocline{-1}{12pt plus2pt}{0pt}{}{\bfseries}}
\let\tocpart\tocsection
\def\l@chapter{\@tocline{0}{8pt plus1pt}{0pt}{}{}}
\let\tocchapter\tocsection
\newcommand{\tocappendix}[3]{%
  \indentlabel{#1\@ifnotempty{#2}{ #2}.\quad}#3}
\def\l@figure{\@tocline{0}{3pt plus2pt}{0pt}{}{}}
\let\l@table=\l@figure
\def\refname{References}
\def\bibname{Bibliography}
\def\bibliographystyle#1{%
    \if@filesw\immediate\write\@auxout{\string\bibstyle{#1}}\fi
    \def\@tempa{#1}%
    \def\@tempb{amsplain}%
    \def\@tempc{}%
    \ifx\@tempa\@tempb
        \def\@biblabel##1{##1.}%
        \def\bibsetup{}%
    \else
        \def\bibsetup{\labelsep6\p@}%
        \ifx\@tempa\@tempc
            \def\@biblabel##1{}%
            \def\bibsetup{\labelwidth\z@ \leftmargin24\p@
                \itemindent-24\p@
                \labelsep\z@ }%
        \fi
    \fi}
\newenvironment{thebibliography}[1]{%
  \@xp\section\@xp*\@xp{\refname}%
  \normalfont\footnotesize\labelsep .5em\relax
  \renewcommand\theenumiv{\arabic{enumiv}}\let\p@enumiv\@empty
  \list{\@biblabel{\theenumiv}}{\settowidth\labelwidth{\@biblabel{#1}}%
    \leftmargin\labelwidth \advance\leftmargin\labelsep
    %%%%%
    \parsep 2pt
    %%%%%
    \usecounter{enumiv}}%
  \sloppy \clubpenalty\@M \widowpenalty\clubpenalty
  \sfcode`\.=\@m
}{%
  \def\@noitemerr{\@latex@warning{Empty `thebibliography' environment}}%
  \endlist
}
\def\bysame{\leavevmode\hbox to3em{\hrulefill}\thinspace}
\def\newblock{}
\newcommand\MR[1]{\relax\ifhmode\unskip\spacefactor3000 \space\fi
  \def\@tempa##1:##2:##3\@nil{%
    \ifx @##2\@empty##1\else\textbf{##1:}##2\fi}%
  \MRhref{#1}{MR \@tempa#1:@:\@nil}}
\let\MRhref\@gobble
\newcommand\URL{\begingroup
  \def\@sverb##1{%
    \def\@tempa####1##1{\@URL{####1}\egroup\endgroup}%
    \@tempa}%
  \verb}
\let\URLhref\@gobble
\def\@URL#1{\URLhref{#1}#1}
\newif\if@restonecol
\def\theindex{\@restonecoltrue\if@twocolumn\@restonecolfalse\fi
  \columnseprule\z@ \columnsep 35\p@
  \twocolumn[\@xp\section\@xp*\@xp{\indexname}]%
  \thispagestyle{plain}%
  \let\item\@idxitem
  \parindent\z@  \parskip\z@\@plus.3\p@\relax
  \footnotesize}
\def\indexname{Index}
\def\@idxitem{\par\hangindent 2em}
\def\subitem{\par\hangindent 2em\hspace*{1em}}
\def\subsubitem{\par\hangindent 3em\hspace*{2em}}
\def\endtheindex{\if@restonecol\onecolumn\else\clearpage\fi}
\def\indexspace{\par\bigskip}
\def\footnoterule{\kern-.4\p@
   %%%%
        \hrule\@width .333\hsize
        \kern11\p@\kern-\footnotesep
        }
   %%%%
\def\@makefnmark{%
  \leavevmode
  \raise.9ex\hbox{\fontsize\sf@size\z@\normalfont\@thefnmark}%
}
\def\@makefntext{\indent\@makefnmark}
\long\def\@footnotetext#1{%
  \insert\footins{%
    \normalfont\footnotesize
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep \splitmaxdepth \dp\strutbox
    \floatingpenalty\@MM \hsize\columnwidth
    \@parboxrestore
%%%%
%%%% \parindent \normalparindent \sloppy
%%%%
    \protected@edef\@currentlabel{%
      \csname p@footnote\endcsname\@thefnmark}%
    \@makefntext{%
      \rule\z@\footnotesep\baselineskip=11pt\lineskiplimit=0pt \lineskip=1pt
      \ignorespaces#1\unskip\strut\par}}}
\hfuzz=1pt \vfuzz=\hfuzz
\def\sloppy{\tolerance9999 \emergencystretch 3em\relax}
\setcounter{topnumber}{4}
\setcounter{bottomnumber}{4}
\setcounter{totalnumber}{4}
\setcounter{dbltopnumber}{4}
\renewcommand{\topfraction}{.97}
\renewcommand{\bottomfraction}{.97}
\renewcommand{\textfraction}{.03}
\renewcommand{\floatpagefraction}{.9}
\renewcommand{\dbltopfraction}{.97}
\renewcommand{\dblfloatpagefraction}{.9}
\setlength{\floatsep}{12pt plus 6pt minus 4pt}
\setlength{\textfloatsep}{15pt plus 8pt minus 5pt}
\setlength{\intextsep}{12pt plus 6pt minus 4pt}
\setlength{\dblfloatsep}{12pt plus 6pt minus 4pt}
\setlength{\dbltextfloatsep}{15pt plus 8pt minus 5pt}
\setlength{\@fptop}{0pt}% removed ``plus 1fil''
\setlength{\@fpsep}{8pt}% removed ``plus 2fil''
\setlength{\@fpbot}{0pt plus 1fil}
\setlength{\@dblfptop}{0pt}% removed ``plus 1fil''
\setlength{\@dblfpsep}{8pt}% removed ``plus 2fil''
\setlength{\@dblfpbot}{0pt plus 1fil}
\newcommand{\fps@figure}{tbp}
\newcommand{\fps@table}{tbp}
\newcounter{figure}
\def\@captionheadfont{\small\itshape} %{\scshape}
\def\@captionfont{\small\normalfont} %{\normalfont}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\ \thefigure}
\def\figurename{Figure}
\newenvironment{figure}{%
  \@float{figure}%
}{%
  \end@float
}
\newenvironment{figure*}{%
  \@dblfloat{figure}%
}{%
  \end@dblfloat
}
\newcounter{table}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\ \thetable}
\def\tablename{Table}
\newenvironment{table}{%
  \@float{table}%
}{%
  \end@float
}
\newenvironment{table*}{%
  \@dblfloat{table}%
}{%
  \end@dblfloat
}
\def\@floatboxreset{\global\@minipagefalse \centering}
\long\def\@makecaption#1#2{%
  \setbox\@tempboxa\vbox{\color@setgroup
    \advance\hsize-2\captionindent\noindent
    \@captionfont\@captionheadfont#1\@xp\@ifnotempty\@xp
        {\@cdr#2\@nil}{.\@captionfont\upshape\enspace#2}%
    \unskip\kern-2\captionindent\par
    \global\setbox\@ne\lastbox\color@endgroup}%
  \ifhbox\@ne % the normal case
    \setbox\@ne\hbox{\unhbox\@ne\unskip\unskip\unpenalty\unkern}%
  \fi
  \ifdim\wd\@tempboxa=\z@ % this means caption will fit on one line
    \setbox\@ne\hbox to\columnwidth{\hss\kern-2\captionindent\box\@ne\hss}%
  \else % tempboxa contained more than one line
    \setbox\@ne\vbox{\unvbox\@tempboxa\parskip\z@skip
        \noindent\unhbox\@ne\advance\hsize-2\captionindent\par}%
  \fi
  \ifnum\@tempcnta<64 % if the float IS a figure...
    \addvspace\abovecaptionskip
    \hbox to\hsize{\kern\captionindent\box\@ne\hss}%
  \else % if the float IS NOT a figure...
    \hbox to\hsize{\kern\captionindent\box\@ne\hss}%
    \nobreak
    \vskip\belowcaptionskip
  \fi
\relax
}
\newskip\abovecaptionskip \abovecaptionskip=12pt \relax
\newskip\belowcaptionskip \belowcaptionskip=12pt \relax
\newdimen\captionindent \captionindent=3pc
\def\nonbreakingspace{\unskip\nobreak\ \ignorespaces}
\def~{\protect\nonbreakingspace}
\def\@biblabel#1{\@ifnotempty{#1}{[#1]}}
\def\@cite#1#2{{%
  \m@th\upshape\mdseries[{#1\if@tempswa, #2\fi}]}}
\@ifundefined{cite }{%
  \expandafter\let\csname cite \endcsname\cite
  \edef\cite{\@nx\protect\@xp\@nx\csname cite \endcsname}%
}{}
\def\fullwidthdisplay{\displayindent\z@ \displaywidth\columnwidth}
\edef\@tempa{\noexpand\fullwidthdisplay\the\everydisplay}
\everydisplay\expandafter{\@tempa}
\newcommand\seename{see also}%
\newcommand\see[2]{{\em \seename\/} #1}%
\newcommand\printindex{\@input{\jobname.ind}}%
\DeclareRobustCommand\textprime{\leavevmode
  \raise.8ex\hbox{\check@mathfonts\the\scriptfont2 \char48 }}

\newcommand{\theoremstyle}[1]{%
  \@ifundefined{th@#1}{%
    \PackageWarning{amsthm}{Unknown theoremstyle `#1'}%
    \thm@style{plain}%
  }{%
    \thm@style{#1}%
  }%
}
\newtoks\thm@style
\thm@style{plain}
\newtoks\thm@bodyfont  \thm@bodyfont{\itshape}
\newtoks\thm@headfont  \thm@headfont{\bfseries}
\newtoks\thm@notefont  \thm@notefont{}
\newtoks\thm@headpunct \thm@headpunct{.}
\newskip\thm@preskip \newskip\thm@postskip
\def\thm@space@setup{%
  \thm@preskip=.5\baselineskip\@plus.2\baselineskip
                             \@minus.2\baselineskip
  \thm@postskip=\thm@preskip
}
\renewcommand{\newtheorem}{\@ifstar{\@xnthm *}{\@xnthm \relax}}
\def\@xnthm#1#2{%
  \let\@tempa\relax
  \@xp\@ifdefinable\csname #2\endcsname{%
    \global\@xp\let\csname end#2\endcsname\@endtheorem
    \ifx *#1% unnumbered, need to get one more mandatory arg
      \edef\@tempa##1{%
        \gdef\@xp\@nx\csname#2\endcsname{%
          \@nx\@thm{\@xp\@nx\csname th@\the\thm@style\endcsname}%
            {}{##1}}}%
    \else % numbered theorem, need to check for optional arg
      \def\@tempa{\@oparg{\@ynthm{#2}}[]}%
    \fi
  }%
  \@tempa
}
\def\@ynthm#1[#2]#3{%
  \ifx\relax#2\relax
    \def\@tempa{\@oparg{\@xthm{#1}{#3}}[]}%
  \else
    \@ifundefined{c@#2}{%
      \def\@tempa{\@nocounterr{#2}}%
    }{%
      \@xp\xdef\csname the#1\endcsname{\@xp\@nx\csname the#2\endcsname}%
      \toks@{#3}%
      \@xp\xdef\csname#1\endcsname{%
        \@nx\@thm{%
          \let\@nx\thm@swap
            \if S\thm@swap\@nx\@firstoftwo\else\@nx\@gobble\fi
          \@xp\@nx\csname th@\the\thm@style\endcsname}%
            {#2}{\the\toks@}}%
      \let\@tempa\relax
    }%
  \fi
  \@tempa
}
\def\@xthm#1#2[#3]{%
  \ifx\relax#3\relax
    \newcounter{#1}%
  \else
    \newcounter{#1}[#3]%
    \@xp\xdef\csname the#1\endcsname{\@xp\@nx\csname the#3\endcsname
      \@thmcountersep\@thmcounter{#1}}%
  \fi
  \toks@{#2}%
  \@xp\xdef\csname#1\endcsname{%
    \@nx\@thm{%
      \let\@nx\thm@swap
        \if S\thm@swap\@nx\@firstoftwo\else\@nx\@gobble\fi
      \@xp\@nx\csname th@\the\thm@style\endcsname}%
      {#1}{\the\toks@}}%
}
\def\@thm#1#2#3{%
  \ifhmode\unskip\unskip\par\fi
  \normalfont
  \trivlist
  \let\thmheadnl\relax
  \let\thm@swap\@gobble
%%%%
  \let\thm@indent\indent         % no indent changed to indent
%%%%
  \thm@headfont{\normalsize\bfseries}% heading font bold
  \thm@notefont{\fontseries\mddefault\upshape}%
  \thm@headpunct{.}% add period after heading
  \thm@headsep 5\p@ plus\p@ minus\p@\relax
  \thm@space@setup
  #1% style overrides
  \@topsep \thm@preskip               % used by thm head
  \@topsepadd \thm@postskip           % used by \@endparenv
  \def\@tempa{#2}\ifx\@empty\@tempa
    \def\@tempa{\@oparg{\@begintheorem{#3}{}}[]}%
  \else
    \refstepcounter{#2}%
    \def\@tempa{\@oparg{\@begintheorem{#3}{\csname the#2\endcsname}}[]}%
  \fi
  \@tempa
}
\def\@restorelabelsep{\relax}
\let\@ythm\relax
\let\thmname\@iden \let\thmnote\@iden \let\thmnumber\@iden
\providecommand\@upn{\textup}
\def\thmhead@plain#1#2#3{%
  \thmname{#1}\thmnumber{\@ifnotempty{#1}{}
  %%%%
  %\@upn
  %%%%
  {#2}}%
  \thmnote{ {\the\thm@notefont(#3)}}}
%    \thmnote{ {\the\thm@headfont(#3)}}}
\let\thmhead\thmhead@plain
\def\swappedhead#1#2#3{%
  \thmnumber{\@upn{\@secnumfont#2}}%
  \thmname{\@ifnotempty{#2}{.\space}#1}%
  \thmnote{{\the\thm@notefont(#3)}}}
%    \thmnote{{\the\thm@headfont(#3)}}}
\let\thmheadnl\relax
\let\thm@indent\noindent
\let\thm@swap\@gobble
\def\@begintheorem#1#2[#3]{%
  \deferred@thm@head{\the\thm@headfont \thm@indent
    \@ifempty{#1}{\let\thmname\@gobble}{\let\thmname\@iden}%
    \@ifempty{#2}{\let\thmnumber\@gobble}{\let\thmnumber\@iden}%
    \@ifempty{#3}{\let\thmnote\@gobble}{\let\thmnote\@iden}%
    \thm@swap\swappedhead\thmhead{#1}{#2}{#3}%
    \the\thm@headpunct
    \thmheadnl % possibly a newline.
    \hskip\thm@headsep
  }%
  \ignorespaces}
\newskip\thm@headsep
\thm@headsep=5pt plus1pt minus1pt\relax
\let\adjust@parskip@nobreak=\@nbitem
\newtoks\dth@everypar
\dth@everypar={%
  \@minipagefalse \global\@newlistfalse
  \if@inlabel
    \global\@inlabelfalse
    \begingroup \setbox\z@\lastbox
     \ifvoid\z@ \kern-\itemindent \fi
    \endgroup
    \unhbox\@labels
  \fi
  \if@nobreak \@nobreakfalse \clubpenalty\@M
  \else \clubpenalty\@clubpenalty \everypar{}%
  \fi
}%
\def\deferred@thm@head#1{%
  \if@inlabel \indent \par \fi % eject a section head if one is pending
  \if@nobreak
    \adjust@parskip@nobreak
  \else
    \addpenalty\@beginparpenalty
    \addvspace\@topsep
    \addvspace{-\parskip}%
  \fi

  \global\@inlabeltrue
  \everypar\dth@everypar
  \sbox\@labels{\normalfont#1}%
  \ignorespaces
}
\def\nonslanted{\relax
  \@xp\let\@xp\@tempa\csname\f@shape shape\endcsname
  \ifx\@tempa\itshape\upshape
  \else\ifx\@tempa\slshape\upshape
  \fi\fi}
\def\swapnumbers{\edef\thm@swap{\if S\thm@swap N\else S\fi}}
\def\thm@swap{N}%
\let\@opargbegintheorem\relax
\def\th@plain{%
%%  \let\thm@indent\noindent % no indent
%%  \thm@headfont{\bfseries}% heading font is bold
%%  \thm@notefont{}% same as heading font
%%  \thm@headpunct{.}% add period after heading
%%  \let\thm@swap\@gobble
%%  \thm@preskip\topsep
%%  \thm@postskip\theorempreskipamount
%%%%
%  \itshape % body font
%%%%
  % \let\thm@indent\indent
%%%
  \slshape % body font
}
\def\th@definition{%
  \thm@headfont{\normalsize\itshape}%
  \normalfont % body font
}
\def\th@remark{%
  \thm@headfont{\normalsize\itshape}%
  \normalfont % body font
}
\def\@endtheorem{\endtrivlist\@endpefalse }
\newcommand{\newtheoremstyle}[9]{%
  \@ifempty{#5}{\dimen@\z@skip}{\dimen@#5\relax}%
  \ifdim\dimen@=\z@
    \toks@{#4\let\thm@indent\noindent}%
  \else
    \toks@{#4\def\thm@indent{\noindent\hbox to#5{}}}%
  \fi
  \def\@tempa{#8}\ifx\space\@tempa
    \toks@\@xp{\the\toks@ \labelsep\fontdimen\tw@\font\relax}%
  \else
    \def\@tempb{\newline}%
    \ifx\@tempb\@tempa
      \toks@\@xp{\the\toks@ \labelsep\z@skip
        \def\thmheadnl{\newline}}%
    \else
      \toks@\@xp{\the\toks@ \labelsep#8\relax}%
    \fi
  \fi
  \begingroup
  \thm@space@setup
  \@defaultunits\@tempskipa#2\thm@preskip\relax\@nnil
  \@defaultunits\@tempskipb#3\thm@postskip\relax\@nnil
  \xdef\@gtempa{\thm@preskip\the\@tempskipa
    \thm@postskip\the\@tempskipb\relax}%
  \endgroup
  \@temptokena\@xp{\@gtempa
    \thm@headfont{#6}\thm@headpunct{#7}%
  }%
  \@ifempty{#9}{%
    \let\thmhead\thmhead@plain
  }{%
    \@namedef{thmhead@#1}##1##2##3{#9}%
    \@temptokena\@xp{\the\@temptokena
      \@xp\let\@xp\thmhead\csname thmhead@#1\endcsname}%

  }%
  \@xp\xdef\csname th@#1\endcsname{\the\toks@ \the\@temptokena}%
}
\DeclareRobustCommand{\qed}{%
  \ifmmode \mathqed
  \else
    \leavevmode\unskip\penalty9999 \hbox{}\nobreak\hfill
    \quad\hbox{\qedsymbol}%
  \fi
}
\let\QED@stack\@empty
\let\qed@elt\relax
\newcommand{\pushQED}[1]{%
  \toks@{\qed@elt{#1}}\@temptokena\expandafter{\QED@stack}%
  \xdef\QED@stack{\the\toks@\the\@temptokena}%
}
\newcommand{\popQED}{%
  \begingroup\let\qed@elt\popQED@elt \QED@stack\relax\relax\endgroup
}
\def\popQED@elt#1#2\relax{#1\gdef\QED@stack{#2}}
\newcommand{\qedhere}{%
  \begingroup \let\mathqed\math@qedhere
    \let\qed@elt\setQED@elt \QED@stack\relax\relax \endgroup
}
\newif\ifmeasuring@
\newif\iffirstchoice@ \firstchoice@true
\def\setQED@elt#1#2\relax{%
  \ifmeasuring@
  \else \iffirstchoice@ \gdef\QED@stack{\qed@elt{}#2}\fi
  \fi
  #1%
}
\def\qed@warning{%
  \PackageWarning{amsthm}{The \@nx\qedhere command may not work
    correctly here}%
}
\newcommand{\mathqed}{\quad\hbox{\qedsymbol}}
\def\linebox@qed{\hfil\hbox{\qedsymbol}\hfilneg}
\@ifpackageloaded{amsmath}{%
  \def\math@qedhere{%
    \@ifundefined{\@currenvir @qed}{%
      \qed@warning\quad\hbox{\qedsymbol}%
    }{%
      \@xp\aftergroup\csname\@currenvir @qed\endcsname
    }%
  }
  \def\displaymath@qed{%
    \relax
    \ifmmode
      \ifinner \aftergroup\linebox@qed
      \else
        \eqno
        \let\eqno\relax \let\leqno\relax \let\veqno\relax
        \hbox{\qedsymbol}%
      \fi
    \else
       \aftergroup\linebox@qed
    \fi
  }
  \@xp\let\csname equation*@qed\endcsname\displaymath@qed
  \def\equation@qed{%
    \iftagsleft@
      \hbox{\phantom{\quad\qedsymbol}}%
      \gdef\alt@tag{%
        \rlap{\hbox to\displaywidth{\hfil\qedsymbol}}%
        \global\let\alt@tag\@empty
      }%
    \else
      \gdef\alt@tag{%
        \global\let\alt@tag\@empty
        \vtop{\ialign{\hfil####\cr
                \tagform@\theequation\cr
                \qedsymbol\cr}}%

        \setbox\z@
      }%
    \fi
  }
  \def\qed@tag{%
    \global\tag@true \nonumber
    &\omit\setboxz@h {\strut@ \qedsymbol}\tagsleft@false
    \place@tag@gather
    \kern-\tabskip
    \ifst@rred \else \global\@eqnswtrue \fi \global\advance\row@\@ne \cr
  }
  \def\split@qed{%
    \def\endsplit{\crcr\egroup \egroup \ctagsplit@false \rendsplit@
      \aftergroup\align@qed
    }%
  }
  \def\align@qed{%
    \ifmeasuring@ \tag*{\qedsymbol}%
    \else \let\math@cr@@@\qed@tag
    \fi
  }
  \@xp\let\csname align*@qed\endcsname\align@qed
  \@xp\let\csname gather*@qed\endcsname\align@qed
%% Needs some patching up for amsmath 1.2
}{% end of amsmath branch, start plain LaTeX branch
  \def\math@qedhere{%
    \@ifundefined{\@currenvir @qed}{%
      \qed@warning \aftergroup\displaymath@qed
    }{%
      \@xp\aftergroup\csname\@currenvir @qed\endcsname
    }%
  }
  \def\displaymath@qed{%
    \relax
    \ifmmode
      \ifinner \aftergroup\aftergroup\aftergroup\linebox@qed
      \else
        \eqno \def\@badmath{$$}%
        \let\eqno\relax \let\leqno\relax \let\veqno\relax
        \hbox{\qedsymbol}%
      \fi
    \else
       \aftergroup\linebox@qed
    \fi
  }
  \@ifundefined{ver@leqno.clo}{%
    \def\equation@qed{\displaymath@qed \quad}%
  }{%
    \def\equation@qed{\displaymath@qed}%
  }
  \def\@tempa#1$#2#3\@nil{%
    \def\[{#1$#2\def\@currenvir{displaymath}#3}%
  }%
  \expandafter\@tempa\[\@nil
}
\@ifpackageloaded{amstex}{%
  \def\@tempa{TT}%
}{%
  \@ifpackageloaded{amsmath}{%
    \def\@tempb#1 v#2.#3\@nil{#2}%
    \ifnum\@xp\@xp\@xp\@tempb\csname ver@amsmath.sty\endcsname v0.0\@nil
       <\tw@
      \def\@tempa{TT}%
    \else
      \def\@tempa{TF}%
    \fi
  }{%
    \def\@tempa{TF}
  }%
}
\if\@tempa
  \renewcommand{\math@qedhere}{\quad\hbox{\qedsymbol}}%
\fi
\newcommand{\openbox}{\leavevmode
  \hbox to.77778em{%
  \hfil\vrule
  \vbox to.675em{\hrule width.6em\vfil\hrule}%
  \vrule\hfil}}
\DeclareRobustCommand{\textsquare}{%
  \begingroup \usefont{U}{msa}{m}{n}\thr@@\endgroup
}
\@ifclasswith{\@classname}{noamsfonts}{%
  \providecommand{\qedsymbol}{\openbox}%
}{}%
\providecommand{\qedsymbol}{\textsquare}%
\newenvironment{proof}[1][\textsc{\proofname}]{\par
  \pushQED{\qed}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\labelsep
        %%%% \itshape
        \indent
        \scshape
    #1\@addpunct{.}]\ignorespaces
}{%
  \popQED\endtrivlist\@endpefalse
}
%%%%
%%%%
% \newenvironment{dproof}[1][\textsc{\proofname}]{\par
%    % \pushQED{\qed}%
%  \normalfont \topsep6\p@\@plus6\p@\relax
%  \trivlist
%  \item[\hskip\labelsep
%        \indent
%        \scshape
%    #1\@addpunct{.}]\ignorespaces
% }{%
%  % \popQED
%  \endtrivlist\@endpefalse
% }
%%%%
%%%%
\newcommand{\proofname}{Proof}
\hyphenation{acad-e-my acad-e-mies af-ter-thought anom-aly anom-alies
an-ti-deriv-a-tive an-tin-o-my an-tin-o-mies apoth-e-o-ses
apoth-e-o-sis ap-pen-dix ar-che-typ-al as-sign-a-ble as-sist-ant-ship
as-ymp-tot-ic asyn-chro-nous at-trib-uted at-trib-ut-able bank-rupt
bank-rupt-cy bi-dif-fer-en-tial blue-print busier busiest
cat-a-stroph-ic cat-a-stroph-i-cally con-gress cross-hatched data-base
de-fin-i-tive de-riv-a-tive dis-trib-ute dri-ver dri-vers eco-nom-ics
econ-o-mist elit-ist equi-vari-ant ex-quis-ite ex-tra-or-di-nary
flow-chart for-mi-da-ble forth-right friv-o-lous ge-o-des-ic
ge-o-det-ic geo-met-ric griev-ance griev-ous griev-ous-ly
hexa-dec-i-mal ho-lo-no-my ho-mo-thetic ideals idio-syn-crasy
in-fin-ite-ly in-fin-i-tes-i-mal ir-rev-o-ca-ble key-stroke
lam-en-ta-ble light-weight mal-a-prop-ism man-u-script mar-gin-al
meta-bol-ic me-tab-o-lism meta-lan-guage me-trop-o-lis
met-ro-pol-i-tan mi-nut-est mol-e-cule mono-chrome mono-pole
mo-nop-oly mono-spline mo-not-o-nous mul-ti-fac-eted mul-ti-plic-able
non-euclid-ean non-iso-mor-phic non-smooth par-a-digm par-a-bol-ic
pa-rab-o-loid pa-ram-e-trize para-mount pen-ta-gon phe-nom-e-non
post-script pre-am-ble pro-ce-dur-al pro-hib-i-tive pro-hib-i-tive-ly
pseu-do-dif-fer-en-tial pseu-do-fi-nite pseu-do-nym qua-drat-ic
quad-ra-ture qua-si-smooth qua-si-sta-tion-ary qua-si-tri-an-gu-lar
quin-tes-sence quin-tes-sen-tial re-arrange-ment rec-tan-gle
ret-ri-bu-tion retro-fit retro-fit-ted right-eous right-eous-ness
ro-bot ro-bot-ics sched-ul-ing se-mes-ter semi-def-i-nite
semi-ho-mo-thet-ic set-up se-vere-ly side-step sov-er-eign spe-cious
spher-oid spher-oid-al star-tling star-tling-ly sta-tis-tics
sto-chas-tic straight-est strange-ness strat-a-gem strong-hold
sum-ma-ble symp-to-matic syn-chro-nous topo-graph-i-cal tra-vers-a-ble
tra-ver-sal tra-ver-sals treach-ery turn-around un-at-tached
un-err-ing-ly white-space wide-spread wing-spread wretch-ed
wretch-ed-ly Eng-lish Euler-ian Feb-ru-ary Gauss-ian
Hamil-ton-ian Her-mit-ian Jan-u-ary Japan-ese Kor-te-weg
Le-gendre Mar-kov-ian Noe-ther-ian No-vem-ber Rie-mann-ian Sep-tem-ber}
\def\calclayout{\advance\textheight -\headheight
  \advance\textheight -\headsep
  \oddsidemargin\paperwidth
  \advance\oddsidemargin -\textwidth
  \divide\oddsidemargin\tw@
  \ifdim\oddsidemargin<.5truein \oddsidemargin.5truein \fi
  \advance\oddsidemargin -1truein
  \evensidemargin\oddsidemargin
  \topmargin\paperheight \advance\topmargin -\textheight
  \advance\topmargin -\headheight \advance\topmargin -\headsep
  \divide\topmargin\tw@
  \ifdim\topmargin<.5truein \topmargin.5truein \fi
  \advance\topmargin -1truein\relax
}
\InputIfFileExists{amsart.cfg}{}
{%
  \calclayout % initialize
  \pagenumbering{arabic}%
  \pagestyle{headings}%
  \thispagestyle{plain}%
}
\def\lepeget{\vspace*{26pt}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%        Bibliography
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\es{{\rm and }}
\let\refsize\footnotesize
\catcode`\@=11
\newbox\nobox@            \newbox\keybox@           \newbox\bybox@
\newbox\paperbox@         \newbox\paperinfobox@     \newbox\jourrbox@
\newbox\volbox@           \newbox\issuebox@         \newbox\yrbox@
\newbox\pagesbox@         \newbox\bookkbox@          \newbox\bookinfobox@
\newbox\publbox@          \newbox\publaddrbox@      \newbox\finalinfobox@
\newbox\edsbox@           \newbox\langbox@          \newbox\edbox@
\newbox\toappearinbox@    \newbox\inbookbox@        \newbox\wwwbox@
\newbox\guidebox@         \newbox\etc@box@
\newif\iffirstref@        \newif\iflastref@
\newif\ifprevjour@        \newif\ifbook@            \newif\ifprevinbook@
\newif\ifquotes@          \newif\ifbookquotes@      \newif\ifpaperquotes@
\firstref@true
\def\eat@#1{}
\newif\iftemp@
\def\refkern@{\kern3sp}
\def\emptyifempty@{\dimen@\wd\currbox@
  \advance\dimen@-\wd\z@ \advance\dimen@-.1\p@
  \ifdim\dimen@<\z@ \setbox\currbox@\copy\voidb@x \fi}
\def\notempty#1{TT\fi\def\test@{#1}\ifx\test@\empty\temp@false
  \else\temp@true\fi \iftemp@}
\def\setboxz@h{\setbox\z@\hbox}
\def\endrefitem@{\unskip\refkern@\egroup
  \setboxz@h{\refkern@}\emptyifempty@}\ignorespaces
\def\refdef@#1#2#3{%
  \iffirstref@ \edef\next@{\leavevmode
   \let\noexpand\currbox@\csname\expandafter\eat@\string#1box@\endcsname
   \noexpand\setbox\noexpand\currbox@\hbox\bgroup}%
   \firstref@false  %%% ez itt nem jo!
  \else
   \edef\next@{\leavevmode \noexpand\endrefitem@
   \let\noexpand\currbox@\csname\expandafter\eat@\string#1box@\endcsname
    \noexpand\setbox\noexpand\currbox@\hbox\bgroup}%
  \fi
  \toks@\expandafter{\next@}%
  \if\notempty{#2#3}\toks@\expandafter{\the\toks@
  \gdef\endrefitem@{\unskip#3\refkern@\egroup
  \setboxz@h{#2#3\refkern@}\emptyifempty@}#2}\fi
  \toks@\expandafter{\the\toks@\ignorespaces}%
  \edef#1{\the\toks@}}
\refdef@\by{\sc}{}
\def\handbook{\by\rm}
%\def\guide{\global\firstref@true\refdef@\guidee{}{}}
\refdef@\paper{\unskip, }{}
\refdef@\paperinfo{\unskip, }{}
\refdef@\vol{\ifprevjour@\unskip\bf\else\unskip, Vol.{}\fi\space}{}
\refdef@\issue{\unskip, no.\ }{}
\refdef@\yr{\unskip\ifprevjour@\  (\else, \fi}{\ifprevjour@)\fi}
\refdef@\pages{\unskip, }{}
\let\bookfam@\rm
\def\book{\endrefitem@
 \let\currbox@\bookkbox@
 \setbox\currbox@\hbox\bgroup\unskip,
 \def\endrefitem@{\unskip\refkern@\egroup
  \setboxz@h{\ifbookquotes@\fi}\emptyifempty@
  \ifvoid\bookkbox@\else\book@true \prevjour@false\fi}%
  \ifbookquotes@\fi\bookfam@\ignorespaces}
\def\inbook{\endrefitem@ \let\currbox@\inbookbox@
 \setbox\currbox@\hbox\bgroup\unskip, \rm in:\
 \def\endrefitem@{\unskip\refkern@\egroup
  \setboxz@h{\ifbookquotes@\fi}\emptyifempty@
  \ifvoid\inbookbox@\else\book@true \prevjour@false\fi}%
  \ifbookquotes@\fi\bookfam@\ignorespaces}
\def\jour{\endrefitem@ \book@false \let\currbox@\jourrbox@
  \setbox\currbox@\hbox\bgroup\unskip, \it
  \def\endrefitem@{\unskip\refkern@\egroup
    \setboxz@h{\refkern@}\emptyifempty@
    \ifvoid\jourrbox@\else\prevjour@true\fi}\ignorespaces}
\def\guide{\iffirstref@ \def\pre@punct{\bookfam@}
 \else\endrefitem@\def\pre@punct{\unskip, \bookfam@}\fi
 \let\currbox@\bookkbox@
 \setbox\currbox@\hbox\bgroup\pre@punct
 \def\endrefitem@{\unskip\refkern@\egroup
  \setboxz@h{\ifbookquotes@\fi}\emptyifempty@
  \ifvoid\bookkbox@\else\book@true \prevjour@false\fi}%
  \ifbookquotes@\fi\bookfam@\ignorespaces}
\refdef@\eds{\unskip, (}{\unskip, eds.)}
\refdef@\ed{\unskip, (}{\unskip, ed.)}
\refdef@\bookinfo{\unskip, }{}
\refdef@\publ{\unskip, \it}{}
\refdef@\publaddr{\unskip, \it}{}
\refdef@\finalinfo{\unskip, \rm}{}
\refdef@\etc@{\unskip\ \rm}{}
\refdef@\lang{\unskip\ (in \it}{\/\rm)}
\refdef@\www{\unskip, \scriptsize\tt}{}
\def\toappear{\etc@({\it to appear\/})}
\def\inprint{\etc@({\it in print\/})}
%\def\submitted{\etc@({\it submitted\/})}
\refdef@\toappearin{\global\prevjour@true
\unskip\ ({\it to appear in\/} }{)}

\let\bibitem@\bibitem
\def\bib{\begingroup\bgroup\bibitem@}

\def\endbib{\endrefitem@%\egroup%
            \ifvoid\jourrbox@ \else\prevjour@true\fi
            \ifvoid\bookkbox@ \ifvoid\inbookbox@ \else\book@true\fi
               \else\book@true\fi
            \ifvoid\bybox@    \else\unhbox\bybox@\fi
            \ifvoid\guidebox@    \else\unhbox\guidebox@\fi
            \ifvoid\paperbox@ \else\unhbox\paperbox@\fi
            \ifvoid\paperinfobox@\else\unhbox\paperinfobox@\fi
            \ifvoid\bookkbox@ \else \unhbox\bookkbox@\fi
            \ifvoid\inbookbox@ \else \unhbox\inbookbox@\fi
            \ifvoid\jourrbox@ \else \unhbox\jourrbox@\fi
            \ifvoid\volbox@   \else\ifbook@\else\bf\fi\unhbox\volbox@\rm\fi
            \ifvoid\issuebox@ \else\unhbox \issuebox@\fi
            \ifvoid\bookinfobox@ \else\unhbox\bookinfobox@\fi
            \ifvoid\edbox@    \else\unhbox\edbox@\fi
            \ifvoid\edsbox@   \else\unhbox\edsbox@\fi
            \ifvoid\publbox@  \else\unhbox\publbox@\fi
            \ifvoid\publaddrbox@\else\unhbox\publaddrbox@\fi
            \ifvoid\yrbox@   \else\unhbox\yrbox@\fi
            \ifvoid\pagesbox@ \else\unhbox\pagesbox@\fi
            \ifvoid\finalinfobox@\else\unhbox\finalinfobox@\fi
            \ifvoid\toappearinbox@\else\unhbox\toappearinbox@\fi
            \ifvoid\langbox@\else\unhbox\langbox@\fi
            \ifvoid\etc@box@\else\unhbox\etc@box@\fi
            \ifvoid\wwwbox@\else\unhbox\wwwbox@\fi\egroup\unskip.
            \endgroup\firstref@true \book@false \prevjour@false}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{proof*}[1][\textsc{\proofname}]{\par
  \pushQED{}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\labelsep
        %%%% \itshape
        \indent
        \scshape
    #1\@addpunct{.}]\ignorespaces
}{%
  \popQED\endtrivlist\@endpefalse
}

%%%%%%% iitemize
\newenvironment{iitemize}[1][0.5]{%
\begin{list}{}
{\leftmargin=\parindent
\advance\leftmargin by #1\parindent
\listparindent=0pt
}}{\end{list}}
%%%%%%% e-iitemize

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\let\@newpf\proof %\let\proof\relax \let\endproof\relax
\newenvironment{pf}{\@newpf[\proofname]}{\popQED\endtrivlist}
\newenvironment{pf*}[1]{\@newpf[#1]}{\popQED\endtrivlist}
\let\bdss\belowdisplayshortskip
\def\bdsst{\belowdisplayshortskip=10pt}

\newwrite\oldalkiir
\def\oldkiir{\immediate\openout\oldalkiir \jobname.pag%
\immediate\write\oldalkiir{\string\pagespan{\the\ooseged}{\end@page}}%
\immediate\closeout\oldalkiir}

\if@compatibility \else\endinput\fi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\tiny{\Tiny}
\def\defaultfont{\normalfont}
\def\rom{\textup}
\let\@newpf\proof %\let\proof\relax \let\endproof\relax
\newenvironment{pf}{\@newpf[\proofname]}{\popQED\endtrivlist}
\newenvironment{pf*}[1]{\@newpf[#1]}{\popQED\endtrivlist}

%%% stb

\endinput
%%
%% End of file `publmathd.cls'.

%% 03.10.03. 
%%   \uppercase --> \varuppercase, javítva
%%   \ref, \pageref: \upshape torolve.
%%   \bdss, \bdsst 

%% 04/11/04
%%  oldal.tex alkalmazasa eseten a \pagespan kiirasa
%%      a \jobname.pag fajlba

%% 04/12/21
%%	elso oldal jav.: logo igazitasa (\vbox --> \vtop)
%% 05/07/11
%%  \boldmath{@\title} -- a címben él a \boldmath
%% 05/11/12
%%  \belowdisplayshorskip javitva
%%  \boldsectiontrue -- alapertelmezés
%%  \boldsectionfalse -- letiltja a \section-ben a \boldmath parancsot
%%  \NoDoubleHead -- hatására az utolsó _páros_ oldalon csak bal oldali
%%                   tartalom jelenik meg (felhasználva: \ifketoldalas)
%% 05/11/21
%%  \begin{proof*} -- \qed nelkuli proof kornyezet
%% 06/02/28
%%  \begin{iitemize} -- számozás nélküli lista,
%%      Bal margója 0.5\parindent-tel nagyobb az itemize környezetének.
%%      Nagyítása, pl. \begin{iitemize}[1]: 1\parindent-tel nagyobb, mint az itemize.
%% 06/03/09
%%  \section javítva
%%  \pvol{1} megadása esetén az elsõ oldalon a Proof sheets... felirat jelenik meg.
%%  \pvol{2} megadása esetén az elsõ oldalon a \receivedinfo-ban megadottak jelennek meg.
