using System;
using System.Collections.Generic;

namespace SoftSystemRushHour
{
    class Program
    {
        static void Main(string[] args)
        {
            List<ActivitiesHour> list = new List<ActivitiesHour>()
            {
                new ActivitiesHour{ActivitieId=1, StartHour=8, StopHour=10},
                new ActivitiesHour{ActivitieId=2, StartHour=8, StopHour=11},
                new ActivitiesHour{ActivitieId=3, StartHour=3, StopHour=11},
                new ActivitiesHour{ActivitieId=4, StartHour=9, StopHour=11},
                new ActivitiesHour{ActivitieId=5, StartHour=12, StopHour=14},
                new ActivitiesHour{ActivitieId=6, StartHour=12, StopHour=13},
                new ActivitiesHour{ActivitieId=7, StartHour=4, StopHour=5},
                new ActivitiesHour{ActivitieId=8, StartHour=8, StopHour=11},
                new ActivitiesHour{ActivitieId=9, StartHour=12, StopHour=13},
                new ActivitiesHour{ActivitieId=10, StartHour=23, StopHour=24},
                new ActivitiesHour{ActivitieId=11, StartHour=3, StopHour=13},
                new ActivitiesHour{ActivitieId=12, StartHour=11, StopHour=13},
                new ActivitiesHour{ActivitieId=13, StartHour=8, StopHour=11},
                new ActivitiesHour{ActivitieId=14, StartHour=12, StopHour=13}
            };


            RoomsForActivitiesCounter days = new RoomsForActivitiesCounter(list);
            Show show = new Show(days.RoomWhereActivitiesWillBe, days.LastRoomOfActivities);
            show.ShowRoomsWhereActivitiesWillBe();
            show.ShowHowManyRoomsYouNeedForActivities();
            Console.ReadKey();
        }
    }
}
