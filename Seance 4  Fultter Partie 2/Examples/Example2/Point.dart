import 'dart:math' as math;

class Point{
    num x, y;

    //Constructor
    Point(this.x, this.y);

    //Constructor avec liste d'initialisation
    Point.origin():
        x = 0,
        y = 0;
    
    affiche(){
    print("[${x},${y}]");    
    }

    num distance(Point p) {
        var dx = x - p.x;
        var dy = y - p.y;
        return math.sqrt(dx * dx + dy * dy);
    }

    Point operator +(Point p) => Point(x + p.x, y + p.y);
}