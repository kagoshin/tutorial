using System;

namespace ExampleProblem203
{
    class Program
    {
        static void Main(string[] args)
        {
            double num1, num2, avg;
            Console.Write("num1 = ");
            num1 = double.Parse(Console.ReadLine());
            Console.Write("num2 = ");
            num2 = double.Parse(Console.ReadLine());
            avg = (num1 + num2) / 2.0;
            Console.WriteLine("{0}と{1}の平均値：{2}", num1, num2, avg);
        }
    }
}
