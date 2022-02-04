using System;

namespace ExampleProblem310
{
    class Program
    {
        static void Main(string[] args)
        {
            const int SIZE = 5;
            int[,] data = new int[SIZE, SIZE];

            for(int i = 0; i < data.GetLength(0); i++)
            {
                for(int j = 0; j < data.GetLength(1); j++)
                {
                    data[i, j] = 0;
                }
            }

            Random rnd = new Random();
            int num = 1;
            while(num <= SIZE * SIZE)
            {
                while (true)
                {
                    int m = rnd.Next(SIZE);
                    int n = rnd.Next(SIZE);
                    if (data[m, n] == 0)
                    {
                        data[m, n] = num;
                        num++;
                        break;
                    }
                }
            }

            for (int i = 0; i < data.GetLength(0); i++)
            {
                for (int j = 0; j < data.GetLength(1); j++)
                {
                    Console.Write("{0, 2:d}|", data[i, j]);
                }
                Console.WriteLine();
                for (int j = 0; j < data.GetLength(1); j++)
                {
                    Console.Write("---");
                }
                Console.WriteLine();
            }
        }
    }
}
