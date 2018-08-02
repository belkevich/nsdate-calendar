//
//  NSDate+Month.h
//  NSDate+Calendar
//
//  Created by Alexey Belkevich on 9/4/13.
//  Copyright (c) 2013 okolodev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Month)

@property (nonatomic, readonly) NSInteger month;

- (nonnull NSDate *)dateMonthStart;
- (nonnull NSDate *)dateMonthEnd;
- (nonnull NSDate *)dateMonthAgo;
- (nonnull NSDate *)dateMonthAhead;
- (nonnull NSDate *)dateByAddingMonth:(NSInteger)month;
- (nullable NSDate *)dateBySettingMonth:(NSInteger)month;

@end
