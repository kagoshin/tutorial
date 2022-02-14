using System;

namespace Sample404
{
    class Program
    {
        static void Main(string[] args)
        {
            Access a = new Access();
            //a.Data1 = 1;
            a.Data2 = 2;
            a.ShowDatas();
            Console.WriteLine("a.data1 = {0}", a.Data1);
            //Console.WriteLine("a.data2 = {0}", a.Data2);
        }
    }
}
