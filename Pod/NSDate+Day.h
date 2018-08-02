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

- (nonnull NSDate *)dateToday;
- (nonnull NSDate *)dateYesterday;
- (nonnull NSDate *)dateTomorrow;
- (nonnull NSDate *)dateByAddingDays:(NSInteger)days;
- (nullable NSDate *)dateBySettingDay:(NSInteger)day;

@end
