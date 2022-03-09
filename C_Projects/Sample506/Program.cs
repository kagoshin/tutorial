using System;

namespace Sample506
{
    class Program
    {
        public void Foo()
        {
            Console.WriteLine("Foo");
        }

        static void Main(string[] args)
        {
            Program s = new Program();
            Console.WriteLine(s.ToString());
        }
    }
}
