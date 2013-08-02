//
//  NSDate+Components.m
//  hairsalon
//
//  Created by Belkevich Alexey on 3/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSDate+Components.h"

@implementation NSDate (Components)

#pragma mark -
#pragma mark actions

- (NSDateComponents *)dateComponentsTime
{
    NSUInteger components = (NSHourCalendarUnit | NSMinuteCalendarUnit);
    return [self dateComponents:components];
}

- (NSDateComponents *)dateComponentsDate
{
    NSUInteger components = (NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit);
    return [self dateComponents:components];
}

- (NSDateComponents *)dateComponentsWeek
{
    NSUInteger components = (NSWeekCalendarUnit | NSWeekdayCalendarUnit | NSYearCalendarUnit |
                             NSYearForWeekOfYearCalendarUnit);
    return [self dateComponents:components];
}

- (NSDateComponents *)dateComponentsWeekday
{
    NSUInteger components = (NSDayCalendarUnit | NSWeekCalendarUnit | NSWeekdayCalendarUnit | 
                             NSMonthCalendarUnit | NSYearCalendarUnit);
    return [self dateComponents:components];
}

- (NSDateComponents *)dateComponentsWeekOfYear
{
    NSUInteger components = (NSWeekOfYearCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit);
    return [self dateComponents:components];
}

#pragma mark 

- (NSDateComponents *)dateComponents:(NSUInteger)components
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar components:components fromDate:self];
}

@end
