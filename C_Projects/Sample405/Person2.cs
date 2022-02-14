using System;
namespace Sample405
{
    public class Person2
    {
        public void SetAgeAndName(string name, int age)
        {
            Name = name;
            Age = age;
        }

        public void ShowAgeAndName()
        {
            Console.WriteLine("名前:{0} 年齢:{1}", Name, Age);
        }

        public string Name
        {
            private set; get;
        }

        public int Age
        {
            set; get;
        }
    }
}
