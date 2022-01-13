using System;

namespace Sample302
{
    class Program
    {
        static void Main(string[] args)
        {
            for(int i = 1; i <= 2; i++)
            {
                for(int j = 1; j <= 3; j++)
                {
                    int k = i + j;
                    Console.Write(i + "+" + j + "=" + k + " ");
                }
            }
        }
    }
}
