using System;
namespace ExampleProblem505
{
    class Mice : Mammals
    {
        public Mice()
        {
            this.name = "ネズミ";
        }

        public override void Bark()
        {
            Console.WriteLine("チューチュー");
        }
    }
}
