//
//  NSDate+WeekSpec.mm
//  NSDateCategoriesSpec
//
//  Created by Alexey Belkevich on 9/5/13.
//  Copyright (c) 2013 okolodev. All rights reserved.
//

#import <OCFuntime/OCFuntime+Methods.h>
#import "NSDate+Week.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(NSDateWeekSpec)

describe(@"Date with week", ^
{
    __block NSDate *date;
    __block NSDateFormatter *formatter;
    __block OCFuntime *funtime;

    beforeEach(^
               {
                   formatter = [[NSDateFormatter alloc] init];
                   [formatter setDateFormat:@"dd-MM-y HH:mm:ss"];
                   date = [formatter dateFromString:@"01-08-2013 13:04:35"];
                   funtime = [[OCFuntime alloc] init];
               });

    afterEach(^
              {
                  [funtime revertAllMethods];
              });

    it(@"should get local week of month number", ^
    {
        date.weekOfMonth should equal(1);
    });

    it(@"should get local week of year number", ^
    {
        date.weekOfYear should equal(31);
    });

    it(@"should get local weekday", ^
    {
        date.weekday should equal(5);
    });

    it(@"should get local week start date without time", ^
    {
        NSString *dateWeekStart = [formatter stringFromDate:[date dateWeekStart]];
        dateWeekStart should equal(@"28-07-2013 00:00:00");
    });

    it(@"should get local week end date without time", ^
    {
        NSString *dateWeekEnd = [formatter stringFromDate:[date dateWeekEnd]];
        dateWeekEnd should equal(@"03-08-2013 00:00:00");
    });

    it(@"should get local date week ago", ^
    {
        NSString *dateWeekAgo = [formatter stringFromDate:[date dateWeekAgo]];
        dateWeekAgo should equal(@"25-07-2013 13:04:35");
    });

    it(@"should get local date week ahead", ^
    {
        NSString *dateWeekAhead = [formatter stringFromDate:[date dateWeekAhead]];
        dateWeekAhead should equal(@"08-08-2013 13:04:35");
    });

    it(@"should get local date with changed weekday if first weekday sunday ", ^
    {
        [funtime changeClass:NSCalendar.class classMethod:@selector(currentCalendar)
              implementation:^
              {
                  NSCalendar *calendar = [[NSCalendar alloc]
                                                      initWithCalendarIdentifier:NSGregorianCalendar];
                  calendar.firstWeekday = 1;
                  return calendar;
              }];
        NSString *dateChanged = [formatter stringFromDate:[date dateBySettingWeekday:1]];
        dateChanged should equal(@"28-07-2013 13:04:35");
    });

    it(@"should get local date with changed weekday if first weekday monday ", ^
    {
        [funtime changeClass:NSCalendar.class classMethod:@selector(currentCalendar)
              implementation:^
              {
                  NSCalendar *calendar = [[NSCalendar alloc]
                                                      initWithCalendarIdentifier:NSGregorianCalendar];
                  calendar.firstWeekday = 2;
                  return calendar;
              }];
        NSString *dateChanged = [formatter stringFromDate:[date dateBySettingWeekday:1]];
        dateChanged should equal(@"28-07-2013 13:04:35");
    });

    it(@"should get local date with changed week of year", ^
    {
        NSString *dateChanged = [formatter stringFromDate:[date dateBySettingWeekOfYear:2]];
        dateChanged should equal(@"10-01-2013 13:04:35");
    });

    it(@"should get local date with changed week of month", ^
    {
        NSString *dateChanged = [formatter stringFromDate:[date dateBySettingWeekOfMonth:3]];
        dateChanged should equal(@"15-08-2013 13:04:35");
    });

    it(@"should get local date with added week", ^
    {
        NSString *dateChanged = [formatter stringFromDate:[date dateByAddingWeek:1]];
        dateChanged should equal(@"08-08-2013 13:04:35");
    });
});

SPEC_END