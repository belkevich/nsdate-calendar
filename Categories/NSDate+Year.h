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

- (NSDate *)dateYearStart;
- (NSDate *)dateYearEnd;
- (NSDate *)dateYearAgo;
- (NSDate *)dateYearAhead;
- (NSDate *)dateBySettingYear:(NSInteger)year;
- (NSDate *)dateByAddingYear:(NSInteger)year;

@end
