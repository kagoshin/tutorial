using System;
namespace Sample504
{
    public class Super
    {
        private int param = 0;

        public Super()
        {
            Console.WriteLine("Superクラスのコンストラクタ（引数なし）");
        }

        public Super(int param)
        {
            Console.WriteLine("Superクラスのコンストラクタ（引数：param = {0}）", param);
            this.param = param;
        }

        ~Super()
        {
            Console.WriteLine("Superクラスのデストラクタ");
        }

        public void showParam()
        {
            Console.WriteLine("param = {0}", param);
        }
    }
}
