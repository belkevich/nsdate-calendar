//
//  NSDate+DaySpec.mm
//  NSDateCategoriesSpec
//
//  Created by Alexey Belkevich on 9/3/13.
//  Copyright (c) 2013 okolodev. All rights reserved.
//

#import "NSDate+Day.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(NSDateDaySpec)

describe(@"Date with day", ^
{
    __block NSDate *date;
    __block NSDateFormatter *formatter;

    beforeEach(^
               {
                   formatter = [[NSDateFormatter alloc] init];
                   [formatter setDateFormat:@"dd-MM-y HH:mm:ss"];
                   date = [formatter dateFromString:@"03-09-2013 19:26:44"];
               });

    it(@"should get local day", ^
    {
        date.day should equal(3);
    });

    it(@"should get days in current months", ^
    {
        date.daysInMonth should equal(30);
    });

    it(@"should get today local date without time", ^
    {
        NSString *today = [formatter stringFromDate:[date dateToday]];
        today should equal(@"03-09-2013 00:00:00");
    });

    it(@"should get yesterday local date without time", ^
    {
        NSString *yesterday = [formatter stringFromDate:[date dateYesterday]];
        yesterday should equal(@"02-09-2013 00:00:00");
    });

    it(@"should get tomorrow local date without time", ^
    {
        NSString *tomorrow = [formatter stringFromDate:[date dateTomorrow]];
        tomorrow should equal(@"04-09-2013 00:00:00");
    });

    it(@"should get date with changed local day but same local time", ^
    {
        NSString *changedDay = [formatter stringFromDate:[date dateBySettingDay:12]];
        changedDay should equal(@"12-09-2013 19:26:44");
    });

    it(@"should get date with added day and same local time", ^
    {
        NSString *changedDay = [formatter stringFromDate:[date dateByAddingDays:2]];
        changedDay should equal(@"05-09-2013 19:26:44");
    });

});

SPEC_END