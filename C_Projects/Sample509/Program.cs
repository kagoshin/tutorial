using System;

namespace Sample509
{
    class Program
    {
        static void Main(string[] args)
        {
            Vector v = new Vector();
            v.X = 0.1;
            v.Y = 0.2;
            Console.WriteLine("v = ({0}, {1})", v.X, v.Y);
        }
    }
}
