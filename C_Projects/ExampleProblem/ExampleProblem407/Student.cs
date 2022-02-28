using System;
namespace ExampleProblem407
{
    public class Student
    {
        private string name;
        private int grade;
        private int age;


        public Student(string name, int grade, int age)
        {
            SetInformation(name, grade, age);
        }

        public void SetInformation(string name, int grade, int age)
        {
            this.name = name;
            this.grade = grade;
            this.age = age;
        }

        public void ShowInformation()
        {
            Console.WriteLine("名前：{0} 学年：{1} 年齢：{2}", name, grade, age);
        }
    }
}
