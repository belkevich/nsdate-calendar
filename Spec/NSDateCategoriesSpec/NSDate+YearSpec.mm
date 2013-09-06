//
//  NSDate+YearSpec.mm
//  NSDateCategoriesSpec
//
//  Created by Alexey Belkevich on 9/4/13.
//  Copyright (c) 2013 okolodev. All rights reserved.
//

#import "NSDate+Year.h"
#import "NSDate+Day.h"
#import "NSDate+Time.h"
#import "NSDate+Month.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(NSDateYearSpec)

describe(@"Date with year", ^
{
    __block NSDate *date;
    __block NSDateFormatter *formatter;

    beforeEach(^
               {
                   formatter = [[NSDateFormatter alloc] init];
                   [formatter setDateFormat:@"dd-MM-y HH:mm:ss"];
                   date = [formatter dateFromString:@"04-09-2013 14:35:45"];
               });

    it(@"should get local year", ^
    {
        date.year should equal(2013);
    });

    it(@"should get local year start date without time", ^
    {
        NSString *dateYearStart = [formatter stringFromDate:[date dateYearStart]];
        dateYearStart should equal(@"01-01-2013 00:00:00");
    });

    it(@"should get local year end date without time", ^
    {
        NSString *dateYearEnd = [formatter stringFromDate:[date dateYearEnd]];
        dateYearEnd should equal(@"31-12-2013 00:00:00");
    });

    it(@"should get local date of the same day and time year ago", ^
    {
        NSString *dateYearAgo = [formatter stringFromDate:[date dateYearAgo]];
        dateYearAgo should equal(@"04-09-2012 14:35:45");
    });

    it(@"should get local date of the same day and time year ahead", ^
    {
        NSString *dateYearAhead = [formatter stringFromDate:[date dateYearAhead]];
        dateYearAhead should equal(@"04-09-2014 14:35:45");
    });

    it(@"should get local date of the previous year start without time", ^
    {
        NSString *dateYearAgoStart = [formatter stringFromDate:[date dateYearAgoStart]];
        dateYearAgoStart should equal(@"01-01-2012 00:00:00");
    });

    it(@"should get local date of the previous year end without time", ^
    {
        NSString *dateYearAgoEnd = [formatter stringFromDate:[date dateYearAgoEnd]];
        dateYearAgoEnd should equal(@"31-12-2012 00:00:00");
    });

    it(@"should get local date of the next year start without time", ^
    {
        NSString *dateYearAheadStart = [formatter stringFromDate:[date dateYearAheadStart]];
        dateYearAheadStart should equal(@"01-01-2014 00:00:00");
    });

    it(@"should get local date of the next year end without time", ^
    {
        NSString *dateYearAheadEnd = [formatter stringFromDate:[date dateYearAheadEnd]];
        dateYearAheadEnd should equal(@"31-12-2014 00:00:00");
    });

    it(@"should get local date with changed year", ^
    {
        NSString *dateChanged = [formatter stringFromDate:[date dateBySettingYear:2011]];
        dateChanged should equal(@"04-09-2011 14:35:45");
    });

    it(@"should get local date with added year", ^
    {
        NSString *dateChanged = [formatter stringFromDate:[date dateByAddingYear:-1]];
        dateChanged should equal(@"04-09-2012 14:35:45");
    });
});

SPEC_END