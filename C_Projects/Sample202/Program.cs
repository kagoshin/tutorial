using System;

namespace Sample202
{
    class Program
    {
        static void Main(string[] args)
        {
            int a;
            int b = 3;
            int add, sub;
            double avg;
            a = 6;
            add = a + b;
            sub = a - b;
            avg = (a + b) / 2.0;
            Console.WriteLine("{0} + {1} = {2}", a, b, add);
            Console.WriteLine("{0} - {1} = {2}", a, b, sub);
            Console.WriteLine("{0}と{1}の平均値{2}", a, b, avg);
        }
    }
}
