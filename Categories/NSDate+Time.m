//
//  NSDate+Time.m
//  NSDate+Calendar
//
//  Created by Alexey Belkevich on 9/3/13.
//  Copyright (c) 2013 okolodev. All rights reserved.
//

#import "NSDate+Time.h"
#import "NSDate+Components.h"

@implementation NSDate (Time)

- (NSInteger)hour
{
    return [self dateComponentsTime].hour;
}

- (NSInteger)minute
{
    NSDateComponents *components = [self dateComponentsTime];
    return components.minute;
}

- (NSInteger)second
{
    NSDateComponents *components = [self dateComponentsTime];
    return components.second;
}

- (NSDate *)dateBySettingHour:(NSInteger)hour
{
    NSDateComponents *components = [self dateComponentsDateTime];
    components.hour = hour;
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

- (NSDate *)dateBySettingMinute:(NSInteger)minute
{
    NSDateComponents *components = [self dateComponentsDateTime];
    components.minute = minute;
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

- (NSDate *)dateBySettingSecond:(NSInteger)second
{
    NSDateComponents *components = [self dateComponentsDateTime];
    components.second = second;
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

- (NSDate *)dateBySettingHour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second
{
    NSDateComponents *components = [self dateComponentsDateTime];
    components.hour = hour;
    components.minute = minute;
    components.second = second;
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

- (NSDate *)dateByAddingHour:(NSInteger)hour
{
    return [self dateByAddingHour:hour minute:0 second:0];
}

- (NSDate *)dateByAddingMinute:(NSInteger)minute
{
    return [self dateByAddingHour:0 minute:minute second:0];
}

- (NSDate *)dateByAddingSecond:(NSInteger)second
{
    return [self dateByAddingHour:0 minute:0 second:second];
}

- (NSDate *)dateByAddingHour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second
{
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.hour = hour;
    components.minute = minute;
    components.second = second;
    return [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:self options:0];
}

@end
