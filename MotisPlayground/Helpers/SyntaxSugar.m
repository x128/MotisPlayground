//
//  SyntaxSugar.m
//  MotisPlayground
//
//  Created by Dmitry on 10/11/2017.
//  Copyright © 2017 Dmitry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SyntaxSugar.h"

#pragma mark UIView
@implementation UIView (SyntaxSugar)

- (void)setShown:(BOOL)shown {
    [self setHidden:!shown];
}

@end


#pragma mark UILabel
@implementation UILabel (SyntaxSugar)

- (instancetype)initWithFont:(UIFont *)font
                   multiline:(BOOL)multiline {
    self = [super init];
    if (self) {
        self.font = font;
        self.numberOfLines = multiline ? 0 : 1;
    }
    return self;
}

@end


#pragma mark UITableView
@implementation UITableView (SyntaxSugar)

- (void)dontShowSeparatorsWithoutCells {
    self.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

@end
