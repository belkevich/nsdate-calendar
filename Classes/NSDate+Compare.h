//
//  NSDate+Compare.h
//  hairsalon
//
//  Created by Belkevich Alexey on 3/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Compare)

- (BOOL)isLess:(NSDate *)date;
- (BOOL)isGreater:(NSDate *)date;
- (BOOL)isLessOrEqual:(NSDate *)date;
- (BOOL)isGreaterOrEqual:(NSDate *)date;

@end
