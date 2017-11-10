//
//  TeamListModel.h
//  MotisPlayground
//
//  Created by Dmitry on 10/11/2017.
//  Copyright © 2017 Dmitry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MappedObject.h"

@class TeamMember;

@interface TeamList : MappedObject
@property (nonatomic, strong) NSArray<TeamMember*> *team;
@end


@interface TeamMember : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSDictionary *phones;

@property (readonly) NSString *phonesString;
@end
