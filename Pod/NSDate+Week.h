//
//  NSDate+Week.h
//  NSDate+Calendar
//
//  Created by Belkevich Alexey on 3/28/12.
//  Copyright (c) 2012 okolodev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Week)

@property (nonatomic, readonly) NSInteger weekOfMonth;
@property (nonatomic, readonly) NSInteger weekOfYear;
@property (nonatomic, readonly) NSInteger weekday;

- (nonnull NSDate *)dateWeekStart;
- (nonnull NSDate *)dateWeekEnd;
- (nonnull NSDate *)dateWeekAgo;
- (nonnull NSDate *)dateWeekAhead;
- (nonnull NSDate *)dateByAddingWeek:(NSInteger)week;
- (nullable NSDate *)dateBySettingWeekOfYear:(NSInteger)week;
- (nullable NSDate *)dateBySettingWeekOfMonth:(NSInteger)week;
- (nullable NSDate *)dateBySettingWeekday:(NSInteger)weekday;

@end
