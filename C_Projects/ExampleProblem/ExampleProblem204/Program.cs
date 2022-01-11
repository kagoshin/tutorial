using System;

namespace ExampleProblem204_1
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("月（1〜12）を入力してください。");
            int month = int.Parse(Console.ReadLine());

            if (1 <= month && month <= 12)
            {
                if (month == 2)
                {
                    Console.WriteLine("{0}月の長さは28か29日です。", month);
                }
                else if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12)
                {
                    Console.WriteLine("{0}月の長さは31日です。", month);
                }
                else
                {
                    Console.WriteLine("{0}月の長さは30日です。", month);
                }
            }
            else
            {
                Console.WriteLine("適切な値を入力してください。");
            }
        }
    }
}
