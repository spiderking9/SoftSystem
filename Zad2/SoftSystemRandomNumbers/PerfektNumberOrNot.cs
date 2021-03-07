namespace SoftSystemRandomNumbers
{
    public class PerfektNumberOrNot
    {
        public bool CheckNumber(long n)
        {
            long  i, sum;
            sum = 0;

            for (i = 1; i < n; i++) if (n % i == 0)  sum += i;

            if (sum == n) return true; 
            else return false;
        }
    }
}
