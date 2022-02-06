using System;

namespace Sample403
{
    class Program
    {
        static void Main(string[] args)
        {
            Person p1, p2;
            p1 = new Person();
            p2 = new Person();

            p1.Name = "山田太郎";
            p1.Age = 20;

            p2.setAgeAndName("佐藤花子", 21);

            p1.ShowAgeAndName();

            Console.WriteLine("名前：{0} 年齢：{1}", p2.Name, p2.Age);
        }
    }
}
