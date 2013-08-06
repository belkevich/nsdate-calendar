//
//  NSDate+Days.m
//  NSDate+Calendar
//
//  Created by Belkevich Alexey on 3/16/12.
//  Copyright (c) 2012 okolodev. All rights reserved.
//

#import "NSDate+Days.h"
#import "NSDate+Components.h"

@implementation NSDate (Days)

- (NSDate *)dateToday
{
    NSDateComponents *components = [self dateComponentsDate];
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

- (NSDate *)dateYesterday
{
    return [self dateByAddingDays:-1];
}

- (NSDate *)dateTomorrow
{
    return [self dateByAddingDays:1];
}

- (NSDate *)dateWeekAgo
{
    return [self dateByAddingDays:-7];
}

- (NSDate *)dateWeekAhead
{
    return [self dateByAddingDays:7];
}

- (NSDate *)dateByAddingDays:(NSInteger)dayCount
{
    NSDate *date = [self dateToday];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:dayCount];
    return [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:date options:0];
}

@end
