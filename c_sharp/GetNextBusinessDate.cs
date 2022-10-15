using Nager.Date; 
		///<summary>
        /// Adds business days to a date
        /// </summary>
        /// <param name="dateTime">
        /// <returns></returns>
        public static DateTime GetNextBusinessDate(this DateTime dateTime)
        {
            //TODO need to add holidays
            int counter = 1;
            DateTime resultDate = dateTime;
            while (counter > 0)
            {
                resultDate = resultDate.AddDays(1);
                if (resultDate.DayOfWeek != DayOfWeek.Saturday &&
                    resultDate.DayOfWeek != DayOfWeek.Sunday)
					DateSystem.IsPublicHoliday(resultDate, CountryCode.US)) // nuget package to find holidays
                    counter--;
            }
            return resultDate;
        }