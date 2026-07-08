class Personne {
    String nom;
    int age;

    //Constructor
    Personne(this.nom, this.age);

    //Methods
    void sePresenter(){
        print("Bonjour, je suis $nom et j'ai $age");
    }
}