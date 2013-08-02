//
//  NSDate+Time.h
//  hairsalon
//
//  Created by Belkevich Alexey on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Round)

// actions
- (NSDate *)dateOnly;
- (NSDate *)dateBySetTimeinterval:(NSTimeInterval)interval;
- (NSDate *)dateBySetHours:(NSInteger)hourCount minutes:(NSInteger)minutes;
- (NSTimeInterval)timeOnly;

@end
