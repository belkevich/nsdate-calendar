//
//  NSDate+Components.h
//  NSDate+Calendar
//
//  Created by Belkevich Alexey on 3/28/12.
//  Copyright (c) 2012 okolodev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Components)

- (NSDateComponents *)dateComponentsTime;
- (NSDateComponents *)dateComponentsDate;
- (NSDateComponents *)dateComponentsWeek;
- (NSDateComponents *)dateComponentsWeekday;
- (NSDateComponents *)dateComponentsDateTime;
- (NSDateComponents *)dateComponentsWeekTime;

@end
