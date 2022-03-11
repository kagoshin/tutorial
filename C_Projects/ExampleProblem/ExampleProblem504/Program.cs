using System;

namespace ExampleProblem504
{
    class Program
    {
        static void Main(string[] args)
        {
            Ship ship = new Ship();
            BattleShip battleShip = new BattleShip();

            ship.Sail();
            battleShip.Sail();
            battleShip.Fight();
        }
    }
}
