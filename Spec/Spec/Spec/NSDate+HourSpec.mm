//
//  NSDate+HourSpec.mm
//  Spec
//
//  Created by Alexey Belkevich on 22.08.15.
//  Copyright (c) 2015 Okolodev. All rights reserved.
//

#import <Cedar/Cedar.h>
#import "NSDate+Hour.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(NSDateHourSpec)

    describe(@"Date with hour", ^
    {
        __block NSDate *date;
        __block NSDateFormatter *formatter;

        beforeEach((id)^
        {
            formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"dd-MM-y HH:mm:ss"];
            date = [formatter dateFromString:@"01-01-2015 17:25:14"];
        });

        it(@"should get hour in year", ^
        {
            date.hourInYear should equal(18);
        });
    });

SPEC_END