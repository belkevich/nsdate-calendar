//
//  NSDate+MonthSpec.mm
//  NSDateCategoriesSpec
//
//  Created by Alexey Belkevich on 9/4/13.
//  Copyright (c) 2013 okolodev. All rights reserved.
//

#import "NSDate+Month.h"
#import "NSDate+Day.h"
#import "NSDate+Time.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(NSDateMonthSpec)

describe(@"Date", ^
{
    __block NSDate *date;

    beforeEach(^
               {
                   date = [[NSDate alloc] initWithTimeIntervalSince1970:1378296652.792332];
               });

    it(@"should create check date with time interval", ^
    {
        [date description] should equal(@"2013-09-04 12:10:52 +0000");
    });

    it(@"should get month", ^
    {
        date.month should equal(9);
    });

    it(@"should get month start date without time", ^
    {
        NSDate *dateMonthStart = [date dateMonthStart];
        dateMonthStart.month should equal(date.month);
        dateMonthStart.day should equal(1);
        dateMonthStart.hour should equal(0);
        dateMonthStart.minute should equal(0);
        dateMonthStart.second should equal(0);
    });

    it(@"should get month end date without time", ^
    {
        NSDate *dateMonthEnd = [date dateMonthEnd];
        dateMonthEnd.month should equal(date.month);
        dateMonthEnd.day should equal(30);
        dateMonthEnd.hour should equal(0);
        dateMonthEnd.minute should equal(0);
        dateMonthEnd.second should equal(0);
    });

    it(@"should get date with same day and time but month ago", ^
    {
        NSDate *dateMonthAgo = [date dateMonthAgo];
        dateMonthAgo.month should equal(date.month - 1);
        dateMonthAgo.day should equal(date.day);
        dateMonthAgo.hour should equal(date.hour);
        dateMonthAgo.minute should equal(date.minute);
        dateMonthAgo.second should equal(date.second);
    });

    it(@"should get date with same day and time but month ahead", ^
    {
        NSDate *dateMonthAhead = [date dateMonthAhead];
        dateMonthAhead.month should equal(date.month + 1);
        dateMonthAhead.day should equal(date.day);
        dateMonthAhead.hour should equal(date.hour);
        dateMonthAhead.minute should equal(date.minute);
        dateMonthAhead.second should equal(date.second);
    });

    it(@"should get date of previous month start without time", ^
    {
        NSDate *dateMonthAgoStart = [date dateMonthAgoStart];
        dateMonthAgoStart.month should equal(date.month - 1);
        dateMonthAgoStart.day should equal(1);
        dateMonthAgoStart.hour should equal(0);
        dateMonthAgoStart.minute should equal(0);
        dateMonthAgoStart.second should equal(0);
    });

    it(@"should get date of previous month end without time", ^
    {
        NSDate *dateMonthAgoEnd = [date dateMonthAgoEnd];
        dateMonthAgoEnd.month should equal(date.month - 1);
        dateMonthAgoEnd.day should equal(31);
        dateMonthAgoEnd.hour should equal(0);
        dateMonthAgoEnd.minute should equal(0);
        dateMonthAgoEnd.second should equal(0);
    });

    it(@"should get date of next month start without time", ^
    {
        NSDate *dateMonthAheadStart = [date dateMonthAheadStart];
        dateMonthAheadStart.month should equal(date.month + 1);
        dateMonthAheadStart.day should equal(1);
        dateMonthAheadStart.hour should equal(0);
        dateMonthAheadStart.minute should equal(0);
        dateMonthAheadStart.second should equal(0);
    });

    it(@"should get date of next month end without time", ^
    {
        NSDate *dateMonthAheadEnd = [date dateMonthAheadEnd];
        dateMonthAheadEnd.month should equal(date.month + 1);
        dateMonthAheadEnd.day should equal(31);
        dateMonthAheadEnd.hour should equal(0);
        dateMonthAheadEnd.minute should equal(0);
        dateMonthAheadEnd.second should equal(0);
    });

    it(@"should get date with changed month", ^
    {
        NSDate *dateChanged = [date dateBySettingMonth:7];
        [dateChanged description] should equal(@"2013-07-04 12:10:52 +0000");
    });

    it(@"should get get with added month", ^
    {
        NSDate *dateChanged = [date dateByAddingMonth:1];
        [dateChanged description] should equal(@"2013-10-04 12:10:52 +0000");
    });
});

SPEC_END