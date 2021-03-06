%%
%% This is file `prettyref.sty',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% prettyref.dtx  (with options: `style')
%% 
%% Copyright (c) 1995 Kevin Ruland
%% 
%%
%% prettyref v3.0
%%
%% Copyright 1995,1998.  by Kevin Ruland kevin@rodin.wustl.edu
%%
%\ProvidesPackage{mathenv}[1998/07/09 v3.0]
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{mathbook}[my own class]

%%%%%%%%%%%%%%%%%%%
% PACKAGE OPTIONS %
%%%%%%%%%%%%%%%%%%%

\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagetrue
\newif\if@openright
\newif\if@mainmatter \@mainmattertrue
\if@compatibility\else
\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}}
\DeclareOption{a5paper}
   {\setlength\paperheight {210mm}%
    \setlength\paperwidth  {148mm}}
\DeclareOption{b5paper}
   {\setlength\paperheight {250mm}%
    \setlength\paperwidth  {176mm}}
\DeclareOption{letterpaper}
   {\setlength\paperheight {11in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{legalpaper}
   {\setlength\paperheight {14in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{executivepaper}
   {\setlength\paperheight {10.5in}%
    \setlength\paperwidth  {7.25in}}
\DeclareOption{landscape}
   {\setlength\@tempdima   {\paperheight}%
    \setlength\paperheight {\paperwidth}%
    \setlength\paperwidth  {\@tempdima}}
\fi
\if@compatibility
  \renewcommand\@ptsize{0}
\else
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\fi
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\if@compatibility\else
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\fi
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\if@compatibility\else
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\fi
\DeclareOption{titlepage}{\@titlepagetrue}
\if@compatibility\else
\DeclareOption{notitlepage}{\@titlepagefalse}
\fi
\if@compatibility
\@openrighttrue
\else
\DeclareOption{openright}{\@openrighttrue}
\DeclareOption{openany}{\@openrightfalse}
\fi
\if@compatibility\else
\DeclareOption{onecolumn}{\@twocolumnfalse}
\fi
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}%
}

%% declare options

% language options
% english (already set by default)
\DeclareOption{en}{
    \def\theoremname{Theorem}
    \def\remarkname{Remark}
    \def\remarkon{on}
    \def\proofname{Proof}
    \def\proofof{of}
    \def\lemmaname{Lemma}
    \def\corollaryname{Korollar}
    \def\corollaryof{of}
    \def\definitionname{Definition}
    \def\statementname{Statement}
    \def\equationname{Equation}
    \def\diagramname{Diagram}
    \def\chaptername{Chapter}
    \def\sectionname{Section}
    \def\tablename{Table}
    \def\figurename{Figure}
}

% german
\DeclareOption{de}{
    \def\theoremname{Satz}
    \def\remarkname{Bemerkung}
    \def\remarkon{zu}
    \def\proofname{Beweis}
    \def\proofof{von}
    \def\lemmaname{Lemma}
    \def\corollaryname{Korollar}
    \def\corollaryof{von}
    \def\definitionname{Definition}
    \def\statementname{Aussage}
    \def\equationname{Gleichung}
    \def\diagramname{Diagramm}
    \def\chaptername{Kapitel}
    \def\sectionname{Abschnitt}
    \def\tablename{Tabelle}
    \def\figurename{Abbildung}
}

%% declare default settings
\ExecuteOptions{en,letterpaper,10pt,twoside,onecolumn,final,openright}
% terminate optino processing
\ProcessOptions\relax

\RequirePackage{hyperref}
%%\RequirePackage{refcount}% to expand references
%%\RequirePackage{framed}
%%\RequirePackage{framed} problems with nath package
%%\RequirePackage{xstring,ifthen}
%\usepackage{hyperref}
\hypersetup{citebordercolor=[rgb]{0,1,0},
filebordercolor=[rgb]{0,.5,.5},
linkbordercolor=[rgb]{0,.5,.9},
menubordercolor=[rgb]{1,0,0}}

%%%%%%%%%%
% errors %
%%%%%%%%%%

%% general error command
\gdef\@error#1#2{%
   \GenericError{%
      \space\space\space\@spaces\@spaces\@spaces
   }{%
      JaTeX Error: #1%
   }{%
      See the JaTeX manual or source for explanation.%
   }{#2}%
}

%% whatever
\gdef\@eha{%
  Your command was ignored.\MessageBreak
  Type \space I <command> <return> \space to replace it %
  with another command,\MessageBreak
  or \space <return> \space to continue without it.}

%% error: no counter with current name
\gdef\@error@nocounter#1{%
    \@error{No counter '#1' defined}\@eha}

%%%%%%%%%%%%%%%%%%%
%%% main commands %
%%%%%%%%%%%%%%%%%%%

%%% define titlepage

%%% counters

%%% define a the new counter command with optional argument another counter resetting it
\def\newcounter#1{%
    \expandafter\@ifdefinable \csname counter@#1\endcsname
    {\@definecounter{#1}}%
    \@ifnextchar[{\withoptarg@newcounter{#1}}{}}

%% add to reset counter
\def\@addtoreset#1#2{\expandafter\@cons\csname cl@#2\endcsname {{#1}}}

\def\value#1{\csname c@#1\endcsname}
%% newcounter with optional argument
\def\withoptarg@newcounter#1[#2]{%
  \@ifundefined{counter@#2}{\@error@nocounter{#2}}{\@addtoreset{#1}{#2}}}



%%% define section, subsection, paragraph and subparagraph appearance


\setcounter{secnumdepth}{2}
\newcounter {part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter{subparagraph}[paragraph]
\def\thepart{\@Roman\counter@part}
\def\thechapter{\@arabic\counter@chapter}
\def\thesection{\thechapter.\@arabic\counter@section}
\def\thesubsection{\thesection.\@arabic\counter@subsection}
\def\thesubsubsection{\thesubsection.\@arabic\counter@subsubsection}
\def\theparagraph{\thesubsubsection.\@arabic\counter@paragraph}
\def\thesubparagraph{\theparagraph.\@arabic\counter@subparagraph}


%%%%%%%%%%%%%%%%%%%%%%%%
%%% math environment %%%
%%%%%%%%%%%%%%%%%%%%%%%%

\def\newmathenvironment#1#2[#3]{
    \newcounter{#1}[#3]
    % name
    \global\@namedef{#1name}{#2}% setup name of environment to show up
    % vertical space
    \global\@namedef{#1preskip}{\topsep}
    \global\@namedef{#1postskip}{\topsep}
    % header
    \global\@namedef{#1headerfont}{\bfseries}
    \global\@namedef{#1headerseparator}{.\space}
    \global\@namedef{#1headertext}##1{\csname #1name\endcsname\space\csname the#1\endcsname\ifx##1\empty\else\space(##1)\fi}
    \global\@namedef{#1header}##1{\noindent\begingroup\csname #1headerfont\endcsname\csname #1headertext\endcsname{##1}\csname #1headerseparator\endcsname\endgroup}
    % counter format
    \global\@namedef{the#1}{\arabic{#3}.\arabic{#1}}%
    % note
    \global\@namedef{#1notefont}{}%
    \global\@namedef{#1note}##1{(##1)}%
    % body
    \global\@namedef{#1bodyfont}{}%\itshape}%
    % references stuff
    \global\@namedef{#1labelabbrev}{#1}%
    % set reference commands (default: set labelkind and labeltitle)
    \global\@namedef{#1refcommands}##1{\refstepcounter{#1}\def\@currentlabel{\csname #1name\endcsname\space\csname the#1\endcsname}\def\@currentlabelname{\csname #1headertext\endcsname{##1}}}%
    % commands to hold for the body
    \global\@namedef{#1bodycommands}{}
    % symbol at the end of environment
    \global\@namedef{#1endmark}{}
    \newenvironment{#1}[1][]{\par\vspace{\csname #1preskip\endcsname}\csname #1refcommands\endcsname{##1}\csname #1header\endcsname{##1}\begingroup\csname #1bodyfont\endcsname\csname #1bodycommands\endcsname}{\hfill\csname #1endmark\endcsname\vspace{\csname #1postskip\endcsname}\endgroup\par}
}

%%%%%%%%%%%%%%%%%%%%%%% 
% theorem environment %
%%%%%%%%%%%%%%%%%%%%%%%

\newmathenvironment{theorem}{Theorem}[section]

%%%%%%%%%%%%%%%%%%%%%%
% remark environment %
%%%%%%%%%%%%%%%%%%%%%%

\newmathenvironment{remark}{Remark}[theorem]
\def\theremark{\arabic{remark}}
\def\remarkheadertext#1{\remarkname\space\theremark\ifx#1\empty\else\space\remarkon\space#1\fi}

%%%%%%%%%%%%%%%%%%%%%
% proof environment %
%%%%%%%%%%%%%%%%%%%%%

\newmathenvironment{proof}{Proof}[section]
\def\proofheaderfont{\itshape}%
\def\proofof{of}
\def\proofheadertext#1{\proofname\ifx#1\empty\else{\space\proofof\space#1}\fi}
\def\proofendmark{$\square$}
\def\proofbodyfont{}
\def\proofbodycommands{\def\paragraph{\@startsection{paragraph}{4}{\z@}
    {.5ex plus .05ex minus .025ex}{-.66em}{\normalsize\itshape}}%
\def\subparagraph{\@startsection{subparagraph}{5}{\z@}
    {.25ex plus .01ex minus .005ex}{-.66em}{\normalsize\itshape}}%
}

%\def\paragraph##1{\item[\hskip\labelsep\proofheaderfont ##1]}\def\subparagraph##1{\paragraph##1}}
    
%%%%%%%%%%%%%%%%%%%%%%%%%%
% definition environment %
%%%%%%%%%%%%%%%%%%%%%%%%%%

\newmathenvironment{definition}{Definition}[section]

%%%%%%%%%%%%%%%%%%%%%
% lemma environment %
%%%%%%%%%%%%%%%%%%%%%

\newmathenvironment{lemma}{Lemma}[section]

%%%%%%%%%%%%%%%%%%%%%%%%%
% corollary environment %
%%%%%%%%%%%%%%%%%%%%%%%%%

\newmathenvironment{corollary}{Corollary}[theorem]
\def\thecorollary{\arabic{corollary}}

\newmathenvironment{exercise}{Exercise}[section]

\newmathenvironment{solution}{Solution}[section]
\def\solutionof{of}
\def\solutionheaderfont{\proofheaderfont}
\def\solutionheadertext#1{\solutionname\ifx#1\empty\else\space\solutionof\space#1\fi}
\def\solutionbodyfont{\proofbodyfont}
\def\solutionbodycommands{\proofbodycommands}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% conjecture environment %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newmathenvironment{conjecture}{Conjecture}[section]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%% enumerate style in mathenvs %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

% with roman numerals
\def\@statementsenumstyle{\def\theenumi{(\Roman{enumi})}\def\theenumii{(\roman{enumii})}\def\labelenumi{\theenumi}\def\labelenumii{\theenumii}}

% with a single letter to denote the axioms
\def\@axiomsenumstyle#1{\def\theenumi{(#1.\Roman{enumi})}\def\theenumii{(#1.\roman{enumii})}\def\labelenumi{\theenumi}\def\labelenumii{\theenumii}}

% varied item definition
% todo
\def\@renewitem{\let\@olditem\item{\def\item[##1]{\@olditem\gdef\@currentlabelname{##1}}}}

\newenvironment{statements}{\@statementsenumstyle\begin{enumerate}}{\end{enumerate}}

% implications in proofs
%
% todo: referencing \gdef\@currentlabel{\ref*{##1}}}

\newenvironment{implications}{\def\descriptionlabel##1{##1}%
\begin{description}}{\end{description}}

%%%%%%%%%%%%%%%%
%% references %%
%%%%%%%%%%%%%%%%

%amed@default@refformat[#1]#2{\hyperref[#2]{\ifmmode\textrm{\ref*{#2}}\else#1\space\ref*{#2}\if\vcenter\getrefbykeydefault{#2}{name}{}\vcenter\else{\space(\nameref*{#2})}\fi\fi}}
%\def\@unnamed@default@refformat#1{\hyperref[#1]{\ifmmode\textrm{\ref*{#1}}\else\ref*{#1}\fi}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% APPROPRIATE REFERENCES %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% reference formats
% autoref (e.g. section~1.5)
%\def\@autorefstarformat#1#2#3#4{#3\space#1}
% nameref (e.g. section~1.5 (title))
%\def\@autorefformat#1#2#3#4{#3\space#1\space(#4)}
% default (e.g. 1.5)
%\def\@refformat#1#2#3#4#5{#1}

%\def\@thirdoffour#1#2#3#4{#3}
%\def\@fourthoffour#1#2#3#4{#4}

%\AtBeginDocument{
%\def\@currentlabelunnamed{}
%\def\@currentlabelnamed{}
%    \def\label#1{\@bsphack
%        \protected@write\@auxout{}% give number, page, labelkind, name of referenced environment, title of environment
%        {\string\newlabel{#1}{{\@currentlabel}{\thepage}{\@currentlabelunnamed}{\@currentlabelnamed}}}%
%        \@esphack}
%    \DeclareRobustCommand\autoref{\@ifstar\newautorefstar\newautoref}
%    \def\newautorefstar#1{\expandafter\@setref\csname r@#1\endcsname\@thirdoffour{#1}}
%    \def\newautoref#1{\expandafter\@setref\csname r@#1\endcsname\@fourthoffour{#1}}
%}

%    \g@addto@macro{\paragraph}{\gdef\@currentlabelkind{paragraph}}

%% costum equation environments (see latex.ltx)
\def\equation{$$\refstepcounter{equation}}
\def\endequation{\eqno \hbox{\@eqnnum}$$\@ignoretrue}
\def\@eqnnum{{\normalfont \theequation}}
\def\theequation{(\arabic{equation})}


\AtBeginDocument{
%% redefine ref command
%  \@ifpackageloaded{hyperref}{%
%      \def\ref{\@ifstar\newrefstar\newref}%
%      \def\newrefstar#1{\expandafter\@setref\csname r@#1\endcsname\@refformat{#1}}%
%      \def\newref{\newrefstar}%\hyperref[#1]{\newrefstar{#1}}}%
%  }%
    \DeclareRobustCommand{\autoref}[1]{\expandafter\@setref\csname r@#1\endcsname\@thirdoffive{#1}}
    %\def\theequation{(\arabic{equation})}

%\let\old@label{\label}%
%\def\label#1{\ifmmode\hbox{\@eqnnum}\fi\old@label}
}
\endinput

%%% Local Variables: 
%%% mode: tex
%%% End: 