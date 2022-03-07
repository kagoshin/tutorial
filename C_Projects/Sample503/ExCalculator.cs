using System;
namespace Sample503
{
    public class ExCalculator : Calculator
    {
        public void Mul()
        {
            Console.WriteLine("{0} * {1} = {2}", num1, num2, num1 * num2);
        }

        public void Div()
        {
            Console.WriteLine("{0} / {1} = {2}", num1, num2, num1 / num2);
        }

    }
}
