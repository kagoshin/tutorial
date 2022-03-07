using System;
namespace Sample503
{
    public class Calculator
    {
        protected int num1;
        protected int num2;

        public int Num1
        {
            set { num1 = value; }
            get { return num1; }
        }

        public int Num2
        {
            set { num2 = value; }
            get { return num2; }
        }

        public void Add()
        {
            Console.WriteLine("{0} + {1} = {2}", num1, num2, num1 + num2);
        }

        public void Sub()
        {
            Console.WriteLine("{0} - {1} = {2}", num1, num2, num1 - num2);
        }
    }
}
