using System;

namespace Sample605
{
    delegate void Operation(int a, int b);

    class Calc
    {
        public void Sub(int a, int b)
        {
            Console.WriteLine("{0} - {1} = {2}", a, b, a - b);
        }
    }

    class Program
    {
        static void Add(int a, int b)
        {
            Console.WriteLine("{0} + {1} = {2}", a, b, a + b);
        }

        static void Main(string[] args)
        {
            Calc c = new Calc();

            Operation o1 = new Operation(Add);
            Operation o2 = new Operation(c.Sub);

            o1(2, 1);
            o2(2, 1);
        }
    }
}
