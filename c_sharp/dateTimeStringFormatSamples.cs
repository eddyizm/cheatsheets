/* Date time format samples C# */

// create date time 2008-03-09 16:05:07.123
DateTime dt = new DateTime(2008, 3, 9, 16, 5, 7, 123);

String.Format("{0:y yy yyy yyyy}", dt);  // "8 08 008 2008"   year
String.Format("{0:M MM MMM MMMM}", dt);  // "3 03 Mar March"  month
String.Format("{0:d dd ddd dddd}", dt);  // "9 09 Sun Sunday" day
String.Format("{0:h hh H HH}",     dt);  // "4 04 16 16"      hour 12/24
String.Format("{0:m mm}",          dt);  // "5 05"            minute
String.Format("{0:s ss}",          dt);  // "7 07"            second
String.Format("{0:f ff fff ffff}", dt);  // "1 12 123 1230"   sec.fraction
String.Format("{0:F FF FFF FFFF}", dt);  // "1 12 123 123"    without zeroes
String.Format("{0:t tt}",          dt);  // "P PM"            A.M. or P.M.
String.Format("{0:z zz zzz}",      dt);  // "-6 -06 -06:00"   time zone

// date separator in german culture is "." (so "/" changes to ".")
String.Format("{0:d/M/yyyy HH:mm:ss}", dt); // "9/3/2008 16:05:07" - english (en-US)
String.Format("{0:d/M/yyyy HH:mm:ss}", dt); // "9.3.2008 16:05:07" - german (de-DE)

// Specifier	DateTimeFormatInfo property	Pattern value (for en-US culture)
String.Format("{0:t}", dt);  // "4:05 PM"                         ShortTime
String.Format("{0:d}", dt);  // "3/9/2008"                        ShortDate
String.Format("{0:T}", dt);  // "4:05:07 PM"                      LongTime
String.Format("{0:D}", dt);  // "Sunday, March 09, 2008"          LongDate
String.Format("{0:f}", dt);  // "Sunday, March 09, 2008 4:05 PM"  LongDate+ShortTime
String.Format("{0:F}", dt);  // "Sunday, March 09, 2008 4:05:07 PM" FullDateTime
String.Format("{0:g}", dt);  // "3/9/2008 4:05 PM"                ShortDate+ShortTime
String.Format("{0:G}", dt);  // "3/9/2008 4:05:07 PM"             ShortDate+LongTime
String.Format("{0:m}", dt);  // "March 09"                        MonthDay
String.Format("{0:y}", dt);  // "March, 2008"                     YearMonth
String.Format("{0:r}", dt);  // "Sun, 09 Mar 2008 16:05:07 GMT"   RFC1123
String.Format("{0:s}", dt);  // "2008-03-09T16:05:07"             SortableDateTime
String.Format("{0:u}", dt);  // "2008-03-09 16:05:07Z"            UniversalSortableDateTime
