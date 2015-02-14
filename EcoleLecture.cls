%[1 Définitions de base
% vim: set nospell fdm=marker foldmarker=%[,%] filetype=tex :
% Classe pour l'impression de textes de lecture suivie en classe
% sur tableau d'affichage public

\NeedsTeXFormat{LaTeX2e}%            Déclaration du format LaTeX cible Nom et version de la classe fournie
\ProvidesClass{EcoleLecture}[2014/12/23 Classe personnelle, V0.0]
\LoadClassWithOptions{scrartcl}%     Chargement de la classe article de komascript en lui passant les options
\KOMAoptions{%
	twoside,
}

\RequirePackage[utf8]{inputenc}%     Encodage des documents en entrée
\RequirePackage[T1]{fontenc}%        Encodage des caractères en sortie

%[1 Extentions
\RequirePackage{xspace}%             Gestion des espaces suivants les macros
\RequirePackage{lmodern}%            Police postscript pour une sortie correcte en pdf
\RequirePackage{keyval}%             Gestion des options en clé=valeur
\RequirePackage{array}%              Tableaux complexe
\RequirePackage{lastpage}%           connaître le numéro de la dernière page
\RequirePackage{paralist}%           Liste compactes
\RequirePackage[%                    Gestion des entêtes et pieds de pages
	footsepline=.1pt,
	headsepline=.1pt,
	plainfootsepline=true
]{scrlayer-scrpage}%
\RequirePackage{multicol}%           Pour mettre le texte en colonnes
\RequirePackage[np]{numprint}%       Mise en forme des chiffres
\usepackage{lineno}%                 Numérotation des lignes
\RequirePackage[%                    Gestion des marges
	includehead,%
	includefoot,%
	top=1cm,%
	bottom=1cm,%
	inner=2.2cm,%
	outer=1.8cm,%
	footskip=1cm,%
	pdftex,%
]{geometry}
\RequirePackage{hyperref}
\RequirePackage[frenchb]{babel}%     Le document est en français

%[1 Constantes
%[2  \@mdate Définition de la date
% si aucune date n'est donnée, c'est le jour de compilation qui compte.
\newcommand\@mdate{\today}
\newcommand\mdate[1]{\renewcommand\@mdate{#1}}

%[2 \@titre Titre du document
\newcommand*{\@titre}{Document sans titre}
\newcommand*{\@titrehead}{Document sans titre}
\newcommand*{\titre}[2][\null]{%
	\ifx#1\null%
		\renewcommand*{\@titrehead}{#2}%
	\else%
		\renewcommand*{\@titrehead}{#1}%
	\fi%
	\renewcommand*{\@titre}{#2}%
	\hypersetup{pdftitle={\expandafter\@titrehead}}%
}

%[2 \@auteur Auteur: Auteur original du texte
\newcommand*{\@auteur}{Anonyme}
\newcommand*{\@auteurhead}{Anonyme}
\newcommand*{\auteur}[2][\null]{%
	\ifx#1\null%
		\renewcommand*{\@auteurhead}{#2}%
	\else%
		\renewcommand*{\@auteurhead}{#1}%
	\fi%
	\renewcommand*{\@auteur}{#2}%
	\hypersetup{pdfauthor={\@auteurhead}}%
}

%[2 \@sujet Sujet (sous titre)
\newcommand*{\@sujet}{Document sans sous-titre}
\newcommand*{\@sujethead}{Document sans sous-titre}
\newcommand*{\sujet}[2][\null]{%
	\ifx#1\null%
		\renewcommand*{\@sujethead}{#2}%
	\else%
		\renewcommand*{\@sujethead}{#1}%
	\fi%
	\renewcommand*{\@sujet}{#2}%
	\hypersetup{pdfsubject={\@sujethead}}%
}

%[2 \@createur Créateur: Celui qui fait la mise en page
\newcommand*{\@createur}{\@auteur}
\newcommand*{\@createurhead}{\@auteur}
\newcommand*{\createur}[2][\null]{%
	\ifx#1\null%
		\renewcommand*{\@createurhead}{#2}%
	\else%
		\renewcommand*{\@createurhead}{#1}%
	\fi%
	\renewcommand*{\@createur}{#2}%
	\hypersetup{pdfcreator={\@createurhead}}%
}

%[2 \@producteur Producteur: le logiciel utilisé
\newcommand*{\@producteur}{LaTeX2E}
\newcommand*{\producteur}[1]{%
	\renewcommand*{\@producteur}{#1}%
	\hypersetup{pdfproducer={\@producteur}}%
}

%[2 \@motscles Mots clés
\newcommand*{\@motscles}{}
\newcommand*{\motscles}[1]{%
	\renewcommand*{\@motscles}{#1}%
	\hypersetup{pdfkeywords={\@motscles}}%
}

%[1 Entêtes et pieds de pages
% vide le contenu des entêtes et pieds de pages
\clearscrheadfoot

% Style de page à utiliser
\pagestyle{scrheadings}

% Police du pied de page
\setkomafont{pagefoot}{\normalfont\sffamily\small}
\setkomafont{pagehead}{\normalfont\sffamily\small}

%numéro de page
\setkomafont{pagenumber}{\normalfont\rmfamily\slshape\normalsize}

% ligne de séparation
% Contenu i: intérieur ; c: centre ; o: extérieur
\ifoot[\@createurhead]{\@createurhead}
\cfoot[\thepage\,/\,\pageref{LastPage}]{\thepage\,/\,\pageref{LastPage}}
\ofoot[\@mdate]{\@mdate}
\ihead[]{\@titrehead}
\chead[]{\@sujethead}
\ohead[]{\@auteurhead}

%[1 Mise en page
% Titres
%Suprime la numérotation des titres
\setcounter{secnumdepth}{-2}
\KOMAoptions{%
	headings=small, % petite écriture pour les titres
}

% Caractère des titres
\addtokomafont{part}{\rmfamily}
\addtokomafont{section}{\rmfamily}
\addtokomafont{minisec}{\rmfamily}
\addtokomafont{subsection}{\rmfamily}
\addtokomafont{subsubsection}{\rmfamily}
\addtokomafont{paragraph}{\rmfamily}
\addtokomafont{subparagraph}{\rmfamily}
\addtokomafont{pagehead}{\rmfamily\footnotesize}
\addtokomafont{pagefoot}{\rmfamily\footnotesize}

%[1 Commandes personnelles
%[2 PDF
\hypersetup{%
	colorlinks=true,%		colorise les liens
	breaklinks=true,%		permet les retours à la ligne pour les liens trop longs
	urlcolor= blue,%		couleur des hyperliens
	linkcolor= blue,%		couleur des liens internes aux documents (index, figures, tableaux, equations,...)
	citecolor= green%		couleur des liens vers les references bibliographiques
}

%[2 Titre
%[3 Titre du document
\renewcommand{\maketitle}{%
	\thispagestyle{plain}
	\begin{center}%
		\centering%
			\Large%
			\@titre%
			\par%
		\vspace{1ex plus 1ex minus 1.5ex}%
			\large%
			\@sujet%
			\par%
		\vspace{1ex plus 1ex minus 1.5ex}%
			\normalsize%
			\@auteur%
		\vspace{1em plus 2em minus 1.5em}%
	\end{center}%
}

%[3 Titraille
\newcommand{\partnonum}[2][\null]{%[4
	\begingroup%
	\nolinenumbers%
	\part[#1]{#2}%
	\endgroup%
}

\newcommand{\sectionnonum}[2][\null]{%[4
	\begingroup%
	\nolinenumbers%
	\section[#1]{#2}%
	\endgroup%
}

\newcommand{\minisecnonum}[1]{%[4
	\begingroup%
	\nolinenumbers%
	\minisec{#1}%
	\endgroup%
}

\newcommand{\subsectionnonum}[2][\null]{%[4
	\begingroup%
	\nolinenumbers%
	\subsection[#1]{#2}%
	\endgroup%
}

\newcommand{\subsubsectionnonum}[2][\null]{%[4
	\begingroup%
	\nolinenumbers%
	\subsubsection[#1]{#2}%
	\endgroup%
}

%[2 Ajout des colonnes
\newenvironment{colonnes}{%
	\def\linenumberfont{\normalfont\tiny\sffamily\textsuperscript}%
	\setlength{\linenumbersep}{0pt}%
	\setpagewiselinenumbers%
	\modulolinenumbers[2]%
	\firstlinenumber{1}%
	\linenumbers%
	\setlength{\columnsep}{14pt}%
%	\setlength{\columnseprule}{.1pt}%
	\begin{multicols}{2}%
}{%
	\end{multicols}%
	\nolinenumbers%
}

% Fin de document

%[1 Options
%[2 Mise en page
\DeclareOption{oneside}{%[3
	\KOMAoptions{twoside=false}
}

\DeclareOption{margepetite}{%[3
	\geometry{%
		top=0.5cm,%
		bottom=0.6cm,%
		inner=2cm,%
		outer=0.8cm,%
	}
}

\DeclareOption{margegrande}{%[3
	\geometry{%
		top=1.5cm,%
		bottom=1.5cm,%
		inner=3cm,%
		outer=2cm,%
	}
}

\ProcessOptions\relax

