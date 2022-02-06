using System;

namespace ExampleProblem402
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("英文を入力してください：");
            string str = Console.ReadLine();

            Console.WriteLine("大文字：{0}", str.ToUpper());
            Console.WriteLine("小文字：{0}", str.ToLower());
        }
    }
}
