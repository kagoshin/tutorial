using System;

namespace ExampleProblem404
{
    class Program
    {
        static void Main(string[] args)
        {
            Rectangle r = new Rectangle();

            Console.Write("幅(cm)：");
            r.Width = double.Parse(Console.ReadLine());

            Console.Write("高さ(cm)：");
            r.Height = double.Parse(Console.ReadLine());

            Console.WriteLine("面積：{0}cm2", r.GetArea());
            Console.WriteLine("周の長さ：{0}cm", r.GetPerimeter());
        }
    }
}
