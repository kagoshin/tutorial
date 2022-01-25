using System;

namespace Sample306
{
    class Program
    {
        static void Main(string[] args)
        {
            double[] d = new double[3];
            d[0] = 1.2;
            d[1] = 3.7;
            d[2] = 4.1;
            double sum, avg;
            sum = 0.0;
            for (int i = 0; i < d.Length; i++)
            {
                Console.Write(d[i] + " ");
                sum += d[i];
            }
            Console.WriteLine();
            avg = sum / d.Length;
            Console.WriteLine("合計値：" + sum);
            Console.WriteLine("平均値：" + avg);
        }
    }
}
