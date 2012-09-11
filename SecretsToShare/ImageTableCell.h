//
//  ImageTableCell.h
//  SecretsToShare
//
//  Created by Ran Tao on 9.11.12.
//  Copyright (c) 2012 Ran Tao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageTableCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *timeLabel;
@property (nonatomic, weak) IBOutlet UIImageView *photo;

@end
