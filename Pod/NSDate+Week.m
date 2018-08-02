//
//  NSDate+Week.m
//  NSDate+Calendar
//
//  Created by Belkevich Alexey on 3/28/12.
//  Copyright (c) 2012 okolodev. All rights reserved.
//

#import "NSDate+Week.h"
#import "NSDate+Components.h"

@implementation NSDate (Week)

- (NSInteger)weekOfMonth
{
    return [self dateComponentsWeek].weekOfMonth;
}

- (NSInteger)weekOfYear
{
    return [self dateComponentsWeek].weekOfYear;
}

- (NSInteger)weekday
{
    return [self dateComponentsWeekday].weekday;
}

- (NSDate *)dateWeekStart
{
    NSDateComponents *components = [self dateComponentsWeekday];
    NSInteger firstWeekday = [NSCalendar.currentCalendar firstWeekday];
    NSInteger weekday = components.weekday;
    NSInteger offset = firstWeekday > weekday ? 7 : 0;
    components.day -= weekday - firstWeekday + offset;
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

- (NSDate *)dateWeekEnd
{
    NSDateComponents *components = [self dateComponentsWeekday];
    NSInteger firstWeekday = [NSCalendar.currentCalendar firstWeekday];
    NSInteger weekday = components.weekday;
    NSInteger offset = firstWeekday > weekday ? -1 : 6;
    components.day += firstWeekday - weekday + offset;
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

- (NSDate *)dateWeekAgo
{
    return [self dateByAddingWeek:-1];
}

- (NSDate *)dateWeekAhead
{
    return [self dateByAddingWeek:1];
}

- (NSDate *)dateByAddingWeek:(NSInteger)week
{
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.weekOfYear = week;
    return [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)dateBySettingWeekOfYear:(NSInteger)week
{
    NSDateComponents *components = [self dateComponentsWeekTime];
    components.weekOfYear = week;
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

- (NSDate *)dateBySettingWeekOfMonth:(NSInteger)week
{
    NSDateComponents *components = [self dateComponentsWeekTime];
    components.weekOfYear += week - components.weekOfMonth;
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

- (NSDate *)dateBySettingWeekday:(NSInteger)weekday
{
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.weekday = weekday - self.weekday;
    return [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:self options:0];
}

@end
