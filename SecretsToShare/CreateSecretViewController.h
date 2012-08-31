//
//  CreateSecretViewController.h
//  SecretsToShare
//
//  Created by Ran Tao on 8.30.12.
//  Copyright (c) 2012 Ran Tao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateSecretViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *secretTextView;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
- (IBAction)shareSecretButtonPressed:(UIButton *)sender;

@end
