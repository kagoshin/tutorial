using System;
namespace Sample403
{
    public class Person
    {
        private string name = "";
        private int age = 0;

        public void setAgeAndName(string name, int age)
        {
            this.name = name;
            this.age = age;
        }

        public void ShowAgeAndName()
        {
            Console.WriteLine("名前：{0} 年齢：{1}", name, age);
        }

        public string Name
        {
            set { name = value;  }
            get { return name; }
        }

        public int Age
        {
            set { age = value; }
            get { return age; }
        }
    }
}
