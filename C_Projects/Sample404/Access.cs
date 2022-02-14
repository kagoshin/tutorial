using System;
namespace Sample404
{
    public class Access
    {
        private int data1 = 5;
        private int data2 = 0;

        public void ShowDatas()
        {
            Console.WriteLine("data1={0} data2={1}", data1, data2);
        }

        public int Data1
        {
            get { return data1; }
        }

        public int Data2
        {
            set { data2 = value; }
        }
    }
}
