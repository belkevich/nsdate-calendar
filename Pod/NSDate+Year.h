//
//  NSDate+Year.h
//  NSDate+Calendar
//
//  Created by Alexey Belkevich on 9/4/13.
//  Copyright (c) 2013 okolodev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Year)

@property (nonatomic, readonly) NSInteger year;

- (nonnull NSDate *)dateYearStart;
- (nonnull NSDate *)dateYearEnd;
- (nonnull NSDate *)dateYearAgo;
- (nonnull NSDate *)dateYearAhead;
- (nonnull NSDate *)dateByAddingYear:(NSInteger)year;
- (nullable NSDate *)dateBySettingYear:(NSInteger)year;

@end
