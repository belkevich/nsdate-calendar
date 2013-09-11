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
    NSUInteger components = (NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit);
    return [self dateComponents:components];
}

- (NSDateComponents *)dateComponentsDate
{
    NSUInteger components = (NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit);
    return [self dateComponents:components];
}

- (NSDateComponents *)dateComponentsWeek
{
    NSUInteger components = (NSWeekCalendarUnit | NSWeekOfMonthCalendarUnit |
                             NSWeekOfYearCalendarUnit | NSWeekdayCalendarUnit | NSYearCalendarUnit |
                             NSYearForWeekOfYearCalendarUnit);
    return [self dateComponents:components];
}

- (NSDateComponents *)dateComponentsWeekday
{
    NSUInteger components = (NSDayCalendarUnit | NSWeekCalendarUnit | NSWeekdayCalendarUnit |
                             NSMonthCalendarUnit | NSYearCalendarUnit);
    return [self dateComponents:components];
}

- (NSDateComponents *)dateComponentsDateTime
{
    NSUInteger components = (NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit |
                             NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit);
    return [self dateComponents:components];
}

- (NSDateComponents *)dateComponentsWeekTime
{
    NSUInteger components = (NSWeekCalendarUnit | NSWeekdayCalendarUnit |
                             NSWeekOfMonthCalendarUnit | NSWeekOfYearCalendarUnit |
                             NSYearCalendarUnit | NSYearForWeekOfYearCalendarUnit |
                             NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit);
    return [self dateComponents:components];
}

#pragma mark - private

- (NSDateComponents *)dateComponents:(NSUInteger)components
{
    return [[NSCalendar currentCalendar] components:components fromDate:self];
}

@end
