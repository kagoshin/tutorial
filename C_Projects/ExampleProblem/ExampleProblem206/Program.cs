using System;

namespace ExampleProblem206
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("H2Oの温度：");
            double tp = double.Parse(Console.ReadLine());

            if (tp >= 100.0)
            {
                Console.WriteLine("気体");
            }
            else if (0.0 < tp && tp < 100.0)
            {
                Console.WriteLine("液体");
            }
            else
            {
                Console.WriteLine("固体");
            }
        }
    }
}
