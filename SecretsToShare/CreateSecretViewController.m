//
//  CreateSecretViewController.m
//  SecretsToShare
//
//  Created by Ran Tao on 8.30.12.
//  Copyright (c) 2012 Ran Tao. All rights reserved.
//

#import <MobileCoreServices/MobileCoreServices.h>
#import "CreateSecretViewController.h"
#import "SecretStore.h"
#import "Secret.h"

@interface CreateSecretViewController () <UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@end

@implementation CreateSecretViewController
@synthesize secretTextView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIBarButtonItem *addImage = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(pushAddImage)];
    self.navigationItem.rightBarButtonItem=addImage;
}

- (void)viewDidUnload
{
    [self setSecretTextView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void) pushAddImage{
    //push a new image view controller and save the camera or user's library
    UIImagePickerController *ipc = [UIImagePickerController new];
    ipc.delegate = self;
    ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self.navigationController pushViewController:ipc animated:YES];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.secretTextView resignFirstResponder];
}


- (IBAction)shareSecretButtonPressed:(UIButton *)sender {
    NSString *secretText = self.secretTextView.text;
    if (![secretText isEqualToString:@""]) {
        Secret *secret  = [SecretStore createSecret];
        secret.entry = secretText;
        secret.date =  [NSDate date];
        [SecretStore save];
    }
    self.secretTextView.text = @"";
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
