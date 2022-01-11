using System;

namespace ExampleProblem205
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("文字列を入力：");
            string str = Console.ReadLine();

            //if (str.Equals("Hello"))
            if (str.Equals("Hello", StringComparison.OrdinalIgnoreCase))
            {
                Console.WriteLine("Helloが入力されました。");
            }
            else
            {
                Console.WriteLine("Helloと入力してください。");
            }
        }
    }
}
