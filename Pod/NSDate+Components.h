//
//  NSDate+Components.h
//  NSDate+Calendar
//
//  Created by Belkevich Alexey on 3/28/12.
//  Copyright (c) 2012 okolodev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Components)

- (nonnull NSDateComponents *)dateComponentsTime;
- (nonnull NSDateComponents *)dateComponentsDate;
- (nonnull NSDateComponents *)dateComponentsWeek;
- (nonnull NSDateComponents *)dateComponentsWeekday;
- (nonnull NSDateComponents *)dateComponentsDateTime;
- (nonnull NSDateComponents *)dateComponentsWeekTime;

@end
