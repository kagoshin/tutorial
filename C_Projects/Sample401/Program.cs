﻿using System;

namespace Sample401
{
    class Program
    {
        static void Main(string[] args)
        {
            Person p1, p2;
            p1 = new Person();
            p2 = new Person();

            p1.name = "山田太郎";
            p1.age = 19;

            p2.SetAgeAndName("佐藤花子", 23);

            p1.ShowAgeAndName();
            p2.ShowAgeAndName();
        }
    }
}
