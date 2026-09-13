\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gfsa}[2026/09/01 Standard LaTeX gfsa class]

% --------------------------------------------------------------------------
% Class Options
% --------------------------------------------------------------------------

\newcommand\@ptsize{}

\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}

\ExecuteOptions{10pt}
\ProcessOptions

% --------------------------------------------------------------------------
% Size-Dependent Lengths
% --------------------------------------------------------------------------

\newlength{\@titleblockrulesep}
\newlength{\abovecaptionskip}
\newlength{\belowcaptionskip}

% --------------------------------------------------------------------------
% Font Sizes
% --------------------------------------------------------------------------

\input{font-size/size1\@ptsize.clo}

% --------------------------------------------------------------------------
% Required Packages
% --------------------------------------------------------------------------

\RequirePackage{graphicx}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{mathtools}
\RequirePackage{gfsa-units}

% --------------------------------------------------------------------------
% Page Layout
% --------------------------------------------------------------------------

\setlength{\paperwidth}{8.5in}
\setlength{\paperheight}{11in}

\setlength{\textwidth}{6.5in}
\setlength{\textheight}{9in}
\addtolength{\textheight}{-\headheight}
\addtolength{\textheight}{-\headsep}

\setlength{\oddsidemargin}{0in}
\setlength{\evensidemargin}{0in}
\setlength{\topmargin}{0in}

% --------------------------------------------------------------------------
% Title Information
% --------------------------------------------------------------------------

\newcommand{\studentname}[1]{\gdef\@studentname{#1}}
\newcommand{\course}[1]{\gdef\@course{#1}}
\newcommand{\coursename}[1]{\gdef\@coursename{#1}}
\newcommand{\assignment}[1]{\gdef\@assignment{#1}}
\newcommand{\duedate}[1]{\gdef\@duedate{#1}}

\newcommand{\@studentname}{}
\newcommand{\@course}{}
\newcommand{\@coursename}{}
\newcommand{\@assignment}{}
\newcommand{\@duedate}{}

% --------------------------------------------------------------------------
% Page Styles
% --------------------------------------------------------------------------

\def\ps@gfsa{%
  \let\@oddfoot\@empty
  \let\@evenfoot\@empty
  \let\@evenhead\@empty
  \def\@oddhead{%
    \vbox{%
      \hbox to\textwidth{%
        \makebox[0pt][l]{\@course}%
        \hfil
        \thepage\ of \PreviousTotalPages
        \hfil
        \makebox[0pt][r]{\@studentname}%
      }%
      \vskip 3pt
      \rule{\textwidth}{1pt}
    }%
  }%
}

\def\ps@gfsafirst{%
  \let\@oddhead\@empty
  \let\@evenhead\@empty
  \let\@evenfoot\@empty
  \def\@oddfoot{%
    \hfil
    \thepage\ of \PreviousTotalPages
    \hfil
  }%
}

% --------------------------------------------------------------------------
% Title Block
% --------------------------------------------------------------------------

\newcommand{\maketitle}{%
  \begingroup
    \normalfont
    \normalsize
    \setlength{\parskip}{0pt}%
    \thispagestyle{gfsafirst}%

    \vspace*{-\dimexpr\headheight+\headsep\relax}%

    \noindent
    \begin{minipage}[t]{0.5\textwidth}%
      \begin{tabular}{@{}l@{\hspace{0.5em}}l@{}}
        \textbf{Student}: & \@studentname \\
        \textbf{Course}:  & \@course\space--\space\@coursename
      \end{tabular}%
    \end{minipage}%
    \hfill
    \begin{minipage}[t]{0.5\textwidth}%
      \hfill
      \begin{tabular}{@{}l@{\hspace{0.5em}}r@{}}
        \textbf{Assignment}: & \@assignment \\
        \textbf{Due Date}:   & \@duedate
      \end{tabular}%
    \end{minipage}%

    \par
    \smallskip
    \noindent\rule{\textwidth}{1pt}\par
    \medskip
  \endgroup
}


% --------------------------------------------------------------------------
% List Layout
% --------------------------------------------------------------------------

\setlength{\leftmargini}{2.5em}
\setlength{\leftmarginii}{2.2em}
\setlength{\leftmarginiii}{1.87em}
\setlength{\leftmarginiv}{1.7em}
\setlength{\leftmarginv}{1em}
\setlength{\leftmarginvi}{1em}

\setlength{\leftmargin}{\leftmargini}

\setlength{\labelsep}{0.5em}
\setlength{\labelwidth}{\leftmargini}
\addtolength{\labelwidth}{-\labelsep}

\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty

% --------------------------------------------------------------------------
% Enumerated Lists
% --------------------------------------------------------------------------

\renewcommand{\theenumi}{\@arabic\c@enumi}
\renewcommand{\theenumii}{\@alph\c@enumii}
\renewcommand{\theenumiii}{\@roman\c@enumiii}
\renewcommand{\theenumiv}{\@Alph\c@enumiv}

\newcommand{\labelenumi}{\theenumi.}
\newcommand{\labelenumii}{(\theenumii)}
\newcommand{\labelenumiii}{\theenumiii.}
\newcommand{\labelenumiv}{\theenumiv.}

\renewcommand{\p@enumii}{\theenumi}
\renewcommand{\p@enumiii}{\theenumi(\theenumii)}
\renewcommand{\p@enumiv}{\p@enumiii\theenumiii}

% --------------------------------------------------------------------------
% Itemized Lists
% --------------------------------------------------------------------------

\newcommand{\labelitemi}{\labelitemfont\textbullet}
\newcommand{\labelitemii}{\labelitemfont\bfseries\textendash}
\newcommand{\labelitemiii}{\labelitemfont\textasteriskcentered}
\newcommand{\labelitemiv}{\labelitemfont\textperiodcentered}
\newcommand{\labelitemfont}{\normalfont}

% --------------------------------------------------------------------------
% Description Lists
% --------------------------------------------------------------------------

\newenvironment{description}
  {%
    \list{}
      {%
        \labelwidth\z@
        \itemindent-\leftmargin
        \let\makelabel\descriptionlabel
      }%
  }
  {%
    \endlist
  }

\newcommand*{\descriptionlabel}[1]
  {%
    \hspace{\labelsep}%
    \normalfont\bfseries #1%
  }

% --------------------------------------------------------------------------
% Problem - GFSA Environments
% --------------------------------------------------------------------------

\newcounter{problem}

\newenvironment{problem}[1][]
  {%
    \ifnum\value{problem}>0
      \clearpage
    \fi
    \refstepcounter{problem}%
    \noindent
    \textbf{Problem \theproblem%
      \if\relax\detokenize{#1}\relax
      \else
        \ --- #1%
      \fi
    }%
    \par\nopagebreak[4]
  }
  {}

\newenvironment{given}
  {\noindent\textbf{Given}\par\nopagebreak[4]}{}

\newenvironment{find}
  {\noindent\textbf{Find}\par\nopagebreak[4]}{}

\newenvironment{solution}
  {\noindent\textbf{Solution}\par\nopagebreak[4]}{}

\newenvironment{answer}
  {\noindent\textbf{Answer}\par\nopagebreak[4]}{}
  
% --------------------------------------------------------------------------
% Equation Numbering
% --------------------------------------------------------------------------

\renewcommand{\theequation}{\@arabic\c@equation}
\@addtoreset{equation}{problem}

% --------------------------------------------------------------------------
% Figures and Tables
% --------------------------------------------------------------------------

\g@addto@macro\@floatboxreset{\centering}

\newcounter{figure}[problem]
\renewcommand{\thefigure}{\@arabic\c@figure}

\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}

\newenvironment{figure}
  {\@float{figure}}
  {\end@float}

\newcounter{table}[problem]
\renewcommand{\thetable}{\@arabic\c@table}

\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}

\newenvironment{table}
  {\@float{table}}
  {\end@float}

% --------------------------------------------------------------------------
% Captions
% --------------------------------------------------------------------------

\setlength{\abovecaptionskip}{10\p@}
\setlength{\belowcaptionskip}{0\p@}

\long\def\@caption#1[#2]#3{%
  \par
  \addcontentsline{\csname ext@#1\endcsname}{#1}%
    {\protect\numberline{\csname the#1\endcsname}{\ignorespaces #2}}%
  \begingroup
    \@parboxrestore
    \if@minipage
      \@setminipage
    \fi
    \normalsize
    \@makecaption{\csname fnum@#1\endcsname}{#3}\par
  \endgroup
}

\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \if\relax\detokenize{#2}\relax
    \sbox\@tempboxa{\textbf{#1}}%
  \else
    \sbox\@tempboxa{\textbf{#1:} \ignorespaces#2.}%
  \fi
  \ifdim\wd\@tempboxa>\hsize
    \if\relax\detokenize{#2}\relax
      \textbf{#1}\par
    \else
      \textbf{#1:} \ignorespaces#2.\par
    \fi
  \else
    \global\@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip
}

% --------------------------------------------------------------------------
% Figure and Table Names
% --------------------------------------------------------------------------

\newcommand{\figurename}{Figure}
\newcommand{\tablename}{Table}

% --------------------------------------------------------------------------
% Page Style
% --------------------------------------------------------------------------

\pagestyle{gfsa}
\pagenumbering{arabic}

% --------------------------------------------------------------------------
% End of File
% --------------------------------------------------------------------------

\endinput
