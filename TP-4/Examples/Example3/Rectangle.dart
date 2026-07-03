class Rectangle {
  int longueur;
  int largeur;

  Rectangle(this.largeur, this.longueur);

    // méthode qui calcul la surface du rectangle
    int surface(){
      return this.longueur * this.largeur;
    }
  // méthode qui calcul le périmètre du rectangle
    int perimetre(){
      return 2 * (this.longueur + this.largeur);
    }

}