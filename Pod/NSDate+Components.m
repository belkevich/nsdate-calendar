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
    NSUInteger components = (NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond);
    return [self dateComponents:components];
}

- (NSDateComponents *)dateComponentsDate
{
    NSUInteger components = (NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear);
    return [self dateComponents:components];
}

- (NSDateComponents *)dateComponentsWeek
{
    NSUInteger components = (NSCalendarUnitWeekday | NSCalendarUnitWeekOfMonth |
                             NSCalendarUnitWeekOfYear | NSCalendarUnitWeekday | NSCalendarUnitYear |
                             NSCalendarUnitYearForWeekOfYear);
    return [self dateComponents:components];
}

- (NSDateComponents *)dateComponentsWeekday
{
    NSUInteger components = (NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitWeekday |
                             NSCalendarUnitMonth | NSCalendarUnitYear);
    return [self dateComponents:components];
}

- (NSDateComponents *)dateComponentsDateTime
{
    NSUInteger components = (NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear |
                             NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond);
    return [self dateComponents:components];
}

- (NSDateComponents *)dateComponentsWeekTime
{
    NSUInteger components = (NSCalendarUnitWeekOfMonth | NSCalendarUnitWeekOfYear |
                             NSCalendarUnitWeekday | NSCalendarUnitYear |
                             NSCalendarUnitYearForWeekOfYear | NSCalendarUnitHour |
                             NSCalendarUnitMinute | NSCalendarUnitSecond);
    return [self dateComponents:components];
}

#pragma mark - private

- (NSDateComponents *)dateComponents:(NSUInteger)components
{
    return [[NSCalendar currentCalendar] components:components fromDate:self];
}

@end
