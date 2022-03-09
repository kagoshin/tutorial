using System;
namespace Sample507
{
    public class Sparrow
    {
        private string name = "すずめ";

        public void Sing()
        {
            Console.WriteLine("チュンチュン");
        }

        public string Name
        {
            get { return name; }
        }
    }
}
