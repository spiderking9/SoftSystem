using System;

namespace SoftSystemRushHour
{
    public class Show
    {
        private readonly string[] roomWhereActivitiesWillBe;
        private readonly int lastRoomOfActivities;

        public Show(string[] roomWhereActivitiesWillBe, int lastRoomOfActivities)
        {
            this.roomWhereActivitiesWillBe = roomWhereActivitiesWillBe;
            this.lastRoomOfActivities = lastRoomOfActivities;
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
            Console.WriteLine("We need " + lastRoomOfActivities + " classroom(s) to take care of activities");
        }
    }
}