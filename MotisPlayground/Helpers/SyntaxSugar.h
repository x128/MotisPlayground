//
//  SyntaxSugar.h
//  MotisPlayground
//
//  Created by Dmitry on 10/11/2017.
//  Copyright © 2017 Dmitry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIView (SyntaxSugar)

- (void)setShown:(BOOL)shown;

@end

@interface UILabel (SyntaxSugar)

- (instancetype)initWithFont:(UIFont *)font
                   multiline:(BOOL)multiline;

@end


@interface UITableView (SyntaxSugar)

- (void)dontShowSeparatorsWithoutCells;

@end
