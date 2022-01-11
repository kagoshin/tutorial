using System;

namespace Sample212
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("さいころの目(1～6):");
            int dice = int.Parse(Console.ReadLine());
            switch (dice)
            {
                case 1:
                case 3:
                case 5:
                    Console.WriteLine("半（ハン）です。");
                    break;
                case 2:
                case 4:
                case 6:
                     Console.WriteLine("丁（チョウ）です。");
                    break;
                default:
                    Console.WriteLine("不適切な値です。");
                    break;

            }
        }
    }
}
