using System;

namespace Sample309
{
    class Program
    {
        static void Main(string[] args)
        {
            int[,] a = new int[3, 4];
            int m, n;

            for(m = 0; m < 3; m++)
            {
                for(n = 0; n < 4; n++)
                {
                    a[m, n] = m + n;
                }
            }

            for (m = 0; m < 3; m++)
            {
                for (n = 0; n < 4; n++)
                {
                    Console.Write("a[{0},{1}]={2} ", m, n, a[m, n]);
                }
                Console.WriteLine();
            }
        }
    }
}
