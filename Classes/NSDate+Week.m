//
//  NSDate+Week.m
//  hairsalon
//
//  Created by Belkevich Alexey on 3/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSDate+Week.h"
#import "NSDate+Components.h"

@implementation NSDate (Week)

#pragma mark -
#pragma mark actions

- (NSDate *)dateWeekStart
{
    return [self dateWithDayOfWeek:1];
}

- (NSDate *)dateWeekEnd
{
    return [self dateWithDayOfWeek:7];
}

- (NSDate *)datePreviousWeekStart
{
    NSDate *date = [self dateWithAddWeek:-1];
    return [date dateWeekStart];
}

- (NSDate *)datePreviousWeekEnd
{
    NSDate *date = [self dateWithAddWeek:-1];
    return [date dateWeekEnd];
}

- (NSDate *)dateNextWeekStart
{
    NSDate *date = [self dateWithAddWeek:1];
    return [date dateWeekStart];
}

- (NSDate *)dateNextWeekEnd
{
    NSDate *date = [self dateWithAddWeek:1];
    return [date dateWeekEnd];
}

+ (NSUInteger)weekCountInYear:(NSUInteger)year
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [NSDateComponents new];
    components.day = 31;
    components.month = 12;
    components.year = year;
    components.yearForWeekOfYear = year;
    NSDate *date = [calendar dateFromComponents:components];
    [components release];
    NSUInteger componentsArgs = (NSWeekCalendarUnit | NSWeekOfYearCalendarUnit | NSYearCalendarUnit |
                                 NSYearForWeekOfYearCalendarUnit);
    components = [calendar components:componentsArgs fromDate:date];
    if (components.yearForWeekOfYear > year)
    {
        date = [date datePreviousWeekStart];
        components = [calendar components:componentsArgs fromDate:date];
    }
    return components.week;
}

+ (NSDate *)dateWithWeek:(NSUInteger)week inYear:(NSUInteger)year
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [NSDateComponents new];
    components.week = week;
    components.weekday = 1;
    components.year = year;
    components.yearForWeekOfYear = year;
    NSDate *date = [calendar dateFromComponents:components];
    [components release];
    return date;
}

#pragma mark -
#pragma mark workflow

- (NSDate *)dateWithDayOfWeek:(NSInteger)weekDay
{
    NSDateComponents *components = [self dateComponentsWeekday];
    components.day += weekDay - components.weekday;
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

- (NSDate *)dateWithAddWeek:(NSInteger)week
{
    NSDateComponents *components = [self dateComponentsWeek];
    components.week += week;
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

@end
