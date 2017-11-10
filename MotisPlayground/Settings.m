//
//  Settings.m
//  MotisPlayground
//
//  Created by Dmitry on 10/11/2017.
//  Copyright © 2017 Dmitry. All rights reserved.
//

#import "Settings.h"

NSTimeInterval HTTP_TIMEOUT = 120;
BOOL LOG_HTTP_RESPONSE = YES;


@implementation Fonts

+ (UIFont *)teamListTitle {
    return [UIFont boldSystemFontOfSize:20];
}

+ (UIFont *)teamListText {
    return [UIFont systemFontOfSize:13];
}

@end
