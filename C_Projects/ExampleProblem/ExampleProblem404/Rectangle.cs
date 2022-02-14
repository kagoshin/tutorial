using System;
namespace ExampleProblem404
{
    public class Rectangle
    {
        private double width = 0;
        private double height = 0;

        public double GetArea()
        {
            return width * height;
        }

        public double GetPerimeter()
        {
            return 2 * (width + height);
        }

        public double Width
        {
            set { width = value; }
            get { return width; }
        }

        public double Height
        {
            set { height = value; }
            get { return height; }
        }
    }
}
