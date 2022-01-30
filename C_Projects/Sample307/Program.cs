using System;

namespace Sample307
{
    class Program
    {
        static void Main(string[] args)
        {
            int[] n = { 5, 4, 3, 2, 1 };
            string[] s = { "ABC", "DEF", "GHI" };

            int i;
            for(i = 0; i < n.Length; i++)
            {
                Console.Write(n[i] + " ");
            }
            Console.WriteLine();
            for (i = 0; i < s.Length; i++)
            {
                Console.Write(s[i] + " ");
            }
            Console.WriteLine();
        }
    }
}
