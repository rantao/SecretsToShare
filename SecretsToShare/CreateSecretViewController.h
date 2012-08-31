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
- (IBAction)shareSecretButtonPressed:(UIButton *)sender;

@end
