//
//  NSDate+DateTimeSpec.mm
//  NSDateCategoriesSpec
//
//  Created by Alexey Belkevich on 9/10/13.
//  Copyright (c) 2013 okolodev. All rights reserved.
//

#import "NSDate+DateTime.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(NSDateDateTimeSpec)

describe(@"Date with date time", ^
{
    __block NSDateFormatter *formatter;

    beforeEach(^
               {
                   formatter = [[NSDateFormatter alloc] init];
                   [formatter setDateFormat:@"dd-MM-y HH:mm:ss"];
               });

    it(@"should create local date with year, month, day and without time", ^
    {
        NSDate *date = [NSDate dateWithYear:2013 month:9 day:10];
        NSString *string = [formatter stringFromDate:date];
        string should equal(@"10-09-2013 00:00:00");
    });

    it(@"should create local date with year, month, day, hour, minute, second", ^
    {
        NSDate *date = [NSDate dateWithYear:2013 month:9 day:10 hour:17 minute:53 second:26];
        NSString *string = [formatter stringFromDate:date];
        string should equal(@"10-09-2013 17:53:26");
    });
});

SPEC_END
