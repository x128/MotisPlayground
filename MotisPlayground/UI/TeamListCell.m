//
//  TeamListCell.m
//  MotisPlayground
//
//  Created by Dmitry on 10/11/2017.
//  Copyright © 2017 Dmitry. All rights reserved.
//

#import "TeamListCell.h"
#import "SyntaxSugar.h"
#import "TeamListModel.h"
#import "Settings.h"

@implementation TeamListCell

CGFloat const contentMargin = 16;
CGFloat const nameWidthMultiplier = 0.45;
CGFloat const nameAddressMargin = 8;
CGFloat const addressMinTopMargin = 8;
CGFloat const weirdConstantToAdd = 2; // separator height + 1px ?

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self != nil) {
        self.name = [[UILabel alloc] initWithFont:[Fonts teamListTitle] multiline:YES];
        [self.contentView addSubview:self.name];

        self.address = [[UILabel alloc] initWithFont:[Fonts teamListText] multiline:YES];
        [self.contentView addSubview:self.address];

        self.phones = [[UILabel alloc] initWithFont:[Fonts teamListText] multiline:YES];
        [self.contentView addSubview:self.phones];

        [self setConstraints];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setConstraints {
    self.name.translatesAutoresizingMaskIntoConstraints = NO;
    [self.name.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:contentMargin].active = YES;
    [self.name.widthAnchor constraintEqualToAnchor:self.contentView.widthAnchor multiplier:nameWidthMultiplier].active = YES;
    [self.name.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:contentMargin].active = YES;
    
    self.phones.translatesAutoresizingMaskIntoConstraints = NO;
    [self.phones.leadingAnchor constraintEqualToAnchor:self.name.trailingAnchor constant:nameAddressMargin].active = YES;
    [self.phones.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-contentMargin].active = YES;
    [self.phones.topAnchor constraintEqualToAnchor:self.name.topAnchor].active = YES;

    self.address.translatesAutoresizingMaskIntoConstraints = NO;
    [self.address.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:contentMargin].active = YES;
    [self.address.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-contentMargin].active = YES;
    [self.address.topAnchor constraintGreaterThanOrEqualToAnchor:self.name.bottomAnchor constant:addressMinTopMargin].active = YES;
    [self.address.topAnchor constraintGreaterThanOrEqualToAnchor:self.phones.bottomAnchor constant:addressMinTopMargin].active = YES;
    [self.address.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-contentMargin].active = YES;
}

+ (CGFloat)heightForItem:(TeamMember *)item
               cellWidth:(CGFloat)width {
    NSDictionary *titleAttr = @{ NSFontAttributeName : [Fonts teamListTitle] };
    NSDictionary *textAttr = @{ NSFontAttributeName : [Fonts teamListText] };
    CGRect nameSize = [item.name boundingRectWithSize:CGSizeMake(width * nameWidthMultiplier, CGFLOAT_MAX)
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                           attributes:titleAttr
                                              context:nil];
    CGFloat phonesWidth = width - nameSize.size.width - 2 * contentMargin;
    CGRect phonesSize = [item.phonesString boundingRectWithSize:CGSizeMake(phonesWidth, CGFLOAT_MAX)
                                                        options:NSStringDrawingUsesLineFragmentOrigin
                                                     attributes:textAttr
                                                        context:nil];
    CGRect addressSize = [item.address boundingRectWithSize:CGSizeMake(width - 2 * contentMargin, CGFLOAT_MAX)
                                                    options:NSStringDrawingUsesLineFragmentOrigin
                                                 attributes:textAttr
                                                    context:nil];
    CGFloat height = contentMargin + MAX(nameSize.size.height, phonesSize.size.height) + addressMinTopMargin + addressSize.size.height + contentMargin;
    return height + weirdConstantToAdd;
}

@end
