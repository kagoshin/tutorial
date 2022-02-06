using System;

namespace ExampleProblem403
{
    class Program
    {
        static void Main(string[] args)
        {
            Bingo card = new Bingo();
            Console.Write("ビンゴのマスの縦・横のサイズを入力：");
            int size = int.Parse(Console.ReadLine());
            card.Init(size);
            card.Show();
        }
    }
}
