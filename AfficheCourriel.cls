%[[1 Impression de courriel
% vim: set nospell fdm=marker foldmarker=[[,]] filetype=tex :
% Classe pour l'impression de courriel pour l'affichage
% sur tableau d'affichage public

%[[1 Définitions de base
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{AfficheCourriel}[2014/12/23 Classe personnelle, V0.0]
\LoadClassWithOptions{scrartcl}%     Chargement de la classe article de komascript
\RequirePackage[utf8]{inputenc}%     Encodage des documents en entrée
\RequirePackage[T1]{fontenc}%        Encodage des caractères en sortie

%[[1 Extentions
\RequirePackage{lmodern}%            Police postscript pour une sortie correcte en pdf
\RequirePackage{keyval}%             Gestion des options en clé=valeur
\RequirePackage{xspace}%             Gestion des espaces suivants les macros
\RequirePackage{array}%              Tableaux complexe
\RequirePackage{scrpage2}%           Gestion des entêtes et pieds de pages
\RequirePackage{lastpage}%           connaître le numéro de la dernière page
\RequirePackage[frenchb]{babel}%     Le document est en français

%[[1 Constantes
% Définition de la date
% si aucune date n'est donnée, c'est le jour de compilation qui compte.
\newcommand\ldate{\today}
\newcommand\defldate[1]{\renewcommand\ldate{#1}}

% Définition de l'expéditeur
\newcommand\lfrom{inconnu@domain.tld}
\newcommand\deflfrom[1]{\renewcommand\lfrom{#1}}

%[[1 Mise en page
\RequirePackage[%
	top=1cm,%
	bottom=2cm,%
	left=1.8cm,%
	right=1cm,%
	footskip=1cm,%
	pdftex,%
]{geometry}%

%[[1 Entêtes et pieds de pages
% vide le contenu des entêtes et pieds de pages
\clearscrheadfoot

% Style de page à utiliser
\thispagestyle{plain}
\pagestyle{scrheadings}

% Police
\setkomafont{pagefoot}{\normalfont\sffamily\small}

%numéro de page
\setkomafont{pagenumber}{\normalfont\rmfamily\slshape\normalsize}

% ligne de séparation
\setfootsepline{.5pt}

% Contenu i: intérieur ; c: centre ; o: extérieur
\ifoot[]{\lfrom}
\cfoot[\thepage\,/\,\pageref{LastPage}]{\ldate}
\ofoot[]{\thepage\,/\,\pageref{LastPage}}

%[[1 Commandes personnelles
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
% Fin de document

