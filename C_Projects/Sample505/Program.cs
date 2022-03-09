using System;

namespace Sample505
{
    class Program
    {
        static void Main(string[] args)
        {
            Parent p = new Parent();
            Child c = new Child();
            p.Foo();
            c.Foo();
        }
    }
}
