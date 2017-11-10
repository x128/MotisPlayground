//
//  MappedObject.m
//  MotisPlayground
//
//  Created by Dmitry on 10/11/2017.
//  Copyright © 2017 Dmitry. All rights reserved.
//

#import "MappedObject.h"
#import <Motis/Motis.h>

@implementation MappedObject

- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self != nil) {
        [self mts_setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end
