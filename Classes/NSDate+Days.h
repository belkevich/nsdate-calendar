//
//  NSDate+Days.h
//  NSDate+Calendar
//
//  Created by Belkevich Alexey on 3/16/12.
//  Copyright (c) 2012 okolodev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Days)

- (NSDate *)dateToday;
- (NSDate *)dateYesterday;
- (NSDate *)dateTomorrow;
- (NSDate *)dateWeekAgo;
- (NSDate *)dateWeekAhead;

@end
