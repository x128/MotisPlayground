//
//  DataSourceFactory.m
//  MotisPlayground
//
//  Created by Dmitry on 10/11/2017.
//  Copyright © 2017 Dmitry. All rights reserved.
//

#import "DataSourceFactory.h"
#import "TeamListDataSourceImpl.h"

@implementation DataSourceFactory

- (id<TeamListDataSource>)teamListDataSource {
    return [TeamListDataSourceImpl new];
}

@end
