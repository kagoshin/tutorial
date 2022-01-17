using System;

namespace ExampleProblem301_3
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("★の数を入力：");
            int n = int.Parse(Console.ReadLine());

            if(n > 0)
            {
                int i = 0;
                do
                {
                    Console.Write("★");
                    i++;
                }
                while (i < n);
                Console.WriteLine();
            }
        }
    }
}
