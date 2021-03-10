using System.Collections.Generic;
using System.Linq;

namespace SoftSystemRushHour
{
    public static class GetActivitieWithMinHourStart
    {
        public static ActivitiesHour Get(List<ActivitiesHour> list, int whenLastAcitivitieFinish)
        {
            return list.ToList()
                .Where(x => x.Free == true && x.StartHour >= whenLastAcitivitieFinish)
                .Aggregate((curMin, x) => curMin == null || x.StartHour < curMin.StartHour ? x : curMin);
        }
    }
}