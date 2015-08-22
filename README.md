NSDate+Calendar 0.0.7
===

This is the set of categories on [NSDate](https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSDate_Class/Reference/Reference.html) that allow access to date components such as *year, month, week of year, week of month, weekday, day, hour, minute, second* in local time zone and many more.

[![Build Status](https://travis-ci.org/belkevich/nsdate-calendar.png?branch=master)](https://travis-ci.org/belkevich/nsdate-calendar)

---

#### Install
Add to [Podfile](http://cocoapods.org/) `pod 'NSDate+Calendar'`

#### Using

###### Access to date componentes

```objective-c
NSDate *date = ...                          // 01-08-2013 13:04:35
NSInteger year = date.year;                 // 2013
NSInteger month = date.month;               // 8
NSInteger day = date.day;                   // 1
NSInteger weekOfYear = date.weekOfYear;     // 31
NSInteger weekOfMonth = date.weekOfMonth;   // 1
NSInteger weekday = date.weekday;           // 5
NSInteger hour = date.hour;                 // 13
NSInteger minute = date.minute;             // 4
NSInteger second = date.second;             // 35
NSUInteger daysInMonth = date.daysInMonth;  // 31
NSUInteger dayInYear = date.dayInYear;      // 213
NSUInteger hourInYear = date.hourInYear     // 5102
```

###### Create date from date components

```objective-c
// 21-09-2013 00:00:00
NSDate *dateWithDate = [NSDate dateWithYear:2013 month:9 day:21];
// 21-09-2013 17:51:23
NSDate *dateWithDateAndTime = [NSDate dateWithYear:2013 month:9 day:21
                                              hour:17 minute:51 second:23];
```

###### Date with changed time

```objective-c
NSDate *date = ...        // 21-09-2013 17:53:08
// 21-09-2013 08:53:08
NSDate *dateChangedHour = [date dateBySettingHour:8];
// 21-09-2013 17:12:08
NSDate *dateChangedMinute = [date dateBySettingMinute:12];
// 21-09-2013 17:53:59
NSDate *dateChangedSecond = [date dateBySettingSecond:59];
// 21-09-2013 15:15:15
NSDate *dateChangedTime = [date dateBySettingHour:15 minute:15 seconds:15];

// 21-09-2013 23:53:08
NSDate *dateAddedHour = [date dateByAddingHour:6];
// 21-09-2013 18:03:08
NSDate *dateAddedMinute = [date dateByAddingMinute:10];
// 21-09-2013 17:55:00
NSDate *dateAddedSecond = [date dateByAddingSecond:112];
// 21-09-2013 18:54:09
NSDate *dateAddedTime = [date dateByAddingHour:1 minute:1 second:1];
```

###### Date with changed date

```objective-c
NSDate *date = ...      // 21-09-2013 18:00:12
// 21-09-2000 18:00:12
NSDate *dateChangedYear = [date dateBySettingYear:2010];
// 21-03-2013 18:00:12
NSDate *dateChangedMonth = [date dateBySettingMonth:3];
// 15-09-2013 18:00:12
NSDate *dateChangedDay = [date dateBySettingDay:15];

// 21-09-2014 18:00:12
NSDate *dateAddedYear = [date dateByAddingYear:1];
// 21-01-2014 18:00:12
NSDate *dateAddedMonth = [date dateByAddingMonth:4];
// 26-09-2013 18:00:12
NSDate *dateAddedDay = [date dateByAddingDay:5];
```

###### Date with changed week

**Sunday is a weekday number 1. Regardless your local calendar**

```objective-c
NSDate *date = ...    // 01-08-2013 13:04:35 (Thursday)
// 28-07-2013 13:04:35 (Sunday)
NSDate *dateChangedWeekday = [date dateBySettingWeekday:1];
// 15-08-2013 13:04:35 (Thursday)
NSDate *dateChangedWeekOfMonth = [date dateBySettingWeekOfMonth:3];
// 10-01-2013 13:04:35 (Thursday)
NSDate *dateChangedWeekOfYear = [date dateBySettingWeekOfYear:2];

// 08-08-2013 13:04:35 (Thursday)
NSDate *dateAddWeek = [date dateByAddingWeek:1];
```

###### Day routine

```objective-c
NSDate *date = ...    // 19-09-2013 06:24:00
// 19-09-2013 00:00:00
NSDate *dateToday = [date dateToday];
// 18-09-2013 00:00:00
NSDate *dateYesterday = [date dateYesterday];
// 20-09-2013 00:00:00
NSDate *dateTomorrow = [date dateTomorrow];
```

###### Week routine

**[First day of the week](https://developer.apple.com/library/mac/documentation/cocoa/reference/foundation/classes/NSCalendar_Class/Reference/NSCalendar.html#//apple_ref/occ/instm/NSCalendar/firstWeekday) is value of your [local calendar](https://developer.apple.com/library/mac/documentation/cocoa/reference/foundation/classes/NSCalendar_Class/Reference/NSCalendar.html#//apple_ref/occ/clm/NSCalendar/currentCalendar) and can't be changed**

```objective-c
NSDate *date = ...    // 01-08-2013 13:04:35 (Thursday)
// 28-07-2013 00:00:00 (Sunday)
NSDate *dateWeekStart = [date dateWeekStart];
// 03-08-2013 00:00:00 (Saturday)
NSDate *dateWeekEnd = [date dateWeekEnd];
// 25-07-2013 13:04:35 (Thursday)
NSDate *dateWeekAgo = [date dateWeekAgo];
// 08-08-2013 13:04:35 (Thursday)
NSDate *dateWeekAhead = [date dateWeekAhead];
```

###### Month routine

```objective-c
NSDate *date = ...    // 19-09-2013 14:23:07
// 01-09-2013 00:00:00
NSDate *dateMonthStart = [date dateMonthStart];
// 30-09-2013 00:00:00
NSDate *dateMonthEnd = [date dateMonthEnd];
// 19-08-2013 14:23:07
NSDate *dateMonthAgo = [date dateMonthAgo];
// 19-10-2013 14:23:07
NSDate *dateMonthAhead = [date dateMonthAhead];
```

###### Year routine

```objective-c
NSDate *date = ...    // 19-09-2013 05:12:34
// 01-01-2013 00:00:00
NSDate *dateYearStart = [date dateYearStart];
// 31-12-2013 00:00:00
NSDate *dateYearEnd = [date dateYearEnd];
// 19-09-2012 05:12:34
NSDate *dateYearAgo = [date dateYearAgo];
// 19-09-2014 05:12:34
NSDate *dateYearAhead = [date dateYearAhead];
```

###### Date compare

```objective-c
NSDate *date1 = ...   // 13-05-2013 07:12:49
NSDate *date2 = ...   // 13-05-2013 09:56:12
BOOL isEqualDay = [date1 isEqualToDay:date2];                 // YES
BOOL isEqualTime = [date1 isEqualToTime:date2];               // NO
BOOL isLessDate = [date1 isLessDate:date2];                   // YES
BOOL isGreaterDate = [date1 isGreaterDate:date2];             // NO
BOOL isLessOrEqual = [date1 isLessOrEqualToDate:date2];       // YES
BOOL isGreaterOrEqual = [date1 isGreaterOrEqualToDate:date2]; // NO
```

#### History

[Releases](https://github.com/belkevich/nsdate-calendar/releases)

#### Updates

Follow updates on twitter [@okolodev](https://twitter.com/okolodev)
