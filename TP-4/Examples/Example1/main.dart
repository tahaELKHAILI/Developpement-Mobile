import 'Personne.dart';
import 'Salaries.dart';

void main(){

  // Création d'un objet Personne
  Personne p1 = new Personne("John", 20);
  p1.sePresenter();

  // Création d'un objet Salaries
  Salarier s1 = new Salarier("Jim", 25, 5000);
  s1.sePresenter();
  s1.augmentation(500);
  s1.sePresenter();

}