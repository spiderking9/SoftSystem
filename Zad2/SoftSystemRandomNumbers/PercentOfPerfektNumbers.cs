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
            myRandom = new MyRandom();

            //Checks x times if the random number is perfect, if is then add it to the variable
            for (int i = 0; i < numberOfTimesToRoll; i++) howManyTimesPerfektNumber += perfekt.CheckNumber(myRandom.GenerateNumber(maxValue)) ? 1 : 0;

            return $"Procent {howManyTimesPerfektNumber / numberOfTimesToRoll:0.00%}";
        }
    }
}
