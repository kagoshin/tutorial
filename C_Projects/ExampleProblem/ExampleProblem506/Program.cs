using System;

namespace ExampleProblem506
{
    class Program
    {
        static void DriveACar(IDrive car)
        {
            car.Drive();
        }

        static void MaintainAcar(IMechanical car)
        {
            car.Maintain();
        }

        static void Main(string[] args)
        {
            Car c = new Car();
            DriveACar(c);
            MaintainAcar(c);
        }
    }
}
