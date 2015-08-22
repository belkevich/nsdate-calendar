//
//  NSDate+Day.m
//  NSDate+Calendar
//
//  Created by Belkevich Alexey on 3/16/12.
//  Copyright (c) 2012 okolodev. All rights reserved.
//

#import "NSDate+Day.h"
#import "NSDate+Components.h"

@implementation NSDate (Day)

- (NSInteger)day
{
    return [self dateComponentsDate].day;
}

- (NSUInteger)daysInMonth
{
    NSRange range = [[NSCalendar currentCalendar]
                                 rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth
                                     forDate:self];
    return range.length;
}

- (NSUInteger)dayInYear
{
    return [[NSCalendar currentCalendar] ordinalityOfUnit:NSCalendarUnitDay
                                                   inUnit:NSCalendarUnitYear
                                                  forDate:self];
}

- (NSDate *)dateToday
{
    NSDateComponents *components = [self dateComponentsDate];
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

- (NSDate *)dateYesterday
{
    NSDateComponents *components = [self dateComponentsDate];
    components.day--;
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

- (NSDate *)dateTomorrow
{
    NSDateComponents *components = [self dateComponentsDate];
    components.day++;
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

- (NSDate *)dateBySettingDay:(NSInteger)day
{
    NSDateComponents *components = [self dateComponentsDateTime];
    components.day = day;
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

- (NSDate *)dateByAddingDays:(NSInteger)days
{
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.day = days;
    return [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:self options:0];
}

@end
