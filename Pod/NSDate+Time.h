//
//  NSDate+Time.h
//  NSDate+Calendar
//
//  Created by Alexey Belkevich on 9/3/13.
//  Copyright (c) 2013 okolodev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Time)

@property (nonatomic, readonly) NSInteger hour;
@property (nonatomic, readonly) NSInteger minute;
@property (nonatomic, readonly) NSInteger second;

- (nullable NSDate *)dateBySettingHour:(NSInteger)hour;
- (nullable NSDate *)dateBySettingMinute:(NSInteger)minute;
- (nullable NSDate *)dateBySettingSecond:(NSInteger)second;
- (nullable NSDate *)dateBySettingHour:(NSInteger)hour
                                minute:(NSInteger)minute
                                second:(NSInteger)second;
- (nonnull NSDate *)dateByAddingHour:(NSInteger)hour;
- (nonnull NSDate *)dateByAddingMinute:(NSInteger)minute;
- (nonnull NSDate *)dateByAddingSecond:(NSInteger)second;
- (nonnull NSDate *)dateByAddingHour:(NSInteger)hour
                              minute:(NSInteger)minute
                              second:(NSInteger)second;

@end
