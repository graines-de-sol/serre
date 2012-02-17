# language: fr
Fonctionnalité: Recherche des membres

  Afin de gagner du temps (je n'ai pas le tps de papoter avec tout le monde ou de regarder chaque profil!)
  En tant que membre,
  Je veux pouvoir trouver un autre membre en fonction de son profil (tags???)

  Contexte:
    * je suis loggé en tant "JM", membre

  Scénario: Saisie du hobbie avec un champ "libre"
    Etant donné que j'édite mon profil
    Lorsque je saisi "J'aime la Plongée, pas en piscine mais dans la mer la vraie"
    Alors les hobbies suivants doivent être indexés: "aime, plongée, pas, psicine, mer, vraie"

    Quand je vais taper "ai" dans le champ de recherche
    Alors l'autocomplétion va me suggérer "aime" ?!?

  # https://www.ruby-toolbox.com/categories/rails_tagging
  Scénario: Saisie du hobbie avec une listes de "tags" séparée par X
    Etant donné que j'édite mon profil
    Lorsque je saisi "Plongée, cinéma"
    Alors les hobbies suivants doivent être indexés: "plongée, cinéma"

    Quand je vais taper "pl" dans le champ de recherche
    Alors l'autocomplétion va me suggérer "plongée" :)

  Devoirs pour Julie et Guillaume:
  *******************************

  Pour chaque information du profil, écrire un exemple de recherche ;)
  Si possible limiter au début les infos qui seront indexées, quitte à en ajouter + tard si plusieurs membres se plaignent