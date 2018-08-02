//
//  NSDate+Components.m
//  NSDate+Calendar
//
//  Created by Belkevich Alexey on 3/28/12.
//  Copyright (c) 2012 okolodev. All rights reserved.
//

#import "NSDate+Components.h"

@implementation NSDate (Components)

#pragma mark - public

- (NSDateComponents *)dateComponentsTime
{
    NSCalendarUnit components = (NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond);
    return [self dateComponents:components];
}

- (NSDateComponents *)dateComponentsDate
{
    NSCalendarUnit components = (NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear);
    return [self dateComponents:components];
}

- (NSDateComponents *)dateComponentsWeek
{
    NSCalendarUnit components = (NSCalendarUnitWeekday | NSCalendarUnitWeekOfMonth |
                             NSCalendarUnitWeekOfYear | NSCalendarUnitWeekday | NSCalendarUnitYear |
                             NSCalendarUnitYearForWeekOfYear);
    return [self dateComponents:components];
}

- (NSDateComponents *)dateComponentsWeekday
{
    NSCalendarUnit components = (NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitWeekday |
                             NSCalendarUnitMonth | NSCalendarUnitYear);
    return [self dateComponents:components];
}

- (NSDateComponents *)dateComponentsDateTime
{
    NSCalendarUnit components = (NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear |
                             NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond);
    return [self dateComponents:components];
}

- (NSDateComponents *)dateComponentsWeekTime
{
    NSCalendarUnit components = (NSCalendarUnitWeekOfMonth | NSCalendarUnitWeekOfYear |
                             NSCalendarUnitWeekday | NSCalendarUnitYear |
                             NSCalendarUnitYearForWeekOfYear | NSCalendarUnitHour |
                             NSCalendarUnitMinute | NSCalendarUnitSecond);
    return [self dateComponents:components];
}

#pragma mark - private

- (NSDateComponents *)dateComponents:(NSCalendarUnit)components
{
    return [[NSCalendar currentCalendar] components:components fromDate:self];
}

@end
