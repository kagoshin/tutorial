using System;

namespace Sample311
{
    class Program
    {
        static void Main(string[] args)
        {
            Random rnd = new Random();
            int[] n = new int[10];

            for (int i = 0; i < n.Length; i++)
            {
                int num = rnd.Next(1, 101);
                n[i] = num;
                Console.Write("{0} ", num);
            }
            Console.WriteLine();
            string[] names = { "偶数：", "奇数：" };
            for (int i = 0; i <= 1; i++)
            {
                Console.Write(names[i]);
                for (int j = 0; j < n.Length; j++)
                {
                    if (n[j] % 2 == i)
                    {
                        Console.Write("{0} ", n[j]);
                    }

                }
                Console.WriteLine();
            }
        }
    }
}
