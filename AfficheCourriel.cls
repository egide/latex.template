%[[1 Impression de courriel
% vim: set nospell fdm=marker foldmarker=[[,]] filetype=tex :
% Classe pour l'impression de courriel pour l'affichage
% sur tableau public
%
%[[1 Définitions de base
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{AfficheCourriel}[2014/12/23 Classe personnelle, V0.0]
%
% Chargement de la classe article de komascript
\LoadClass{scrartcl}%
%
% Encodage des documents en entrée
\RequirePackage[utf8]{inputenc}%
%
% Encodage des caractères en sortie
\RequirePackage[T1]{fontenc}%
%
% Police postscript pour une sortie correcte en pdf
\RequirePackage{lmodern}%
%
%[[1 Extentions
%
% Gestion des espaces suivants les macros
\RequirePackage{xspace}%
%
% Le document est en français
\RequirePackage[frenchb]{babel}%
%
% Tableaux complexe
\RequirePackage{array}%
%
%[[1 Mise en page
%
%[[2 Marges
\RequirePackage[%
	top=3cm,%
	bottom=3cm,%
	left=1.8cm,%
	right=1cm,%
	pdftex,%
]{geometry}%
%
%[[2 Entêtes et pieds de pages
%
%[[3 Commun
\RequirePackage{scrpage2}%
%
% connaître le numéro de la dernière page
\RequirePackage{lastpage}%
%
% vide le contenu des entêtes et pieds de pages
\clearscrheadfoot%
%
% Style de page à utiliser
\thispagestyle{plain}%
\pagestyle{scrheadings}%
%
%[[3 pied de page
% Police
\setkomafont{pagefoot}{\normalfont\sffamily\small}%
%
%numéro de page
\setkomafont{pagenumber}{\normalfont\rmfamily\slshape\normalsize}%
%
% ligne de séparation
\setfootsepline{.5pt}%
%
% Contenu i: intérieur ; c: centre ; o: extérieur
\ifoot[]{Du texte}%
\cfoot[\thepage\,/\,\pageref{LastPage}]{}%
\ofoot[]{\thepage\,/\,\pageref{LastPage}}%
%
%[[1 Liste pour l'entete
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
	}{%
		\end{list}%
		\noindent\raisebox{1.7ex}{\rule{\textwidth}{.13ex}}%
	}
% Fin de document

