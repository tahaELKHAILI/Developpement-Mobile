import 'Point.dart';

void main() {
    var p1 = Point(2, 5); // new est un mot optionnel
    print(p1.x);
    print(p1.y);
    p1.affiche();
    var p2 = Point.origin();
    p2.affiche();
    var distance = p1.distance(p2);
    print(distance);
}
