using System;

namespace Sample405
{
    class Program
    {
        static void Main(string[] args)
        {
            Person2 p = new Person2();
            p.SetAgeAndName("山田太郎", 26);
            p.Age = 32;
            //p.Name = "aaa";
            Console.WriteLine("名前:{0} 年齢:{1}", p.Name, p.Age);
        }
    }
}
