//
//  NSDate+Day.h
//  NSDate+Calendar
//
//  Created by Belkevich Alexey on 3/16/12.
//  Copyright (c) 2012 okolodev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Day)

@property (nonatomic, readonly) NSInteger day;
@property (nonatomic, readonly) NSUInteger daysInMonth;
@property (nonatomic, readonly) NSUInteger dayInYear;

- (NSDate *)dateToday;
- (NSDate *)dateYesterday;
- (NSDate *)dateTomorrow;
- (NSDate *)dateBySettingDay:(NSInteger)day;
- (NSDate *)dateByAddingDays:(NSInteger)days;

@end
