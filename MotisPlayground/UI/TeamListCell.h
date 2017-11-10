//
//  TeamListCell.h
//  MotisPlayground
//
//  Created by Dmitry on 10/11/2017.
//  Copyright © 2017 Dmitry. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TeamMember;

@interface TeamListCell : UITableViewCell

@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UILabel *address;
@property (nonatomic, strong) UILabel *phones;

+ (CGFloat)heightForItem:(TeamMember *)item
               cellWidth:(CGFloat)width;

@end
