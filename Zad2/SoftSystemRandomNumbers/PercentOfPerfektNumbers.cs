namespace SoftSystemRandomNumbers
{
    public class PercentOfPerfektNumbers
    {
        private MyRandom myRandom;
        private PerfektNumberOrNot perfekt;
        private float howManyTimesPerfektNumber=0;


        public string Calculate(float numberOfTimesToRoll=10000, int maxValue=2800)
        {
            perfekt = new PerfektNumberOrNot();
            for (int i = 0; i < numberOfTimesToRoll; i++)
            {
                myRandom = new MyRandom();
                long www = myRandom.GenerateNumber(maxValue);
                howManyTimesPerfektNumber += perfekt.CheckNumber(www) ? 1 : 0;
            }
            float xxx = howManyTimesPerfektNumber/ numberOfTimesToRoll;

            return $"Procent {xxx:0.00%}";
        }
    }
}
