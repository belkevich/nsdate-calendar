//
//  NSDate+Days.h
//  hairsalon
//
//  Created by Belkevich Alexey on 3/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Days)

- (NSDate *)datePreviousDay;
- (NSDate *)dateNextDay;
- (NSDate *)datePreviousWeek;
- (NSDate *)dateNextWeek;
- (NSDate *)dateByAddingDays:(NSInteger)dayCount;

@end
