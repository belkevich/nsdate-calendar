//
//  NSDate+Compare.m
//  NSDate+Calendar
//
//  Created by Alexey Belkevich on 9/10/13.
//  Copyright (c) 2013 okolodev. All rights reserved.
//

#import "NSDate+Compare.h"
#import "NSDate+Day.h"
#import "NSDate+Month.h"
#import "NSDate+Year.h"
#import "NSDate+Time.h"

@implementation NSDate (Compare)

- (BOOL)isEqualToDay:(NSDate *)date
{
    return self.day == date.day && self.month == date.month && self.year == date.year;
}

- (BOOL)isEqualToTime:(NSDate *)date
{
    return self.hour == date.hour && self.minute == date.minute && self.second == date.second;
}

- (BOOL)isLessDate:(NSDate *)date
{
    return [self compare:date] == NSOrderedAscending;
}

- (BOOL)isGreaterDate:(NSDate *)date
{
    return [self compare:date] == NSOrderedDescending;
}

- (BOOL)isLessOrEqualToDate:(NSDate *)date
{
    return [self isLessDate:date] || [self isEqualToDate:date];
}

- (BOOL)isGreaterOrEqualToDate:(NSDate *)date
{
    return [self isGreaterDate:date] || [self isEqualToDate:date];
}

@end
