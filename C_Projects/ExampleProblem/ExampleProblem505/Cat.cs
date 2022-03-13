using System;
namespace ExampleProblem505
{
    class Cat : Mammals
    {
        public Cat()
        {
            this.name = "猫";
        }

        public override void Bark()
        {
            Console.WriteLine("ニャーニャー");
        }
    }
}
