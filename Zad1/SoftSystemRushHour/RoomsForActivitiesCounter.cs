using System;
using System.Collections.Generic;
using System.Linq;

namespace SoftSystemRushHour
{
    public class RoomsForActivitiesCounter
    {
        private List<ActivitiesHour> list;
        private int lastRoomOfActivities = 1;
        private int whenLastAcitivitieFinish = 0;
        private string[] roomWhereActivitiesWillBe;


        public RoomsForActivitiesCounter(List<ActivitiesHour> list)
        {
            this.list = list;
            roomWhereActivitiesWillBe = new string[list.Count+1];
            Counter();
        }

        public int LastRoomOfActivities 
        {
            get => lastRoomOfActivities;
        }


        void Counter()
        {
            if (list.ToList().Where(x => x.Free == true).Any())
            {
                if (list.ToList().Where(x => x.Free == true && x.StartHour >= whenLastAcitivitieFinish).Any())
                {
                    var activitieWithMinHourStart = list.ToList().Where(x => x.Free == true && x.StartHour >= whenLastAcitivitieFinish).Aggregate((curMin, x) => (curMin == null || x.StartHour < curMin.StartHour ? x : curMin));
                    whenLastAcitivitieFinish = activitieWithMinHourStart.StopHour;
                    roomWhereActivitiesWillBe[lastRoomOfActivities] += activitieWithMinHourStart.ActivitieId + ", ";
                    activitieWithMinHourStart.Free = false;
                    Counter();
                }
                else
                {
                    if (list.ToList().Where(x => x.Free == true).Any())
                    {
                        lastRoomOfActivities++;
                        whenLastAcitivitieFinish = 0;
                        Counter();
                    }
                }
            }
        }

        public void ShowRoomsWhereActivitiesWillBe()
        {
            for (int i = 1; i < roomWhereActivitiesWillBe.Length; i++)
            {
                if (string.IsNullOrEmpty(roomWhereActivitiesWillBe[i])) return;
                Console.WriteLine($"Activities in classroom {i}: { roomWhereActivitiesWillBe[i]}");
            }
        }

        public void ShowHowManyRoomsYouNeedForActivities()
        {
            Console.WriteLine("We need "+lastRoomOfActivities+ " classroom(s) to take care of activities");
        }
    }
}
