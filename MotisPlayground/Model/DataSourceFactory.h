//
//  DataSourceFactory.h
//  MotisPlayground
//
//  Created by Dmitry on 10/11/2017.
//  Copyright © 2017 Dmitry. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TeamListDataSource;

@interface DataSourceFactory : NSObject

- (id<TeamListDataSource>)teamListDataSource;

@end
