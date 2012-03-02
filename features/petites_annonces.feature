# language: fr
Fonctionnalité: Administration des catégories des petites annonces

  Afin de faciliter la recherche d'opportunitées,
  en tant qu'admin,
  je veux catégoriser les annonces

  Contexte:
    * je suis logué en tant "Julie", admin
    * je suis dans la partie "admin" du Refuge

  @to_discuss
  Scénario: Catégories de base
    * je devrais voir les catégories suivantes: "Offre d'emploi, Divers" ...

  Scénario: Nouvelles catégories
    * je devrais pouvoir ajouter une catégorie ou la renommer

  Scénario: Comment sont présentées les catégories? Par ordre alpha


Fonctionnalité: Petites annonces

  Afin de bénéficier des opportunitées au sein des réseaux des autres membres,
  en tant que membre,
  je veux pouvoir partager des offres et petites annonces.

  Contexte:
    * je suis logué en tant "JM", membre
    * je vais dans la page "Petites Annonces", accessible depuis le menu et/ou le "dashboard"

  @to_discuss @wireframe
  Scénario: Ajout d'une offre d'emploi
    Etant donné que je clique sur "CREER UNE PETITE ANNONCE"
    Lorsque je saisis un titre "Mission d'1 mois pr rockstar ruby en remote" avec une longue description
    Et que je choisis la catégorie "Offre d'emploi"
    Alors je devrais voir apparaitre mon offre dans la liste des PA, en premiére position

  Scénario: RSS ;) ?
