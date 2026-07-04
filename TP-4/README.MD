# Séance 4 : Fultter Partie 2

Deux axes couverts par cette séance :
1. **Programmation orientée objet avec Dart** — classes, constructeurs, héritage, polymorphisme, gestion des erreurs, modèle géométrique complet.
2. **Application de synthèse Flutter** — navigation par Drawer, routes nommées, StatefulWidget / setState, navigation impérative (push / pop) avec passage de données, consommation d'API REST.

## Partie 1
Pratique des concept the base de programmation OO avec Dart
### Example 1
![example1](./screenshots/Example1.png)
### Example 2
![example2](./screenshots/Example2.png)
### Example 3
![example3](./screenshots/Example3.png)

## Partie 2
### Version Web
|Home|Drawer|Meteo|Gallery|Counter|
|----|------|-----|--------|------|
|![homeweb](./screenshots/Web_HomePage.png)|![Drawer](./screenshots/Web_Drawer.png)|![Meteo](./screenshots/Web_Meteo.png)|![login](./screenshots/Web_Gallery.png)|[counter](./screenshots/Web_Counter.png)|

|Login|Game|X Win|O win|Draw|
|----|-----|-----|----|-----|
|![login](./screenshots/Web_Login.png)|![Game](./screenshots/Web_Game.png)|![X win](./screenshots/Web_XWIN.png)|![O win](./screenshots/Web_OWIN.png)|[Draw](./screenshots/Web_Draw.png)|


### Version Android
|Home|Drawer|Meteo|Gallery|Counter|
|----|------|-----|--------|------|
|![homeweb](./screenshots/Android_Home.png)|![Drawer](./screenshots/Android_Drawer.png)|![Meteo](./screenshots/Android_Meteo.png)|![login](./screenshots/Android_Login.png)|[counter](./screenshots/Android_Counter.png)



|Login|Game|X Win|O win|Draw|
|----|-----|-----|----|-----|
|![login](./screenshots/Android_Login.png)|![Game](./screenshots/Android_Game.png)|![X win](./screenshots/Android_XWIN.png)|![O win](./screenshots/Android_OWIN.png)|[Draw](./screenshots/Android_Draw.png)|



### Exécution
```bash
        cd app_synthese
        flutter run -d edge --dart-define-from-file=.env             # aperçu web
        flutter run -d <id-emulateur> --dart-define-from-file=.env   # sur émulateur/téléphone Android
```