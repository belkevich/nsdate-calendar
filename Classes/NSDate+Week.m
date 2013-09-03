//
//  NSDate+Week.m
//  NSDate+Calendar
//
//  Created by Belkevich Alexey on 3/28/12.
//  Copyright (c) 2012 okolodev. All rights reserved.
//

#import "NSDate+Week.h"
#import "NSDate+Day.h"
#import "NSDate+Components.h"

@implementation NSDate (Week)

#pragma mark - public

- (NSDate *)dateWeekStart
{
#warning change to dateWithAddWeek:1
    return [self dateWithDayOfWeek:1];
}

- (NSDate *)dateWeekEnd
{
    return [self dateWithDayOfWeek:7];
}

- (NSDate *)dateWeekAgo
{
    return [self dateByAddingDays:-7];
}

- (NSDate *)dateWeekAhead
{
    return [self dateByAddingDays:7];
}

- (NSDate *)dateWeekAgoStart
{
    NSDate *date = [self dateWithAddWeek:-1];
    return [date dateWeekStart];
}

- (NSDate *)dateWeekAgoEnd
{
    NSDate *date = [self dateWithAddWeek:-1];
    return [date dateWeekEnd];
}

- (NSDate *)dateWeekAheadStart
{
    NSDate *date = [self dateWithAddWeek:1];
    return [date dateWeekStart];
}

- (NSDate *)dateWeekAheadEnd
{
    NSDate *date = [self dateWithAddWeek:1];
    return [date dateWeekEnd];
}

#pragma mark - private

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
