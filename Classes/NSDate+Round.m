//
//  NSDate+Time.m
//  hairsalon
//
//  Created by Belkevich Alexey on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSDate+Round.h"
#import "NSDate+Components.h"

#define NSDATE_SECONDS_IN_HOUR          3600
#define NSDATE_SECONDS_IN_MINUTE        60

@implementation NSDate (Round)

- (NSDate *)dateOnly
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [self dateComponentsDate];
    return [calendar dateFromComponents:components];
}

- (NSDate *)dateBySetTimeinterval:(NSTimeInterval)interval
{
    NSUInteger hours = (NSUInteger)interval / NSDATE_SECONDS_IN_HOUR;
    NSUInteger minutes = ((NSUInteger)interval % NSDATE_SECONDS_IN_HOUR) / NSDATE_SECONDS_IN_MINUTE;
    return [self dateBySetHours:hours minutes:minutes];
}

- (NSDate *)dateBySetHours:(NSInteger)hourCount minutes:(NSInteger)minutes
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [self dateComponentsDate];
    [components setHour:hourCount];
    [components setMinute:minutes];
    NSDate *newDate = [calendar dateFromComponents:components];
    return newDate;    
}

- (NSTimeInterval)timeOnly
{
    NSDateComponents *components = [self dateComponentsTime];
    NSInteger hour = [components hour];
    NSInteger minute = [components minute];
    return (NSTimeInterval)hour * 3600.f + (NSTimeInterval)minute * 60.f;
}

@end
