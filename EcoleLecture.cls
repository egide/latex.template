%[1 Définitions de base
% vim: set nospell fdm=marker foldmarker=%[,%] filetype=tex :
% Classe pour l'impression de courriel pour l'affichage
% sur tableau d'affichage public

\NeedsTeXFormat{LaTeX2e}%            Déclaration du format LaTeX cible Nom et version de la classe fournie
\ProvidesClass{EcoleLecture}[2014/12/23 Classe personnelle, V0.0]
\LoadClassWithOptions{scrartcl}%     Chargement de la classe article de komascript en lui passant les options
\RequirePackage[utf8]{inputenc}%     Encodage des documents en entrée
\RequirePackage[T1]{fontenc}%        Encodage des caractères en sortie

%[1 Extentions
\RequirePackage{xspace}%             Gestion des espaces suivants les macros
\RequirePackage{lmodern}%            Police postscript pour une sortie correcte en pdf
\RequirePackage{keyval}%             Gestion des options en clé=valeur
\RequirePackage{array}%              Tableaux complexe
\RequirePackage{lastpage}%           connaître le numéro de la dernière page
\RequirePackage{scrlayer-scrpage}%   Gestion des entêtes et pieds de pages
\RequirePackage{multicol}%           Pour mettre le texte en colonnes
\usepackage{lineno}%                 Numérotation des lignes
\RequirePackage[%                    Gestion des marges
		top=2cm,%
		bottom=2cm,%
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
\newcommand*{\titre}[1]{%
	\renewcommand*{\@titre}{#1}%
	\hypersetup{pdftitle={\expandafter\@titre}}%
}

%[2 \@auteur Auteur (du document: mise en forme)
\newcommand*{\@auteur}{Anonyme}
\newcommand*{\auteur}[1]{%
	\renewcommand*{\@auteur}{#1}%
	\hypersetup{pdfauthor={\@auteur}}%
}

%[2 \@sujet Sujet (sous titre)
\newcommand*{\@sujet}{Document sans sous-titre}
\newcommand*{\sujet}[1]{%
	\renewcommand*{\@sujet}{#1}%
	\hypersetup{pdfsubject={\@sujet}}%
}

%[2 \@createur Créateur: l'auteur original du texte
\newcommand*{\@createur}{\@auteur}
\newcommand*{\createur}[1]{%
	\renewcommand*{\@createur}{#1}%
	\hypersetup{pdfcreator={\@createur}}%
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

%[1 Options
%[2 Mise en page
\DeclareOption{margepetite}{%[3
	\geometry{%
		top=1cm,%
		bottom=2cm,%
		inner=1cm,%
		outer=1cm,%
	}
}

\DeclareOption{margegrande}{%[3
	\geometry{%
		top=3cm,%
		bottom=3cm,%
		inner=3cm,%
		outer=3cm,%
	}
}


\ProcessOptions

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
\setfootsepline{.5pt}
\setheadsepline{.5pt}

% Contenu i: intérieur ; c: centre ; o: extérieur
\ifoot[]{\@auteur}
\cfoot[\thepage\,/\,\pageref{LastPage}]{\thepage\,/\,\pageref{LastPage}}
\ofoot[]{\@mdate}
\ihead[]{\@titre}
\chead[]{\@sujet}
\ohead[]{\@createur}

%[1 Mise en page
% Titres
%Suprime la numérotation des titres
\setcounter{secnumdepth}{-2}
\KOMAoptions{%
	headings=small, % petite écriture pour les titres
}
%[1 Commandes personnelles
%[2 PDF
\hypersetup{%
}

%[2 Titre
\renewcommand{\maketitle}{%
	\begin{center}%
		\centering%
		\vspace*{1em plus 1em minus 3em}%
			\LARGE%
			\@titre%
		\vspace{1em plus 1em minus 1.5em}%
	\end{center}%
}

%[2 Ajout des colonnes
\newenvironment{colonnes}{%
	\setlength{\columnsep}{16pt}%
	\setlength{\columnseprule}{.2pt}%
	\begin{multicols}{2}%
	\def\linenumberfont{\normalfont\tiny\sffamily\textsuperscript}%
	\setlength{\linenumbersep}{1pt}%
	\setpagewiselinenumbers%
	\modulolinenumbers[2]%
	\firstlinenumber{1}%
	\linenumbers%
}{%
	\nolinenumbers%
	\end{multicols}%
}

% Fin de document

