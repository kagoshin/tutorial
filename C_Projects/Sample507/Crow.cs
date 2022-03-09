using System;
namespace Sample507
{
    public class Crow
    {
        private string name = "カラス";

        public void Sing()
        {
            Console.WriteLine("カーカー");
        }

        public string Name
        {
            get { return name; }
        }
    }
}
