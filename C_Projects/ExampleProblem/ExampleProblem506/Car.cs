using System;
namespace ExampleProblem506
{
    class Car : IDrive, IMechanical
    {
        public void Drive()
        {
            Console.WriteLine("運転する");
        }

        public void Maintain()
        {
            Console.WriteLine("メンテナンスする");
        }
    }
}
