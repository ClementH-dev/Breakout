# SPEC : Breakout

- **Version de la spec** : v1
- **Date** : 03 novembre 2026 -> 06 novembre 2026
- **Moteur / version** : Godot 4
- **Durée cible** : 4 jours

## 1. Pitch
Le joueur contrôle une raquette en bas de l'écran et doit renvoyer une balle
pour détruire toutes les briques d'un mur. Le plaisir vient de la précision
(viser en jouant sur le point d'impact de la raquette) et de la tension de
ne pas laisser tomber la balle

## 2. Objectifs d'apprentissage
Ce que ce projet doit m'apprendre :
- Implémenter des collisions avec `CharacterBody2D` + `move_and_collide()`
  (balle/murs, balle/briques, balle/raquette) sans `RigidBody2D`
- Calculer un rebond : par la normale (murs, briques) et selon le point
  d'impact (raquette)
- Concevoir l'architecture **avant** de coder, et la tenir (une responsabilité
  par script, communication par signaux)
- Réutiliser ce que j'ai vu dans Dodge the Creeps : scènes instanciées,
  signaux, groupes, séparation UI / gameplay

## 3. Boucle de gameplay
**Boucle principale**:
Lancer la balle → la renvoyer avec la raquette → casser des briques →
(rater la balle → perdre une vie → relancer) → victoire ou game over → restart

**Conditions de victoire / défaite** :
- Victoire : toutes les briques sont détruites
- Défaite : la balle est tombée et il ne reste plus de vie (3 au départ)

**Contrôles** :
| Action | Input |
|--------|-------|
| Raquette vers la gauche | Flèche gauche |
| Raquette vers la droite | Flèche droite |
| Lancer la balle / confirmer (menu, restart) | Espace |

## 4. Features versionnées
### v1 : MVP jouable (obligatoire)
- [ ] Arène délimitée par des murs (gauche, droite, haut) ; le bas est ouvert
- [ ] Déplacement de la raquette (gauche/droite), bloquée aux bords de l'arène
- [ ] Balle lancée à l'appui sur Espace, vitesse constante
- [ ] Rebond de la balle sur les murs et les briques (via la normale)
- [ ] Rebond sur la raquette dépendant du point d'impact (angle modifié)
- [ ] Mur de briques généré au démarrage (grille fixe)
- [ ] Une brique touchée est détruite et rapporte des points
- [ ] 3 vies : une balle perdue retire une vie et replace la balle sur la raquette
- [ ] HUD : score et vies affichés
- [ ] Écran de départ, écran game over, écran victoire, restart

### v2 : si le temps le permet
- [ ] Dispositions de briques différentes, choisies aléatoirement au début
- [ ] Sauvegarde du meilleur score (et du nom du joueur)
- [ ] Mode infini : le mur se reconstruit par le haut

### v3 : bonus / polish
- [ ] Bonus aléatoires sur certaines briques (balles multiples, super balle, vie bonus)
- [ ] Effets visuels et sonores (particules, screen shake, etc..)
- [ ] Briques à plusieurs niveaux

## 5. Hors scope
- Multijoueur local ou en ligne
- Contrôle à la souris / manette
- Éditeur de niveaux
- Menus complexes (options, pause avancée)

## 6. Assets et contraintes
- **Art / son** : formes simples (`ColorRect` / sprites Kenney.nl), pas d'animation, sons optionnels (v3)
- **Plateforme cible** : PC
- **Contraintes techniques** : pas d'autoload en v1/pas de `RigidBody2D` pour la balle/pas de plugin

## 7. Critères de « terminé »
Le projet est fini quand :
- [ ] La v1 est jouable de bout en bout (menu/start → jeu → game over → restart)
- [ ] ARCHITECTURE.md est à jour avec le code
- [ ] RETRO.md est rédigé

## 8. Risques et inconnues
- Rebond de la balle : bien utiliser la normale de collision (`velocity.bounce(normal)`) et éviter que la balle reste coincée ou perde de la vitesse
- Rebond sur la raquette : formule de l'angle selon la position d'impact, à comprendre et pas à copier
- Tunneling : à vitesse élevée, la balle peut traverser une brique ou un mur
- Qui détruit la brique et qui compte les briques restantes (signaux vs appel direct) : à trancher dans ARCHITECTURE.md
- Gestion des états (menu / jeu / game over / victoire) : où la placer sans autoload
