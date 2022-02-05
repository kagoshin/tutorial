using System;

namespace ExampleProblem401
{
    class Program
    {
        static void Main(string[] args)
        {
            Rectangle r = new Rectangle();

            Console.Write("幅(cm)：");
            r.width = double.Parse(Console.ReadLine());

            Console.Write("高さ(cm)：");
            r.height = double.Parse(Console.ReadLine());

            Console.WriteLine("面積：{0}cm2", r.GetArea());
            Console.WriteLine("周の長さ：{0}cm", r.GetPerimeter());
        }
    }
}
