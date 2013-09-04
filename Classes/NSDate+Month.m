//
//  NSDate+Month.m
//  NSDate+Calendar
//
//  Created by Alexey Belkevich on 9/4/13.
//  Copyright (c) 2013 okolodev. All rights reserved.
//

#import "NSDate+Month.h"
#import "NSDate+Components.h"

@implementation NSDate (Month)

- (NSInteger)month
{
    return [self dateComponentsDate].month;
}

- (NSDate *)dateMonthStart
{
    NSDateComponents *components = [self dateComponentsDate];
    components.day = 1;
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

- (NSDate *)dateMonthEnd
{
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.day = -1;
    return [[NSCalendar currentCalendar] dateByAddingComponents:components
                                                         toDate:[self dateMonthAheadStart]
                                                        options:0];
}

- (NSDate *)dateMonthAgo
{
    return [self dateByAddingMonth:-1];
}

- (NSDate *)dateMonthAhead
{
    return [self dateByAddingMonth:1];
}

- (NSDate *)dateMonthAgoStart
{
    NSDateComponents *components = [self dateComponentsDate];
    components.day = 1;
    components.month--;
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

- (NSDate *)dateMonthAgoEnd
{
    NSDateComponents *components = [[self dateMonthStart] dateComponentsDate];
    components.day--;
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

- (NSDate *)dateMonthAheadStart
{
    NSDateComponents *components = [self dateComponentsDate];
    components.day = 1;
    components.month++;
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

- (NSDate *)dateMonthAheadEnd
{
    return [[self dateMonthAhead] dateMonthEnd];
}

- (NSDate *)dateBySettingMonth:(NSInteger)month
{
    NSDateComponents *components = [self dateComponentsDateTime];
    components.month = month;
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

- (NSDate *)dateByAddingMonth:(NSInteger)month
{
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.month = month;
    return [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:self options:0];
}


@end
