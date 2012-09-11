//
//  ImageTableCell.m
//  SecretsToShare
//
//  Created by Ran Tao on 9.11.12.
//  Copyright (c) 2012 Ran Tao. All rights reserved.
//

#import "ImageTableCell.h"

@implementation ImageTableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
