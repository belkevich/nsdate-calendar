//
//  NSDate+DaySpec.mm
//  NSDateCategoriesSpec
//
//  Created by Alexey Belkevich on 9/3/13.
//  Copyright (c) 2013 okolodev. All rights reserved.
//

#import "NSDate+Day.h"
#import "NSDate+Time.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(NSDateDaySpec)

NSTimeInterval const timeInterval = 1378236404.764846;

describe(@"Date", ^
{
    __block NSDate *date;
    __block NSDateFormatter *formatter;

    beforeEach(^
               {
                   date = [[NSDate alloc] initWithTimeIntervalSince1970:timeInterval];
                   formatter = [[NSDateFormatter alloc] init];
               });

    it(@"should create check date with time interval", ^
    {
        [date description] should equal(@"2013-09-03 19:26:44 +0000");
    });

    it(@"should get day ", ^
    {
        [formatter setDateFormat:@"dd"];
        NSString *checkDay = [formatter stringFromDate:date];
        NSString *calcDay = [NSString stringWithFormat:@"%.2d", date.day];
        calcDay should equal(checkDay);
    });

    it(@"should get today date without time", ^
    {
        NSDate *today = [date dateToday];
        today.day should equal(date.day);
        today.hour should equal(0);
        today.minute should equal(0);
        today.second should equal(0);
    });

    it(@"should get yesterday date without time", ^
    {
        NSDate *yesterday = [date dateYesterday];
        yesterday.day should equal(date.day - 1);
        yesterday.hour should equal(0);
        yesterday.minute should equal(0);
        yesterday.second should equal(0);
    });

    it(@"should get tomorrow date without time", ^
    {
        NSDate *tomorrow = [date dateTomorrow];
        tomorrow.day should equal(date.day + 1);
        tomorrow.hour should equal(0);
        tomorrow.minute should equal(0);
        tomorrow.second should equal(0);
    });

    it(@"should get date with changed day", ^
    {
        NSDate *changedDate = [date dateBySettingDay:12];
        [formatter setDateFormat:@"dd"];
        NSString *calcDay = [formatter stringFromDate:changedDate];
        calcDay should equal(@"12");
    });

    it(@"should get date with added day", ^
    {
        NSDate *changedDate = [date dateByAddingDays:8];
        [changedDate description] should equal(@"2013-09-11 19:26:44 +0000");
    });

});

SPEC_END