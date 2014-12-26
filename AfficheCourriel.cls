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
\LoadClassWithOptions{scrartcl}%
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
% Gestion des options en clé=valeur
\RequirePackage{keyval}%
%
% Gestion des espaces suivants les macros
\RequirePackage{xspace}%
%
% Tableaux complexe
\RequirePackage{array}%
%
% Le document est en français
\RequirePackage[frenchb]{babel}%
%
%[[1 Constantes
%
%[[2 Définition de la date
% si aucune date n'est donnée, c'est le jour de compilation qui compte.
\newcommand\ldate{\today}%
\newcommand\defldate[1]{\renewcommand\ldate{#1}}%
%
%[[2 Définition de l'expéditeur
\newcommand\lfrom{inconnu@domain.tld}%
\newcommand\deflfrom[1]{\renewcommand\lfrom{#1}}%
%
%[[2 Marges
%
\newcommand\ltop{1cm}%
\newcommand\defltop[1]{\renewcommand\ltop{#1}}%
%
\newcommand\lbottom{2cm}%
\newcommand\deflbottom[1]{\renewcommand\lbottom{#1}}%
%
\newcommand\lleft{1.8cm}%
\newcommand\deflleft[1]{\renewcommand\lleft{#1}}%
%
\newcommand\lright{1cm}%
\newcommand\deflright[1]{\renewcommand\lright{#1}}%
%
\newcommand\lfootskip{1cm}%
\newcommand\deflfootskip[1]{\renewcommand\lfootskip{#1}}%
%
%[[1 Mise en page
%
%[[2 Marges
\RequirePackage[%
	top=\ltop,%
	bottom=\lbottom,%
	left=\lleft,%
	right=\lright,%
	footskip=\lfootskip,%
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
\ifoot[]{\lfrom}%
\cfoot[\thepage\,/\,\pageref{LastPage}]{\ldate}%
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
		\item[Date] \ldate%
		\item[From] \lfrom%
	}{%
		\end{list}%
		\noindent\raisebox{1.7ex}{\rule{\textwidth}{.13ex}}%
	}
% Fin de document

