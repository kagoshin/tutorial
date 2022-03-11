using System;
namespace Sample511
{
    class Dummy : IFuncs1, IFuncs2
    {
        public void Func1()
        {
            Console.WriteLine("Func1");
        }

        public void Func2()
        {
            Console.WriteLine("Func2");
        }

        public void Func3()
        {
            Console.WriteLine("Func3");
        }
    }
}
