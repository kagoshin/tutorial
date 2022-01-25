using System;

namespace ExampleProblem305
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("九九の表示");
            for (int i = 1; i <= 9; i++)
            {
                for (int j = 1; j <= 9; j++)
                {
                    //Console.Write("{0} × {1} = {2} ", i, j, i*j);
                    Console.Write("{0}×{1}={2,2:d} ", i, j, i * j);
                }
                Console.WriteLine();
            }
        }
    }
}
