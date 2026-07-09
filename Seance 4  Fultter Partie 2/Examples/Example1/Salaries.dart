import 'Personne.dart';

class Salarier extends Personne {
  double salaire;

  //Constructor
  Salarier(String nom, int age, this.salaire) : super(nom, age);
  
  //Method
  @override
  void sePresenter() {
    print("Bonjour, Je suis un Salarié, je m'appelle $nom, j'ai $age ans et mon salaire est de $salaire €.");  
  }

    // Méthode spécifique
  void augmentation(double montant) {
    salaire += montant;
    print("Nouveau salaire pour $nom : $salaire €.");
  }

} 