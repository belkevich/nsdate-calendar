//
//  NSDate+Year.m
//  NSDate+Calendar
//
//  Created by Alexey Belkevich on 9/4/13.
//  Copyright (c) 2013 okolodev. All rights reserved.
//

#import "NSDate+Year.h"
#import "NSDate+Components.h"

@implementation NSDate (Year)

- (NSInteger)year
{
    return [self dateComponentsDate].year;
}

- (NSDate *)dateYearStart
{
    NSDateComponents *components = [self dateComponentsDate];
    components.day = 1;
    components.month = 1;
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

- (NSDate *)dateYearEnd
{
    NSDateComponents *components = [self dateComponentsDate];
    components.day = 1;
    components.month = 1;
    components.year++;
    components.day--;
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

- (NSDate *)dateYearAgo
{
    return [self dateByAddingYear:-1];
}

- (NSDate *)dateYearAhead
{
    return [self dateByAddingYear:1];
}

- (NSDate *)dateBySettingYear:(NSInteger)year
{
    NSDateComponents *components = [self dateComponentsDateTime];
    components.year = year;
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

- (NSDate *)dateByAddingYear:(NSInteger)year
{
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.year = year;
    return [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:self options:0];
}

@end
