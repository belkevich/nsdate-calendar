//
//  NSDate+DateWithString.h
//  hairsalon
//
//  Created by Belkevich Alexey on 2/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (DateWithString)

+ (NSDate *)dateWithTimestampString:(NSString *)string;
+ (NSDate *)dateWithString:(NSString *)string format:(NSString *)format;
- (NSString *)stringDateFull;
- (NSString *)stringDateWeek;
- (NSString *)stringDateOnly;
- (NSString *)stringDateWeekday;
- (NSString *)stringDateDayOfWeek;
- (NSString *)stringDateDayOfMonth;
- (NSString *)stringTimeOnly;
+ (NSArray *)arrayStringWeekdays;
- (NSString *)stringWithFormatString:(NSString *)format;

@end
