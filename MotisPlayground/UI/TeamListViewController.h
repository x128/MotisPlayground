//
//  TeamListViewController.h
//  MotisPlayground
//
//  Created by Dmitry on 09/11/2017.
//  Copyright © 2017 Dmitry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StatefulViewController.h"

@protocol TeamListDataSource;

@interface TeamListViewController : StatefulViewController
{
@protected
    id<TeamListDataSource> _Nonnull m_dataSource;
}

- (instancetype _Nonnull)initWithDataSource:(id<TeamListDataSource> _Nonnull)dataSource;

@end

