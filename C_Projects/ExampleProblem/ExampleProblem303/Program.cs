using System;

namespace ExampleProblem303
{
    class Program
    {
        static void Main(string[] args)
        {
            Random rnd = new Random();
            //int dice = rnd.Next(0, 11);
            int dice = rnd.Next(11);

            Console.WriteLine(dice);
            Console.WriteLine("数あてゲーム");
            Console.WriteLine("0から10の数値を入力して下さい。");

            for (int i = 1; i <= 3; i++)
            {
                Console.Write("{0}回目：", i);
                int n = int.Parse(Console.ReadLine());

                if(dice == n)
                {
                    Console.WriteLine("正解です！");
                    break;
                }
                else if(dice < n)
                {
                    Console.WriteLine("大きすぎます");
                }
                else if (dice > n)
                {
                    Console.WriteLine("小さすぎます");
                }

                if (i == 3)
                {
                    Console.WriteLine("ゲームオーバー");
                    Console.WriteLine("正解は{0}です", dice);
                }
            }
        }
    }
}
