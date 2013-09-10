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

- (NSDate *)dateMonthStart;
- (NSDate *)dateMonthEnd;
- (NSDate *)dateMonthAgo;
- (NSDate *)dateMonthAhead;
- (NSDate *)dateBySettingMonth:(NSInteger)month;
- (NSDate *)dateByAddingMonth:(NSInteger)month;

@end
