using System;
namespace Sample504
{
    public class Sub : Super
    {
        public Sub()
        {
            Console.WriteLine("Subクラスのコンストラクタ（引数なし）");
        }

        public Sub(int param) : base(param)
        {
            Console.WriteLine("Subクラスのコンストラクタ（引数：param = {0}）", param);
        }

        ~Sub()
        {
            Console.WriteLine("Subクラスのデストラクタ");
        }
    }
}
