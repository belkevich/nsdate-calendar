//
//  ExampleSpec.mm
//  NSDateCategoriesSpec
//
//  Created by Alexey Belkevich on 8/6/13.
//  Copyright (c) 2013 okolodev. All rights reserved.
//

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(ExampleSpec)

describe(@"Exampe", ^
{
    it(@"should pass", ^
    {
        YES should be_truthy;
    });
});

SPEC_END

