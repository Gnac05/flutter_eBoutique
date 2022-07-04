class Article{
  String nom;
  String marque;
  String prix;
  String genre;
  String numero;
  List<String> photo;

  Article({
    required this.nom,
    this.marque = '',
    required this.prix,
    required this.genre,
    required this.numero,
    required this.photo
  });
}