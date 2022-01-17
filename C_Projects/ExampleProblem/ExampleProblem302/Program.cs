using System;

namespace ExampleProblem302
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("正の整数を入力：");
            int n = int.Parse(Console.ReadLine());

            if (n > 0)
            {
                for (int i = 1; i <= n; i++)
                {
                    if (n % i == 0)
                    {
                        Console.Write(i + "　");
                    }
                }
                Console.WriteLine();
            }
        }
    }
}
