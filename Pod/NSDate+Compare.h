//
//  NSDate+Compare.h
//  NSDate+Calendar
//
//  Created by Alexey Belkevich on 9/10/13.
//  Copyright (c) 2013 okolodev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Compare)

- (BOOL)isEqualToDay:(nonnull NSDate *)date;
- (BOOL)isEqualToTime:(nonnull NSDate *)date;
- (BOOL)isLessDate:(nonnull NSDate *)date;
- (BOOL)isGreaterDate:(nonnull NSDate *)date;
- (BOOL)isLessOrEqualToDate:(nonnull NSDate *)date;
- (BOOL)isGreaterOrEqualToDate:(nonnull NSDate *)date;

@end
