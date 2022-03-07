using System;

namespace ExampleProblem501
{
    class Program
    {
        static double Add(double a, double b)
        {
            return a + b;
        }

        static double Sub(double a, double b)
        {
            return a - b;
        }

        static double Mul(double a, double b)
        {
            return a * b;
        }

        static double Div(double a, double b)
        {
            return a / b;
        }

        static void Main(string[] args)
        {
            Console.Write("a=");
            double a = double.Parse(Console.ReadLine());
            Console.Write("b=");
            double b = double.Parse(Console.ReadLine());
            Console.WriteLine("a + b = " + Add(a, b));
            Console.WriteLine("a - b = " + Sub(a, b));
            Console.WriteLine("a * b = " + Mul(a, b));
            Console.WriteLine("a / b = " + Div(a, b));
        }
    }
}
