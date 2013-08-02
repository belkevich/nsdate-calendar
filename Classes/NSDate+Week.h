//
//  NSDate+Week.h
//  hairsalon
//
//  Created by Belkevich Alexey on 3/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Week)

// actions
- (NSDate *)dateWeekStart;
- (NSDate *)dateWeekEnd;
- (NSDate *)datePreviousWeekStart;
- (NSDate *)datePreviousWeekEnd;
- (NSDate *)dateNextWeekStart;
- (NSDate *)dateNextWeekEnd;
+ (NSUInteger)weekCountInYear:(NSUInteger)year;
+ (NSDate *)dateWithWeek:(NSUInteger)week inYear:(NSUInteger)year;
// workflow
- (NSDate *)dateWithDayOfWeek:(NSInteger)weekDay;
- (NSDate *)dateWithAddWeek:(NSInteger)week;

@end
