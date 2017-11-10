//
//  StatefulViewController.h
//  MotisPlayground
//
//  Created by Dmitry on 10/11/2017.
//  Copyright © 2017 Dmitry. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, DisplayState) {
    DisplayStateOk = 0,
    DisplayStateLoading,
    DisplayStateNoData,
    DisplayStateError,
};

@interface StatefulViewController : UIViewController

@property (assign) DisplayState state;

@end
