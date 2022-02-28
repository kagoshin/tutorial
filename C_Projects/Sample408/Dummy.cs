using System;
namespace Sample408
{
    public class Dummy
    {
        public Dummy()
        {
            Console.WriteLine("コンストラクタ");
        }

        ~Dummy()
        {
            Console.WriteLine("デストラクタ");
        }
    }
}
