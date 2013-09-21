NSDate+Calendar
===

#### About
This is the set of categories on [NSDate](https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSDate_Class/Reference/Reference.html) that allow access to date components such as *year, month, week of year, week of month, weekday, day, hour, minute, second* in local time zone.

---

#### Install
Add to [Podfile](http://cocoapods.org/) `pod 'NSDate+Calendar'`

---

#### Using

###### Access to date componentes

```objective-c
NSDate *date = [NSDate date];
NSInteger year = date.year;
NSInteger month = date.month;
NSInteger day = date.day;
NSInteger weekOfYear = date.weekOfYear;
NSInteger weekOfMonth = date.weekOfMonth;
NSInteger weekday = date.weekday;
NSInteger hour = date.hour;
NSInteger minute = date.minute;
NSInteger second = date.second;
```

---

###### Create date from date components



---
