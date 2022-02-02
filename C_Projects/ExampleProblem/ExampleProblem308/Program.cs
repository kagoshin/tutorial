using System;

namespace ExampleProblem308
{
    class Program
    {
        static void Main(string[] args)
        {
            Random rnd = new Random();
            int[] start = new int[10];

            for (int i = 0; i < start.Length; i++)
            {
                start[i] = rnd.Next(1, 101);
                Console.Write("{0} ", start[i]);
            }
            Console.WriteLine();

            for (int i = 0; i < start.Length; i++)
            {
                int max = 0;
                int pos = 0;
                for (int j = 0; j < start.Length; j++)
                {
                    if (max < start[j]){
                        max = start[j];
                        pos = j;
                    }
                }
                Console.Write("{0} ", max);
                start[pos] = 0;
            }
            Console.WriteLine();
        }
    }
}
