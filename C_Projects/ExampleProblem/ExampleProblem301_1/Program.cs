using System;

namespace ExampleProblem301_1
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("★の数を入力：");
            int n = int.Parse(Console.ReadLine());
            for(int i = 0; i < n; i++)
            {
                Console.Write("★");
            }
            Console.WriteLine();
        }
    }
}
