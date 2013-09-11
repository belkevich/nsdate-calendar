//
//  NSDate+CompateSpec.mm
//  NSDateCategoriesSpec
//
//  Created by Alexey Belkevich on 9/10/13.
//  Copyright (c) 2013 okolodev. All rights reserved.
//

#import "NSDate+Compare.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(NSDateCompareSpec)

describe(@"Date compare", ^
{
    __block NSDateFormatter *formatter;

    beforeEach(^
               {
                   formatter = [[NSDateFormatter alloc] init];
                   [formatter setDateFormat:@"dd-MM-y HH:mm:ss"];
               });

    it(@"should check is date equal regardless to time", ^
    {
        NSDate *date1 = [formatter dateFromString:@"12-12-2014 12:13:14"];
        NSDate *date2 = [formatter dateFromString:@"12-12-2014 10:10:10"];
        [date1 isEqualToDate:date2] should_not be_truthy;
        [date1 isEqualToDay:date2] should be_truthy;
    });

    it(@"should check is date time equal regardless date", ^
    {
        NSDate *date1 = [formatter dateFromString:@"10-10-2014 12:13:14"];
        NSDate *date2 = [formatter dateFromString:@"12-12-2014 12:13:14"];
        [date1 isEqualToDate:date2] should_not be_truthy;
        [date1 isEqualToTime:date2] should be_truthy;
    });

    it(@"should check is date less then another date", ^
    {
        NSDate *date1 = [formatter dateFromString:@"10-10-2014 12:13:14"];
        NSDate *date2 = [formatter dateFromString:@"12-12-2014 12:13:14"];
        [date1 isEqualToDate:date2] should_not be_truthy;
        [date1 isLessDate:date2] should be_truthy;
    });

    it(@"should check is date greater then another date", ^
    {
        NSDate *date1 = [formatter dateFromString:@"15-12-2014 12:13:14"];
        NSDate *date2 = [formatter dateFromString:@"12-12-2014 12:13:14"];
        [date1 isEqualToDate:date2] should_not be_truthy;
        [date1 isGreaterDate:date2] should be_truthy;
    });

    it(@"should check is date less or equal then another date", ^
    {
        NSDate *date1 = [formatter dateFromString:@"15-12-2014 12:13:14"];
        NSDate *date2 = [formatter dateFromString:@"15-12-2014 12:13:15"];
        NSDate *date3 = [formatter dateFromString:@"15-12-2014 12:13:14"];
        [date1 isEqualToDate:date2] should_not be_truthy;
        [date1 isEqualToDate:date3] should be_truthy;
        [date1 isLessOrEqualToDate:date2] should be_truthy;
        [date1 isLessOrEqualToDate:date3] should be_truthy;
    });

    it(@"should check is date greater or equal then another date", ^
    {
        NSDate *date1 = [formatter dateFromString:@"15-12-2014 12:13:14"];
        NSDate *date2 = [formatter dateFromString:@"15-12-2014 12:13:14"];
        NSDate *date3 = [formatter dateFromString:@"12-12-2014 12:13:15"];
        [date1 isEqualToDate:date2] should be_truthy;
        [date1 isEqualToDate:date3] should_not be_truthy;
        [date1 isGreaterOrEqualToDate:date2] should be_truthy;
        [date1 isGreaterOrEqualToDate:date3] should be_truthy;
    });
});

SPEC_END
