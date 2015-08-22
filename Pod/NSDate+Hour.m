//
//  NSObject_NSDate_Hour_m.h
//  NSDateCalendar
//
//  Created by Alexander Lingtorp on 22/08/15.
//  Copyright © 2015 Okolodev. All rights reserved.
//

#import "NSDate+Hour.h"

@implementation NSDate (Hour)

- (NSUInteger)hourInYear
{
    return [[NSCalendar currentCalendar] ordinalityOfUnit:NSCalendarUnitHour
                                                   inUnit:NSCalendarUnitYear
                                                  forDate:self];
}

@end
