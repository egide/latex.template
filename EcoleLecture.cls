%[[1 Définitions de base
% vim: set nospell fdm=marker foldmarker=[[,]] filetype=tex :
% Classe pour l'impression de courriel pour l'affichage
% sur tableau d'affichage public

\NeedsTeXFormat{LaTeX2e}%            Déclaration du format LaTeX cible Nom et version de la classe fournie
\ProvidesClass{EcoleLecture}[2014/12/23 Classe personnelle, V0.0]
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
\RequirePackage{hyperref}
\RequirePackage[frenchb]{babel}%     Le document est en français

%[[1 Constantes
% Définition de la date
% si aucune date n'est donnée, c'est le jour de compilation qui compte.
\newcommand\@date{\today}
\newcommand\date[1]{\renewcommand\@date{#1}}

% Titre du document
\newcommand*{\@titre}{Document sans titre}
\newcommand*{\titre}[1]{\renewcommand*{\@titre}{#1}}

% Auteur (du document: mise en forme)
\newcommand*{\@auteur}{Anonyme}
\newcommand*{\auteur}[1]{\renewcommand*{\@auteur}{#1}}

% Sujet (sous titre)
\newcommand*{\@sujet}{Document sans sous-titre}
\newcommand*{\sujet}[1]{\renewcommand*{\@sujet}{#1}}

% Créateur: l'auteur original du texte
\newcommand*{\@createur}{\@auteur}
\newcommand*{\createur}[1]{\renewcommand*{\@createur}{#1}}

% Producteur: le logiciel utilisé
\newcommand*{\@producteur}{LaTeX2E}
\newcommand*{\producteur}[1]{\renewcommand*{\@producteur}{#1}}

% Mots clés
\newcommand*{\@motscles}{}
\newcommand*{\motscles}[1]{\renewcommand*{\@motscles}{#1}}

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
%[[2 PDF
\hypersetup{%
	pdftitle={\@titre},
	pdfauthor={\@auteur},
	pdfsubject={\@sujet},
	pdfcreator={\@createur},
	pdfproducer={\@producteur},
	pdfkeywords={\@motscles},
}

% Fin de document

