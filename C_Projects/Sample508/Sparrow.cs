using System;
namespace Sample508
{
    class Sparrow : Bird
    {
        public Sparrow() : base("すずめ")
        {
        }

        public override void Sing()
        {
            Console.WriteLine("チュンチュン");
        }
    }
}
