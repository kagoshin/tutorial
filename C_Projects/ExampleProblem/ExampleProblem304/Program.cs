using System;

namespace ExampleProblem304
{
    class Program
    {
        static void Main(string[] args)
        {
            Random rnd = new Random();

            int max = 0;
            int min = 0;

            for (int i = 0; i < 10; i++)
            {
                int dice = rnd.Next(1, 101);
                Console.Write("{0} ", dice);

                if (min == 0 && max == 0)
                {
                    min = dice;
                    max = dice;
                }
                if (dice < min)
                {
                    min = dice;
                }
                if (dice > max)
                {
                    max = dice;
                }
            }
            Console.WriteLine();
            Console.WriteLine("最大値：{0}", max);
            Console.WriteLine("最小値：{0}", min);
        }
    }
}
