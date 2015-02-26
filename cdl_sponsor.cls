%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Classe de document pour la mise en page du dossier de sponsoring
% du Capitole du Libre
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cdl_sponsor}

\LoadClass[a4paper,11pt]{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Packages

% Polices
\RequirePackage{microtype}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}

\usepackage{tgadventor}
%\renewcommand*\familydefault{\sfdefault} %% Only if the base font of the document is to be sans serif
%\usepackage[T1]{fontenc}

% Mise en page
\RequirePackage{fancyhdr}
\RequirePackage[bookmarks=false,
                unicode=true,
                pdffitwindow=true,
                colorlinks=true,
                urlcolor=Cdl]{hyperref}

% Graphique
\RequirePackage{graphicx}
\RequirePackage{tikz}
\RequirePackage{wrapfig}
\definecolor{Cdl}{rgb}{0.81,0.24,0.00}

% Utile
\RequirePackage{ifthen}
\RequirePackage{ifpdf}
\RequirePackage{lastpage}
\usepackage{pifont}
\usepackage{multirow}

% Divers 

\usepackage{eurosym}
\usepackage{siunitx}
\usepackage[francais]{babel}
\usepackage{pifont}
\newcommand{\logo}{\textcolor{Cdl}{\ding{'340}}}
\newcommand{\urllogoau}[2]{\href{#1}{\includegraphics[width=4cm]{Images/#2}}}
\newcommand{\urllogoag}[2]{\href{#1}{\includegraphics[width=3cm]{Images/#2}}}
\newcommand{\urllogobr}[2]{\href{#1}{\includegraphics[width=2cm]{Images/#2}}}

\usepackage{array,multirow,makecell}
\usepackage{colortbl}

% Guillemets

\newcommand{\g}[1]{\og #1 \fg{}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Constantes

% Séparateur
\newcommand{\Separateur}{\vspace*{0.5\baselineskip}}

% Espace de début de paragraphe
\setlength{\parindent}{0cm}

% Marges
\setlength{\hoffset}{0pt}
\setlength{\oddsidemargin}{0pt}
\setlength{\marginparsep}{0pt}
\setlength{\marginparwidth}{0pt}
\setlength{\marginparpush}{0pt}

\setlength{\voffset}{0pt}
\setlength{\topmargin}{0pt}
\setlength{\headheight}{0pt}
\setlength{\headsep}{0pt}

\setlength{\footskip}{40pt}

\setlength{\textwidth}{448pt}
\setlength{\textheight}{650pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Variables

% Titre du document (utiliser \DefTitre pour le changer)
\newcommand{\Titre}{}
\newcommand{\DefTitre}[1]{\renewcommand{\Titre}{#1}}
\DefTitre{Titre inconnu} % Valeur par défaut

% Sous-titre du document (utiliser \DefSousTitre pour le changer)
\newcommand{\SousTitre}{}
\newcommand{\DefSousTitre}[1]{\renewcommand{\SousTitre}{#1}}
\DefSousTitre{Sous-titre inconnu} % Valeur par défaut

% Auteur du document (utiliser \DefAuteur pour le changer)
\newcommand{\Auteur}{}
\newcommand{\DefAuteur}[1]{\renewcommand{\Auteur}{#1}}
\DefAuteur{Auteur inconnu} % Valeur par défaut

% Page web (utiliser \DefWeb pour le changer)
\newcommand{\Web}{}
\newcommand{\DefWeb}[1]{\renewcommand{\Web}{#1}}
\DefWeb{http://} % Valeur par défaut

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Création du titre
%  #1  : Image d'arrière-plan du titre
%  #2  : Crédits pour l'image
\newcommand{\CreerTitre}[2]{
  \begingroup
    \begin{tikzpicture}[remember picture, overlay]
      \node at (current page.north west){
        \begin{tikzpicture}[remember picture, overlay]
          % Noeud dont l'origine en haut à gauche est décalée de 0.14 vers la
          % gauche pour éviter une bande blanche incompréhensible.
          \node[anchor=north west, inner sep=0] at (-0.14,0){
            \ifthenelse{\equal{#1}{}}{}{
              \includegraphics[width=\paperwidth, height=0.35\paperheight]{#1}
            }
          };
          \node[anchor=west, text opacity=0.9] at (0,-0.34\paperheight){
            \footnotesize\textcolor{gray}{\textbf{#2}}
          };
          \draw[anchor=north] (0.5\paperwidth,-0.35\paperheight) node[fill=black, inner sep=5] {
            \huge\textcolor{white}{\hspace{0.05\paperwidth}\textbf{\bsc{\Titre}}\hspace{0.05\paperwidth}}
          };
        \end{tikzpicture}
      };
    \end{tikzpicture}
  \endgroup

  \par\vspace*{0.4\paperheight}

  \begingroup
    \begin{center}
      \Huge\bsc{\bsc{\SousTitre}}
      \par\vspace*{-0.015\paperheight}
      \begin{tikzpicture}
        \draw[line width=2pt] (0,0) -- (\textwidth-2pt,0);
      \end{tikzpicture}
    \end{center}
  \endgroup

  \par\vspace*{0.04\paperheight}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% En-têtes et pieds de page
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\fancyfoot[L]{\footnotesize{\Titre\\\url{\Web}}}
%\fancyfoot[C]{\footnotesize{\textit{~\\\SousTitre}}}
\fancyfoot[C]{\footnotesize{\textit{~ \\\SousTitre}}}
\fancyfoot[R]{\footnotesize{~\\\thepage/\pageref*{LastPage}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Environnement pour la mise en page de l'introduction
\newenvironment{Introduction}{}{\newpage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mise en page des sections
\makeatletter
\def\section#1{
  \vspace*{\baselineskip}
  \begingroup
    \noindent
    \leavevmode\Large\bfseries\raggedright\textcolor{Cdl}{#1}\par\nobreak
  \endgroup
  \vspace*{-0.01\paperheight}
  \noindent\textcolor{Cdl}{\hrulefill}\nobreak
  \vskip 1ex\nobreak
}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mise en page des sous-sections
\makeatletter
\def\subsection#1{
  \vspace*{\baselineskip}
  \begingroup
    \noindent
    \leavevmode\large\bfseries\raggedright\textcolor{Cdl}{#1}\par\nobreak
  \endgroup
  \vspace*{0.5\baselineskip}
}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Inclusion d'image dans le texte
\newcommand{\ImageDroite}[1]{
  \begin{wrapfigure}{r}{0.4\textwidth}
    \centering
    \includegraphics[width=0.4\textwidth]{#1}
  \end{wrapfigure}
}

\newcommand{\ImageDroitebis}[1]{
  \begin{wrapfigure}{r}{0.15\textwidth}
    \centering
    \includegraphics[width=0.15\textwidth]{#1}
  \end{wrapfigure}
}

\newcommand{\ImageGauche}[1]{
  \begin{wrapfigure}{l}{0.4\textwidth}
    \centering
    \includegraphics[width=0.4\textwidth]{#1}
  \end{wrapfigure}
}