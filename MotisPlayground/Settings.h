//
//  Settings.h
//  MotisPlayground
//
//  Created by Dmitry on 10/11/2017.
//  Copyright © 2017 Dmitry. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSTimeInterval HTTP_TIMEOUT;
extern BOOL LOG_HTTP_RESPONSE;


@interface Fonts : NSObject

+ (UIFont *)teamListTitle;
+ (UIFont *)teamListText;

@end
