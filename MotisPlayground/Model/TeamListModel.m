//
//  TeamListModel.m
//  MotisPlayground
//
//  Created by Dmitry on 10/11/2017.
//  Copyright © 2017 Dmitry. All rights reserved.
//

#import "TeamListModel.h"
#import <Motis/Motis.h>

@implementation TeamList

+ (NSDictionary*)mts_arrayClassMapping {
    return @{
             mts_key(team) : TeamMember.class,
             };
}

@end

//-------------------------------------------------

@implementation TeamMember

+ (NSDictionary*)mts_mapping {
    return @{
             @"name" : mts_key(name),
             @"address" : mts_key(address),
             @"phones" : mts_key(phones),
             };
}

- (NSString *)phonesString {
    NSMutableArray *phonesArray = [[NSMutableArray alloc] init];
    [self.phones enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [phonesArray addObject:[NSString stringWithFormat:@"%@: %@", key, obj]];
    }];
    NSString *str = [phonesArray componentsJoinedByString:@"\n"];
    return str;
}

@end

