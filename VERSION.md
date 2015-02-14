Version
=======

Branche
-------
feature/EcoleLecture.titraille
Parent: 487fc6fcd1854fe732a2e26c43643a9be1a662ef


Objectif
--------
Il y a un soucis avec la gestion des espaces verticaux avant les titres après la
redéfinition de la titraille. Je dois trouver un autre moyen de supprimer la
numérotation des lignes.


Résolution
----------
Je pense que c'est le \[begin/end]group qui posait problème.
La résolution passe par le fait d'ajouter la commande \nolinenumbers  dans le
paramètre des commandes de sectionnement.


État
====
Résolut
Bogue à l'affichage.

