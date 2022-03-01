using System;
namespace ExampleProblem408
{
    public class Hoo
    {
        public Hoo()
        {
            Console.WriteLine("Hooクラスのインスタンスが生成されました");
        }

        public void Foo()
        {
            Console.WriteLine("fooメソッドが実行されました");
        }

        ~Hoo()
        {
            Console.WriteLine("Hooクラスのインスタンスが消去されました"); 
        }
    }
}
