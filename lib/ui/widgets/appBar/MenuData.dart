import 'dart:convert';

const String _megaMenuJson = r'''
{
  "Véhicules": {
    "icon": "car",
    "railTitle": "Véhicules",
    "columns": [
      [
        {"title":"Tout Véhicules"},
        {"title":"Voitures","items":["Audi","BMW","Mercedes","Peugeot","Renault","Volkswagen","Voir toutes les marques"]},
        {"title":"Assurance Automobile","badge":"Sponsorisé"},
        {"title":"Motos","items":["BMW","Honda","Kawasaki","Suzuki","Yamaha","Voir toutes les marques"]}
      ],
      [
        {"title":"Caravaning"},
        {"title":"Utilitaires"},
        {"title":"Camions","external":true},
        {"title":"Nautisme"},
        {"title":"Vélos"}
      ],
      [
        {"title":"Équipement auto"},
        {"title":"Équipement moto"},
        {"title":"Équipement caravaning"},
        {"title":"Équipement nautisme"},
        {"title":"Équipements vélos"},
        {"title":"Services de réparations"}
      ]
    ]
  },

  "Jeux & Jouets": {
    "icon": "toy",
    "railTitle": "Jeux & Jouets",
    "columns": [
      [
        {"title":"Tout Jeux & Jouets"},
        {"title":"Jouets enfants","items":["Construction","Imitation","Puzzles"]},
        {"title":"Jeux de société","items":["Famille","Stratégie","Cartes"]},
        {"title":"Véhicules & plein air","items":["Trottinettes","Vélos enfants"]}
      ],
      [
        {"title":"Jeux vidéo & consoles","items":["PlayStation","Xbox","Nintendo Switch","PC"]},
        {"title":"Accessoires gaming","items":["Manettes","Casques","Volants"]}
      ],
      [
        {"title":"Bons plans","items":["Remises","Packs","Occasions"]}
      ]
    ]
  },

  "Immobilier":{"icon":"home","railTitle":"Immobilier","columns":[[{"title":"Acheter"}],[{"title":"Louer"}],[{"title":"Vacances"}]]},
  "Vacances":{"icon":"travel","railTitle":"Vacances","columns":[[{"title":"Séjours"}],[{"title":"Locations"}],[{"title":"Campings"}]]},
  "Emploi":{"icon":"work","railTitle":"Emploi","columns":[[{"title":"CDI"}],[{"title":"CDD"}],[{"title":"Freelance"}]]},
  "Mode":{"icon":"fashion","railTitle":"Mode","columns":[[{"title":"Femmes"}],[{"title":"Hommes"}],[{"title":"Chaussures"}]]},
  "Maison & Jardin":{"icon":"home2","railTitle":"Maison & Jardin","columns":[[{"title":"Déco"}],[{"title":"Cuisine"}],[{"title":"Jardin"}]]},
  "Famille":{"icon":"family","railTitle":"Famille","columns":[[{"title":"Puériculture"}],[{"title":"Éveil"}],[{"title":"Vêtements enfants"}]]},
  "Électronique":{"icon":"chip","railTitle":"Électronique","columns":[[{"title":"Smartphones"}],[{"title":"Informatique"}],[{"title":"TV/Audio"}]]},
  "Loisirs":{"icon":"fun","railTitle":"Loisirs","columns":[[{"title":"Sport"}],[{"title":"Musique"}],[{"title":"Créatif"}]]},
  "Autres":{"icon":"dots","railTitle":"Autres","columns":[[{"title":"Divers"}],[{"title":"Services"}],[{"title":"Annonces"}]]},
  "Bons plans !":{"icon":"deal","railTitle":"Bons plans !","columns":[[{"title":"Promos"}],[{"title":"Destockage"}],[{"title":"Occasions"}]]}
}
''';

class MegaMenuData {
  static final Map<String, dynamic> _data = jsonDecode(_megaMenuJson);
  static List<String> get topCategories => _data.keys.toList(growable: false);
  static Map<String, dynamic>? getCategory(String key) =>
      _data[key] as Map<String, dynamic>?;
}
