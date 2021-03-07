using System;
using System.Diagnostics;

namespace SoftSystemRandomNumbers
{
    class Program
    {
        static void Main(string[] args)
        {
            PercentOfPerfektNumbers percent = new PercentOfPerfektNumbers();
            Console.WriteLine(percent.Calculate());
            Console.ReadKey();
        }
    }
}
