//
//  NSDate+TimeSpec.mm
//  NSDateCategoriesSpec
//
//  Created by Alexey Belkevich on 9/3/13.
//  Copyright (c) 2013 okolodev. All rights reserved.
//

#import "NSDate+Time.h"
#import "NSDate+Day.h"
#import "NSDate+Month.h"
#import "NSDate+Year.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(NSDateTimeSpec)

describe(@"Date with time", ^
{
    __block NSDate *date;
    __block NSDateFormatter *formatter;

    beforeEach(^
               {
                   formatter = [[NSDateFormatter alloc] init];
                   [formatter setDateFormat:@"yyyy'-'MM'-'dd HH:mm:ss"];
                   date = [formatter dateFromString:@"2014-01-02 10:20:30"];
               });

    it(@"should get local hour", ^
    {
        date.hour should equal(10);
    });

    it(@"should get local minute", ^
    {
        date.minute should equal(20);
    });

    it(@"should get local second", ^
    {
        date.second should equal(30);
    });

    it(@"should get date with changed local hour", ^
    {
        date = [date dateBySettingHour:22];
        date.year should equal(2014);
        date.month should equal(1);
        date.day should equal(2);
        date.hour should equal(22);
        date.minute should equal(20);
        date.second should equal(30);
    });

    it(@"should get date with changed local minute", ^
    {
        date = [date dateBySettingMinute:11];
        date.year should equal(2014);
        date.month should equal(1);
        date.day should equal(2);
        date.hour should equal(10);
        date.minute should equal(11);
        date.second should equal(30);
    });

    it(@"should get date with changed local second", ^
    {
        date = [date dateBySettingSecond:33];
        date.year should equal(2014);
        date.month should equal(1);
        date.day should equal(2);
        date.hour should equal(10);
        date.minute should equal(20);
        date.second should equal(33);
    });

    it(@"should get date with changed local hour, minute, second", ^
    {
        date = [date dateBySettingHour:22 minute:11 second:33];
        date.year should equal(2014);
        date.month should equal(1);
        date.day should equal(2);
        date.hour should equal(22);
        date.minute should equal(11);
        date.second should equal(33);
    });

    it(@"should get date with added hour", ^
    {
        date = [date dateByAddingHour:1];
        date.year should equal(2014);
        date.month should equal(1);
        date.day should equal(2);
        date.hour should equal(11);
        date.minute should equal(20);
        date.second should equal(30);
    });

    it(@"should get date with added minute", ^
    {
        date = [date dateByAddingMinute:1];
        date.year should equal(2014);
        date.month should equal(1);
        date.day should equal(2);
        date.hour should equal(10);
        date.minute should equal(21);
        date.second should equal(30);
    });

    it(@"should get date with added second", ^
    {
        date = [date dateByAddingSecond:5];
        date.year should equal(2014);
        date.month should equal(1);
        date.day should equal(2);
        date.hour should equal(10);
        date.minute should equal(20);
        date.second should equal(35);
    });

    it(@"should get date with added hour, minute, second", ^
    {
        date = [date dateByAddingHour:1 minute:2 second:3];
        date.year should equal(2014);
        date.month should equal(1);
        date.day should equal(2);
        date.hour should equal(11);
        date.minute should equal(22);
        date.second should equal(33);
    });
});

SPEC_END
