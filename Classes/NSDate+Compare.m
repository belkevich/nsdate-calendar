//
//  NSDate+Compare.m
//  hairsalon
//
//  Created by Belkevich Alexey on 3/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSDate+Compare.h"

@implementation NSDate (Compare)

- (BOOL)isLess:(NSDate *)date
{
    return [self compare:date] == NSOrderedAscending;
}

- (BOOL)isGreater:(NSDate *)date
{
    return [self compare:date] == NSOrderedDescending;
}

- (BOOL)isLessOrEqual:(NSDate *)date
{
    return [self compare:date] == NSOrderedAscending || [self compare:date] == NSOrderedSame;
}

- (BOOL)isGreaterOrEqual:(NSDate *)date
{
    return [self compare:date] == NSOrderedDescending || [self compare:date] == NSOrderedSame;
}

@end
