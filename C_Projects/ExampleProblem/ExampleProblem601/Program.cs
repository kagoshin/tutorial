using System;
using System.Collections.Generic;
using System.Linq;

namespace ExampleProblem601
{
    class Program
    {
        static void Main(string[] args)
        {
            List<int> arry = new List<int>();

            while (true)
            {
                Console.Write("正の整数を入力してください:");
                int number = int.Parse(Console.ReadLine());
                if (number > 0)
                {
                    arry.Add(number);
                }
                else
                {
                    break;
                }
            }

            foreach(int n in arry)
            {
                Console.Write("{0} ", n);
            }

            Console.WriteLine();
            Console.WriteLine("合計値：{0}", arry.Sum());
            Console.WriteLine("平均値：{0}", arry.Average());
            Console.WriteLine("最大値：{0}", arry.Max());
            Console.WriteLine("最小値：{0}", arry.Min());
        }
    }
}
