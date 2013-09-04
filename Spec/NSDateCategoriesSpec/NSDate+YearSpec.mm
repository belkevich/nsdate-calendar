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

describe(@"Date", ^
{
    __block NSDate *date;

    beforeEach(^
               {
                   date = [[NSDate alloc] initWithTimeIntervalSince1970:1378305345.243844];
               });

    it(@"should create check date with time interval", ^
    {
        [date description] should equal(@"2013-09-04 14:35:45 +0000");
    });

    it(@"should get year", ^
    {
        date.year should equal(2013);
    });

    it(@"should get year start date without time", ^
    {
        NSDate *dateYearStart = [date dateYearStart];
        dateYearStart.year should equal(date.year);
        dateYearStart.month should equal(1);
        dateYearStart.day should equal(1);
        dateYearStart.hour should equal(0);
        dateYearStart.minute should equal(0);
        dateYearStart.second should equal(0);
    });

    it(@"should get year end date without time", ^
    {
        NSDate *dateYearEnd = [date dateYearEnd];
        dateYearEnd.year should equal(date.year);
        dateYearEnd.month should equal(12);
        dateYearEnd.day should equal(31);
        dateYearEnd.hour should equal(0);
        dateYearEnd.minute should equal(0);
        dateYearEnd.second should equal(0);
    });

    it(@"should get date with same day and time but year ago", ^
    {
        NSDate *dateYearAgo = [date dateYearAgo];
        dateYearAgo.year should equal(date.year - 1);
        dateYearAgo.month should equal(date.month);
        dateYearAgo.day should equal(date.day);
        dateYearAgo.hour should equal(date.hour);
        dateYearAgo.minute should equal(date.minute);
        dateYearAgo.second should equal(date.second);
    });

    it(@"should get date with same day and time but year ahead", ^
    {
        NSDate *dateYearAhead = [date dateYearAhead];
        dateYearAhead.year should equal(date.year + 1);
        dateYearAhead.month should equal(date.month);
        dateYearAhead.day should equal(date.day);
        dateYearAhead.hour should equal(date.hour);
        dateYearAhead.minute should equal(date.minute);
        dateYearAhead.second should equal(date.second);
    });

    it(@"should get date of previous year start without time", ^
    {
        NSDate *dateYearAgoStart = [date dateYearAgoStart];
        dateYearAgoStart.year should equal(date.year - 1);
        dateYearAgoStart.month should equal(1);
        dateYearAgoStart.day should equal(1);
        dateYearAgoStart.hour should equal(0);
        dateYearAgoStart.minute should equal(0);
        dateYearAgoStart.second should equal(0);
    });

    it(@"should get date of previous year end without time", ^
    {
        NSDate *dateYearAgoEnd = [date dateYearAgoEnd];
        dateYearAgoEnd.year should equal(date.year - 1);
        dateYearAgoEnd.month should equal(12);
        dateYearAgoEnd.day should equal(31);
        dateYearAgoEnd.hour should equal(0);
        dateYearAgoEnd.minute should equal(0);
        dateYearAgoEnd.second should equal(0);
    });

    it(@"should get date of next year start without time", ^
    {
        NSDate *dateYearAheadStart = [date dateYearAheadStart];
        dateYearAheadStart.year should equal(date.year + 1);
        dateYearAheadStart.month should equal(1);
        dateYearAheadStart.day should equal(1);
        dateYearAheadStart.hour should equal(0);
        dateYearAheadStart.minute should equal(0);
        dateYearAheadStart.second should equal(0);
    });

    it(@"should get date of next year end without time", ^
    {
        NSDate *dateYearAheadEnd = [date dateYearAheadEnd];
        dateYearAheadEnd.year should equal(date.year + 1);
        dateYearAheadEnd.month should equal(12);
        dateYearAheadEnd.day should equal(31);
        dateYearAheadEnd.hour should equal(0);
        dateYearAheadEnd.minute should equal(0);
        dateYearAheadEnd.second should equal(0);
    });

    it(@"should get date with changed year", ^
    {
        NSDate *dateChanged = [date dateBySettingYear:2011];
        [dateChanged description] should equal(@"2011-09-04 14:35:45 +0000");
    });

    it(@"should get get with added year", ^
    {
        NSDate *dateChanged = [date dateByAddingYear:-1];
        [dateChanged description] should equal(@"2012-09-04 14:35:45 +0000");
    });
});

SPEC_END