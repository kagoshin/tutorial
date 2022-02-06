using System;
namespace ExampleProblem403
{
    public class Bingo
    {
        public int[,] data;

        public void Init(int size)
        {
            data = new int[size, size];

            for (int i = 0; i < data.GetLength(0); i++)
            {
                for (int j = 0; j < data.GetLength(1); j++)
                {
                    data[i, j] = 0;
                }
            }

            Random rnd = new Random();
            int num = 1;
            while (num <= size * size)
            {
                while (true)
                {
                    int m = rnd.Next(size);
                    int n = rnd.Next(size);
                    if (data[m, n] == 0)
                    {
                        data[m, n] = num;
                        num++;
                        break;
                    }
                }
            }
        }

        public void Show()
        {
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
