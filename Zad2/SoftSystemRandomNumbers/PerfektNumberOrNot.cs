namespace SoftSystemRandomNumbers
{
    public class PerfektNumberOrNot
    {
        public bool CheckNumber(long numberToCheck)
        {
            long  i, sum;
            sum = 0;
            //checks if a number is divisible, if is then add to variable
            for (i = 1; i < numberToCheck; i++) if (numberToCheck % i == 0)  sum += i;

            //if sum is equal to checked number 
            if (sum == numberToCheck) return true; 
            else return false;
        }
    }
}
