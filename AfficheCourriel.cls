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
\LoadClass[pdflatex,parskip=half]{scrartcl}%
%
% Encodage des documents en entrée
\usepackage[utf8]{inputenc}%
%
% Encodage des caractères en sortie
\usepackage[T1]{fontenc}%
%
% Police postscript pour une sortie correcte en pdf
\usepackage{lmodern}%
%
%[[1 Extentions
%
% Gestion des espaces suivants les macros
\usepackage{xspace}%
%
% Le document est en français
\usepackage[frenchb]{babel}%
%
% Tableaux complexe
\usepackage{array}%
%
%[[1 Mise en page
%
\usepackage[top=1cm, bottom=1cm, left=1.8cm, right=1cm,]{geometry}%
%
%[[1 Liste pour l'entete
\newcommand{\entrylabel}[1]{\hfill\sffamily\scriptsize\bfseries #1 :}
\newenvironment{mylist}%
	{%
		\noindent%
		\begin{list}%
			{}%
			{%
				\setlength{\labelwidth}{5em}%
				\setlength{\leftmargin}{5.1em}%
				\setlength{\rightmargin}{1em}%
				\setlength{\itemsep}{0em}%
				\setlength{\itemindent}{0em}%
				\renewcommand{\makelabel}{\entrylabel}%
			}%
	}{%
		\end{list}%
		\par\vspace{.2ex}\noindent\hrulefill\par\vspace{1ex}%
	}
% Fin de document

