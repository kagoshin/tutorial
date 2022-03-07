using System;
using System.Collections.Generic;
using System.Text;

namespace ExampleProblem503
{
    class Bingo
    {
        private int[,] data;
        private int size;
        //  引数なしのコンストラクタ
        public Bingo() : this(5)
        {
        }
        //  引数ありのコンストラクタ
        public Bingo(int size)
        {
            Init(size);
        }
        private void Clear()
        {
            Array.Clear(data, 0, data.Length);
        }
        private void Shuffle()
        {
            //  乱数を設定する
            Random rnd = new Random();
            int num = 1;
            while (num <= size * size)
            {
                while (true)
                {
                    //  数値を置く場所を決める
                    int m = rnd.Next(size);
                    int n = rnd.Next(size);
                    //  その場所の値が0であれば、そこに数値を置く
                    if (data[m, n] == 0)
                    {
                        data[m, n] = num;
                        num++;
                        break;
                    }
                }
            }
        }
        //  カードの初期化
        public void Init(int size)
        {
            this.size = size;
            data = new int[size, size];
            Clear();
            Shuffle();
        }
        //  結果を表示する
        public void Show()
        {
            for (int i = 0; i < data.GetLength(0); i++)
            {
                //  数値を表示
                for (int j = 0; j < data.GetLength(1); j++)
                {
                    Console.Write("{0,2:d}|", data[i, j]);
                }
                Console.WriteLine();
                //  線を表示
                for (int j = 0; j < data.GetLength(1); j++)
                {
                    Console.Write("---");
                }
                Console.WriteLine();
            }
        }
    }
}
