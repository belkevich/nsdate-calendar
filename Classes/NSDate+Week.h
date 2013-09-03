//
//  NSDate+Week.h
//  NSDate+Calendar
//
//  Created by Belkevich Alexey on 3/28/12.
//  Copyright (c) 2012 okolodev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Week)

- (NSDate *)dateWeekStart;
- (NSDate *)dateWeekEnd;
- (NSDate *)dateWeekAgo;
- (NSDate *)dateWeekAhead;
- (NSDate *)dateWeekAgoStart;
- (NSDate *)dateWeekAgoEnd;
- (NSDate *)dateWeekAheadStart;
- (NSDate *)dateWeekAheadEnd;

@end
