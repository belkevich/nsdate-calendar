//
//  NSDate+MonthSpec.mm
//  NSDateCategoriesSpec
//
//  Created by Alexey Belkevich on 9/4/13.
//  Copyright (c) 2013 okolodev. All rights reserved.
//

#import "NSDate+Month.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(NSDateMonthSpec)

describe(@"Date with month", ^
{
    __block NSDate *date;
    __block NSDateFormatter *formatter;

    beforeEach(^
               {
                   formatter = [[NSDateFormatter alloc] init];
                   [formatter setDateFormat:@"dd-MM-y HH:mm:ss"];
                   date = [formatter dateFromString:@"04-09-2013 12:10:52"];
               });

    it(@"should get local month", ^
    {
        date.month should equal(9);
    });

    it(@"should get local month start date without time", ^
    {
        NSString *dateMonthStart = [formatter stringFromDate:[date dateMonthStart]];
        dateMonthStart should equal(@"01-09-2013 00:00:00");
    });

    it(@"should get local month end date without time", ^
    {
        NSString *dateMonthEnd = [formatter stringFromDate:[date dateMonthEnd]];
        dateMonthEnd should equal(@"30-09-2013 00:00:00");
    });

    it(@"should get local date of the same day and time month ago", ^
    {
        NSString *dateMonthAgo = [formatter stringFromDate:[date dateMonthAgo]];
        dateMonthAgo should equal(@"04-08-2013 12:10:52");
    });

    it(@"should get local date of the same day and time month ahead", ^
    {
        NSString *dateMonthAhead = [formatter stringFromDate:[date dateMonthAhead]];
        dateMonthAhead should equal(@"04-10-2013 12:10:52");
    });

    it(@"should get local date of previous month start without time", ^
    {
        date = [[date dateMonthAgo] dateMonthStart];
        NSString *dateMonthAgoStart = [formatter stringFromDate:date];
        dateMonthAgoStart should equal(@"01-08-2013 00:00:00");
    });

    it(@"should get local date of previous month end without time", ^
    {
        date = [[date dateMonthAgo] dateMonthEnd];
        NSString *dateMonthAgoEnd = [formatter stringFromDate:date];
        dateMonthAgoEnd should equal(@"31-08-2013 00:00:00");
    });

    it(@"should get local date of next month start without time", ^
    {
        date = [[date dateMonthAhead] dateMonthStart];
        NSString *dateMonthAheadStart = [formatter stringFromDate:date];
        dateMonthAheadStart should equal(@"01-10-2013 00:00:00");
    });

    it(@"should get local date of next month end without time", ^
    {
        date = [[date dateMonthAhead] dateMonthEnd];
        NSString *dateMonthAheadEnd = [formatter stringFromDate:date];
        dateMonthAheadEnd should equal(@"31-10-2013 00:00:00");
    });

    it(@"should get local date with changed month", ^
    {
        NSString *dateChanged = [formatter stringFromDate:[date dateBySettingMonth:7]];
        dateChanged should equal(@"04-07-2013 12:10:52");
    });

    it(@"should get local date with added month", ^
    {
        NSString *dateChanged = [formatter stringFromDate:[date dateByAddingMonth:4]];
        dateChanged should equal(@"04-01-2014 12:10:52") ;
    });
});

SPEC_END