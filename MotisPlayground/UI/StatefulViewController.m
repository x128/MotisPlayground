//
//  StatefulViewController.m
//  MotisPlayground
//
//  Created by Dmitry on 10/11/2017.
//  Copyright © 2017 Dmitry. All rights reserved.
//

#import "StatefulViewController.h"

@implementation StatefulViewController {
    DisplayState m_state;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.state = DisplayStateOk;
}

- (void)setState:(DisplayState)state {
    m_state = state;
}

- (DisplayState)state {
    return m_state;
}

@end
