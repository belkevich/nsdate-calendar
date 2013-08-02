//
//  NSDate+Components.h
//  hairsalon
//
//  Created by Belkevich Alexey on 3/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Components)

// actions
- (NSDateComponents *)dateComponentsTime;
- (NSDateComponents *)dateComponentsDate;
- (NSDateComponents *)dateComponentsWeek;
- (NSDateComponents *)dateComponentsWeekday;
- (NSDateComponents *)dateComponentsWeekOfYear;
// worflow
- (NSDateComponents *)dateComponents:(NSUInteger)components;

@end
