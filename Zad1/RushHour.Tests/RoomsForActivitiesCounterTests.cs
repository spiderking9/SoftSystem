using SoftSystemRushHour;
using System;
using System.Collections.Generic;
using Xunit;

namespace RushHour.Tests
{
    public class RoomsForActivitiesCounterTests
    {
        [Fact]
        public void LotsActivities()
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
            RoomsForActivitiesCounter rooms = new RoomsForActivitiesCounter(list);

            Assert.Equal(7, rooms.LastRoomOfActivities);
        }

        [Fact]
        public void CheckIfShow1WhenOnlyOneActivitie()
        {
            List<ActivitiesHour> list = new List<ActivitiesHour>()
            {
                new ActivitiesHour{ActivitieId=1, StartHour=8, StopHour=10},
            };
            RoomsForActivitiesCounter rooms = new RoomsForActivitiesCounter(list);

            Assert.Equal(1, rooms.LastRoomOfActivities);
        }
        [Fact]
        public void SameHoursOf3Act()
        {
            List<ActivitiesHour> list = new List<ActivitiesHour>()
            {
                new ActivitiesHour{ActivitieId=1, StartHour=3, StopHour=23},                
                new ActivitiesHour{ActivitieId=2, StartHour=3, StopHour=23},
                new ActivitiesHour{ActivitieId=3, StartHour=3, StopHour=23},
            };
            RoomsForActivitiesCounter rooms = new RoomsForActivitiesCounter(list);

            Assert.Equal(3, rooms.LastRoomOfActivities);
        }

        [Fact]
        public void ActivHourByHourSinceMidnight()
        {
            List<ActivitiesHour> list = new List<ActivitiesHour>()
            {
                new ActivitiesHour{ActivitieId=1, StartHour=0, StopHour=3},
                new ActivitiesHour{ActivitieId=2, StartHour=3, StopHour=4},
                new ActivitiesHour{ActivitieId=3, StartHour=22, StopHour=24},
                new ActivitiesHour{ActivitieId=4, StartHour=4, StopHour=11},
                new ActivitiesHour{ActivitieId=5, StartHour=11, StopHour=15},
                new ActivitiesHour{ActivitieId=6, StartHour=15, StopHour=22},
            };
            RoomsForActivitiesCounter rooms = new RoomsForActivitiesCounter(list);

            Assert.Equal(1, rooms.LastRoomOfActivities);
        }
    }
}
