using SoftSystemRandomNumbers;
using System;
using Xunit;

namespace RandomNumbers.Tests
{
    public class MyRandomTest
    {
        [Fact]
        public void Next3GeneretedNumberFrom1000_NotTheSame()
        {
            MyRandom random = new MyRandom();
            var first = random.GenerateNumber(1000);
            var second = random.GenerateNumber(1000);
            var third = random.GenerateNumber(1000);

            Assert.NotEqual(first, second);
            Assert.NotEqual(first, third);
        }
    }
}
