//
//  NSDate+TimeSpec.mm
//  NSDateCategoriesSpec
//
//  Created by Alexey Belkevich on 9/3/13.
//  Copyright (c) 2013 okolodev. All rights reserved.
//

#import "NSDate+Time.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(NSDateTimeSpec)

describe(@"Date", ^
{
    __block NSDate *date;
    __block NSDateFormatter *formatter;

    beforeEach(^
               {
                   date = [[NSDate alloc] initWithTimeIntervalSince1970:1378195119.248413];
                   formatter = [[NSDateFormatter alloc] init];
               });

    it(@"should create check date with time interval", ^
    {
        [date description] should equal(@"2013-09-03 07:58:39 +0000");
    });

    it(@"should get hour", ^
    {
        [formatter setDateFormat:@"HH"];
        NSString *checkHour = [formatter stringFromDate:date];
        NSString *calcHour = [NSString stringWithFormat:@"%.2d", date.hour];
        calcHour should equal(checkHour);
    });

    it(@"should get minute", ^
    {
        [formatter setDateFormat:@"mm"];
        NSString *checkMinute = [formatter stringFromDate:date];
        NSString *calcMinute = [NSString stringWithFormat:@"%.2d", date.minute];
        calcMinute should equal(checkMinute);
    });

    it(@"should get second", ^
    {
        [formatter setDateFormat:@"ss"];
        NSString *checkSecond = [formatter stringFromDate:date];
        NSString *calcSecond = [NSString stringWithFormat:@"%.2d", date.second];
        calcSecond should equal(checkSecond);
    });

    it(@"should get date with changed hour", ^
    {
        NSDate *changedDate = [date dateBySettingHour:22];
        [formatter setDateFormat:@"HH"];
        NSString *calcHour = [formatter stringFromDate:changedDate];
        calcHour should equal(@"22");
    });

    it(@"should get date with changed minute", ^
    {
        NSDate *changedDate = [date dateBySettingMinute:11];
        [formatter setDateFormat:@"mm"];
        NSString *calcMinute = [formatter stringFromDate:changedDate];
        calcMinute should equal(@"11");
    });

    it(@"should get date with changed second", ^
    {
        NSDate *changedDate = [date dateBySettingSecond:33];
        [formatter setDateFormat:@"ss"];
        NSString *calcSecond = [formatter stringFromDate:changedDate];
        calcSecond should equal(@"33");
    });

    it(@"should get date with changed hour, minute, second", ^
    {
        NSDate *changedDate = [date dateBySettingHour:22 minute:11 second:33];
        [formatter setDateFormat:@"HH:mm:ss"];
        NSString *calcTime = [formatter stringFromDate:changedDate];
        calcTime should equal(@"22:11:33");
    });

    it(@"should get date with added hour", ^
    {
        NSDate *changedDate = [date dateByAddingHour:1];
        [changedDate description] should equal(@"2013-09-03 08:58:39 +0000");
    });

    it(@"should get date with added minute", ^
    {
        NSDate *changedDate = [date dateByAddingMinute:1];
        [changedDate description] should equal(@"2013-09-03 07:59:39 +0000");
    });
    it(@"should get date with added second", ^
    {
        NSDate *changedDate = [date dateByAddingSecond:1];
        [changedDate description] should equal(@"2013-09-03 07:58:40 +0000");
    });

    it(@"should get date with added hour, minute, second", ^
    {
        NSDate *changedDate = [date dateByAddingHour:1 minute:2 second:3];
        [changedDate description] should equal(@"2013-09-03 09:00:42 +0000");
    });

});

SPEC_END
