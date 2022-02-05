using System;
namespace ExampleProblem401
{
    public class Rectangle
    {
        public double width = 0;
        public double height = 0;

        public double GetArea()
        {
            return width * height;
        }

        public double GetPerimeter()
        {
            return 2 * (width + height);
        }
    }
}
