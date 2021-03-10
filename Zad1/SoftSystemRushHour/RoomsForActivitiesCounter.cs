using System;
using System.Collections.Generic;
using System.Linq;
using SoftSystemRushHour;

namespace SoftSystemRushHour
{
    public class RoomsForActivitiesCounter
    {
        private readonly List<ActivitiesHour> list;
        private readonly string[] roomWhereActivitiesWillBe;
        private int lastRoomOfActivities = 1;
        private int whenLastAcitivitieFinish = 0;


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

        public string[] RoomWhereActivitiesWillBe
        { 
            get => roomWhereActivitiesWillBe;
        }

        private void Counter()
        {
            var listWithFreeActivities = list.ToList().Where(x => x.Free == true);

            if (listWithFreeActivities.Any())
            {
                //if is any activitie which starts after the last assigned find one with min hour and add it to table
                if (listWithFreeActivities.Where(x => x.StartHour >= whenLastAcitivitieFinish).Any())
                {
                    AddActivitieToTable();
                    Counter();
                }
                //if not we add another classroom, reset hour variable and run again Conter
                else if(listWithFreeActivities.Any())
                {
                        lastRoomOfActivities++;
                        whenLastAcitivitieFinish = 0;

                        Counter();
                }
            }
        }
        private void AddActivitieToTable()
        {
            var activitieWithMinHourStart = ActivitieWithMinHourStart.Get(list, whenLastAcitivitieFinish);

            whenLastAcitivitieFinish = activitieWithMinHourStart.StopHour;
            roomWhereActivitiesWillBe[lastRoomOfActivities] += activitieWithMinHourStart.ActivitieId + ", ";
            activitieWithMinHourStart.Free = false;
        }
    }
}
