using System;

namespace ExampleProblem403
{
    class Program
    {
        static void Main(string[] args)
        {
            
            Console.Write("ビンゴのマスの縦・横のサイズを入力：");
            int size = int.Parse(Console.ReadLine());
            Bingo card = new Bingo(size);
            card.Show();
        }
    }
}
