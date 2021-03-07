using System;

namespace SoftSystemRandomNumbers
{
    public class MyRandom
    {
        static long a = 1;
        public long GenerateNumber(int maxValue)
        {
            a = ((a * 214013L + 2531011L) >> DateTime.Now.Millisecond%16) & 32767;
            return (a % maxValue) + 1;
        }
    }
}
