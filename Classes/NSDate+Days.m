//
//  NSDate+Days.m
//  hairsalon
//
//  Created by Belkevich Alexey on 3/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSDate+Days.h"
#import "NSDate+Round.h"

@implementation NSDate (Days)

- (NSDate *)datePreviousDay
{
    return [self dateByAddingDays:-1];
}

- (NSDate *)dateNextDay
{
    return [self dateByAddingDays:1];
}

- (NSDate *)datePreviousWeek
{
    return [self dateByAddingDays:-7];
}

- (NSDate *)dateNextWeek
{
    return [self dateByAddingDays:7];
}

- (NSDate *)dateByAddingDays:(NSInteger)dayCount
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *date = [self dateOnly];
    NSDateComponents *components = [NSDateComponents new];
    [components setDay:dayCount];
    NSDate *newDate = [calendar dateByAddingComponents:components toDate:date options:0];
    [components release];
    return newDate;    
}

@end
