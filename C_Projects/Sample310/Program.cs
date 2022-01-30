using System;

namespace Sample310
{
    class Program
    {
        static void Main(string[] args)
        {
            int[][] a = new int[][]
            {
                new int[]{ 0, 1 },
                new int[]{ 2 },
                new int[]{ 3, 4, 5, 6}
            };

            Console.WriteLine(a.Length);

            for (int m = 0; m < a.Length; m++)
            {
                for(int n = 0; n < a[m].Length; n++)
                {
                    Console.Write(a[m][n] + " ");
                }
                Console.WriteLine();
            }
        }
    }
}
