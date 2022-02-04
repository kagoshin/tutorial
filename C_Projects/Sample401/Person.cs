using System;
namespace Sample401
{
    public class Person
    {
        public string name = "";
        public int age = 0;

        public void ShowAgeAndName()
        {
            Console.WriteLine("名前：{0} 年齢：{1}", name, age);
        }

        public void SetAgeAndName(string name, int age)
        {
            this.name = name;
            this.age = age;
        }
    }
}
