//
//  NSDate+DateTime.m
//  NSDateCategoriesSpec
//
//  Created by Alexey Belkevich on 9/10/13.
//  Copyright (c) 2013 okolodev. All rights reserved.
//

#import "NSDate+DateTime.h"

@implementation NSDate (DateTime)

+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day
{
    NSDateComponents *components = [self dateComponentsWith:year month:month day:day];
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day
                    hour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second
{
    NSDateComponents *components = [self dateComponentsWith:year month:month day:day];
    components.hour = hour;
    components.minute = minute;
    components.second = second;
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

#pragma mark - private

+ (NSDateComponents *)dateComponentsWith:(NSInteger)year month:(NSInteger)month day:(NSInteger)day
{
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.year = year;
    components.month = month;
    components.day = day;
    return components;
}

@end
