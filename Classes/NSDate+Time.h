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

- (NSDate *)dateBySettingHour:(NSInteger)hour;
- (NSDate *)dateBySettingMinute:(NSInteger)minute;
- (NSDate *)dateBySettingSecond:(NSInteger)second;
- (NSDate *)dateBySettingHour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second;
- (NSDate *)dateByAddingHour:(NSInteger)hour;
- (NSDate *)dateByAddingMinute:(NSInteger)minute;
- (NSDate *)dateByAddingSecond:(NSInteger)second;
- (NSDate *)dateByAddingHour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second;

@end
