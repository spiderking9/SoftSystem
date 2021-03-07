using SoftSystemRandomNumbers;
using System;
using Xunit;

namespace RandomNumbers.Tests
{
    public class PerfektNumberOrNotTest
    {
        [Fact]
        public void PerfektNumberHaveToBeTrue()
        {
            PerfektNumberOrNot perfekt = new PerfektNumberOrNot();

            Assert.True(perfekt.CheckNumber(6));
            Assert.True(perfekt.CheckNumber(28));
            Assert.True(perfekt.CheckNumber(496));
            Assert.True(perfekt.CheckNumber(8128));
        }

        [Fact]
        public void NotPerfektNumberHaveToBeFalse()
        {
            PerfektNumberOrNot perfekt = new PerfektNumberOrNot();

            Assert.False(perfekt.CheckNumber(1));
            Assert.False(perfekt.CheckNumber(2));
            Assert.False(perfekt.CheckNumber(23123));
            Assert.False(perfekt.CheckNumber(3333));
            Assert.False(perfekt.CheckNumber(66));
        }
    }
}
