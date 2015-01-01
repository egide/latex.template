%[[1 Définitions de base
% vim: set nospell fdm=marker foldmarker=[[,]] filetype=tex :
% Classe pour l'impression de courriel pour l'affichage
% sur tableau d'affichage public

\NeedsTeXFormat{LaTeX2e}%            Déclaration du format LaTeX cible Nom et version de la classe fournie
\ProvidesClass{AfficheCourriel}[2014/12/23 Classe personnelle, V0.0]
\LoadClassWithOptions{scrartcl}%     Chargement de la classe article de komascript en lui passant les options
\RequirePackage[utf8]{inputenc}%     Encodage des documents en entrée
\RequirePackage[T1]{fontenc}%        Encodage des caractères en sortie

%[[1 Extentions
\RequirePackage{xspace}%             Gestion des espaces suivants les macros
\RequirePackage{lmodern}%            Police postscript pour une sortie correcte en pdf
\RequirePackage{keyval}%             Gestion des options en clé=valeur
\RequirePackage{array}%              Tableaux complexe
\RequirePackage{lastpage}%           connaître le numéro de la dernière page
\RequirePackage{scrpage2}%           Gestion des entêtes et pieds de pages
\RequirePackage[%                    Gestion des marges
		top=2cm,%
		bottom=2cm,%
		left=2cm,%
		right=2cm,%
		footskip=1cm,%
		pdftex%
	]
	{geometry}
\RequirePackage[frenchb]{babel}%     Le document est en français

%[[1 Constantes
% Définition de la date
% si aucune date n'est donnée, c'est le jour de compilation qui compte.
\newcommand\ldate{\today}
\newcommand\defldate[1]{\renewcommand\ldate{#1}}

% Définition de l'expéditeur
\newcommand\lfrom{inconnu@domain.tld}
\newcommand\deflfrom[1]{\renewcommand\lfrom{#1}}

%[[1 Options
%[[2 Mise en page
\DeclareOption{margepetite}{%[[3
	\geometry{%
		top=1cm,%
		bottom=2cm,%
		left=1cm,%
		right=1cm%
	}
}

\DeclareOption{margegrande}{%[[3
	\geometry{%
		top=3cm,%
		bottom=3cm,%
		left=3cm,%
		right=3cm%
	}
}


\ProcessOptions

%[[1 Entêtes et pieds de pages
% vide le contenu des entêtes et pieds de pages
\clearscrheadfoot

% Style de page à utiliser
\thispagestyle{plain}
\pagestyle{scrheadings}

% Police du pied de page
\setkomafont{pagefoot}{\normalfont\sffamily\small}

%numéro de page
\setkomafont{pagenumber}{\normalfont\rmfamily\slshape\normalsize}

% ligne de séparation
\setfootsepline{.5pt}

% Contenu i: intérieur ; c: centre ; o: extérieur
\ifoot[]{\lfrom}
\cfoot[\thepage\,/\,\pageref{LastPage}]{\thepage\,/\,\pageref{LastPage}}
\ofoot[]{\ldate}

%[[1 Commandes personnelles
%[[2 Liste en tête de document
\newcommand{\entrylabel}[1]{\hfill\sffamily\scriptsize\bfseries #1 :}
\newenvironment{mylist}%
	{%
		\noindent%
		\begin{list}{}%
			{%
				\setlength{\labelwidth}{6em}%
				\setlength{\leftmargin}{6.1em}%
				\setlength{\rightmargin}{1em}%
				\setlength{\itemsep}{0em}%
				\setlength{\itemindent}{0em}%
				\renewcommand{\makelabel}{\entrylabel}%
			}%
		\item[Date] \ldate%
		\item[From] \lfrom%
	}{%
		\end{list}%
		\noindent\raisebox{1.7ex}{\rule{\textwidth}{.13ex}}%
	}

%[[2 Signature
% Commande pour placer la signature de l'expéditeur
\newcommand\signature[1]{%
	\nopagebreak[5]%
	\vspace{2ex plus 1ex minus 1ex}%
	\nopagebreak[5]%
	\hfill\hfill\parbox{.49\linewidth}{\centering\slshape #1}\hfill%
}


% Fin de document

