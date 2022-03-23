using System;

namespace Sample608
{
    class Program
    {
        static int GetNum(int i)
        {
            int[] nums = { 300, 600, 900 };
            if (i > nums.Length)
            {
                throw new IndexOutOfRangeException();
            }
            return nums[i];
        }

        static void Main(string[] args)
        {
            try
            {
                int result = GetNum(4);
            }
            catch(IndexOutOfRangeException e)
            {
                Console.WriteLine("配列の範囲外にアクセスしました");
            }
        }
    }
}
