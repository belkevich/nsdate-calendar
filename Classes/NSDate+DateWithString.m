//
//  NSDate+DateWithString.m
//  hairsalon
//
//  Created by Belkevich Alexey on 2/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSDate+DateWithString.h"
#import "NSDate+Week.h"
#import "NSDate+Components.h"

#define DATE_FORMAT_FULL                            @"cccc dd MMMM yyyy hh:mm a"
#define DATE_FORMAT_TIMESTAMP                       @"yyyy-MM-dd HH:mm:ssz"
#define DATE_FORMAT_DATEONLY                        @"yyyy-MM-dd"
#define DATE_FORMAT_WEEKDAY                         @"cccc"
#define DATE_FORMAT_DAYOFWEEK                       @"cccc dd-MM-yyyy"
#define DATE_FORMAT_DAYOFMONTH                      @"MMMM dd"
#define DATE_FORMAT_TIMEONLY                        @"HH:mm"

#define DATE_WEEK                                   @"Week"

@implementation NSDate (DateWithString)

+ (NSDate *)dateWithTimestampString:(NSString *)string
{
    return [self dateWithString:string format:DATE_FORMAT_TIMESTAMP];
}

+ (NSDate *)dateWithString:(NSString *)string format:(NSString *)format
{
    if (string && format)
    {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:format];
        NSDate *date = [formatter dateFromString:string];
        [formatter release];
        return date;
    }
    return nil;
}

- (NSString *)stringDateFull
{
    return [self stringWithFormatString:DATE_FORMAT_FULL];
}

- (NSString *)stringDateWeek
{
    NSDate *start = [self dateWeekStart];
    NSDate *end = [self dateWeekEnd];
    NSDateComponents *components = [self dateComponentsWeekOfYear];
    NSUInteger week = components.weekOfYear;
    NSInteger year = components.year;
    NSString *startString = [start stringDateDayOfMonth];
    NSString *endString = [end stringDateDayOfMonth];
    NSString *weekString = [LocalizationManager getLocalizedString:DATE_WEEK];
    return [NSString stringWithFormat:@"%@ %d (%@ - %@) %d", weekString, week, startString, endString,
            year];
}

- (NSString *)stringDateOnly
{
    return [self stringWithFormatString:DATE_FORMAT_DATEONLY];
}

- (NSString *)stringDateWeekday
{
    return [self stringWithFormatString:DATE_FORMAT_WEEKDAY];
}

- (NSString *)stringDateDayOfWeek
{
    return [self stringWithFormatString:DATE_FORMAT_DAYOFWEEK];
}

- (NSString *)stringDateDayOfMonth
{
    return [self stringWithFormatString:DATE_FORMAT_DAYOFMONTH];
}

- (NSString *)stringTimeOnly
{
    return [self stringWithFormatString:DATE_FORMAT_TIMEONLY];
}

+ (NSArray *)arrayStringWeekdays
{
    NSMutableArray *array = [NSMutableArray new];
    NSDate *date = [NSDate date];
    for (NSUInteger i=1; i<=7; i++)
    {
        NSDate *weekday = [date dateWithDayOfWeek:i];
        NSString *string = [weekday stringDateWeekday];
        [array addObject:string];
    }
    NSArray *result = [array copy];
    [array release];
    return [result autorelease];
}

- (NSString *)stringWithFormatString:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSString *string = [formatter stringFromDate:self];
    [formatter release];
    return string;
}

@end
