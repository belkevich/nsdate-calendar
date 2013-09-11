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

- (NSDate *)dateWeekStart;
- (NSDate *)dateWeekEnd;
- (NSDate *)dateWeekAgo;
- (NSDate *)dateWeekAhead;
- (NSDate *)dateBySettingWeekOfYear:(NSInteger)week;
- (NSDate *)dateBySettingWeekOfMonth:(NSInteger)week;
- (NSDate *)dateBySettingWeekday:(NSInteger)weekday;
- (NSDate *)dateByAddingWeek:(NSInteger)week;

@end
