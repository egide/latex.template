%[[1 Impression de courriel
% vim: set nospell fdm=marker foldmarker=[[,]] filetype=tex :
% Classe pour l'impression de courriel pour l'affichage
% sur tableau public
%
%[[1 définitions de base
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{AfficheCourriel}[2014/12/23 Classe personnelle, V0.0]
%
% chargement de la classe article de komascript
\LoadClass[pdflatex,parskip=half]{scrartcl}%
%
% encodage des documents en entrée
\usepackage[utf8]{inputenc}%
%
% encodage des caractères en sortie
\usepackage[T1]{fontenc}%
%
% Police postscript pour une sortie correcte en pdf
\usepackage{lmodern}%
%
%[[1 extentions
%
% Gestion des espaces suivants les macros
\usepackage{xspace}%
%
% Le document est en français
\usepackage[frenchb]{babel}%
