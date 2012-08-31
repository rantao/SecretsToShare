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

@interface CreateSecretViewController () <UINavigationControllerDelegate,UIImagePickerControllerDelegate, UIScrollViewDelegate>
@property (nonatomic, strong) NSData* imageData;
@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation CreateSecretViewController
@synthesize secretTextView;
@synthesize shareButton;
@synthesize userImage;

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
    //UIScrollView * scrollView = (UIScrollView*)self.view;
    //self.scrollView = (UIScrollView*)self.view;
    //self.scrollView.contentSize = self.view.frame.size;
}

//-(void) viewDidAppear:(BOOL)animated {
//    self.scrollView = (UIScrollView*)self.view;
//
//    if (self.userImage) {
//        self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height + self.userImage.image.size.height);
//
//        //self.scrollView.contentSize = self.view.bounds.size;
//    }
//    else {
//        self.scrollView.contentSize = self.view.bounds.size;
//    }
//}


- (void)viewDidUnload
{
    [self setSecretTextView:nil];
    [self setUserImage:nil];
    [self setShareButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void) pushAddImage{
    //push a new image view controller and save the camera or user's library
    UIImagePickerController *ipc = [UIImagePickerController new];
    ipc.delegate = self;
    ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    ipc.mediaTypes = [NSArray arrayWithObject:(NSString*) kUTTypeImage];
    ipc.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    [self presentViewController:ipc animated:YES completion:nil];
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.imageData = UIImageJPEGRepresentation(image, 1.0);
    self.userImage.image = image;
    self.userImage.hidden = NO;
    //self.secretTextView.frame.origin = CGPointMake(self.secretTextView.frame.origin.x, self.secretTextView.frame.origin.y + self.userImage.bounds.size.height);
    //self.secretTextView.frame = CGRectOffset(self.secretTextView.frame, 0, self.userImage.frame.size.height + 30.0);
    //self.shareButton.frame = CGRectOffset(self.shareButton.frame, 0, self.userImage.frame.size.height + 30.0);
    //self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    //self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height + self.userImage.image.size.height);
    //self.scrollView.contentSize = self.view.frame.size;
    [self dismissViewControllerAnimated:YES completion:nil];

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
        secret.imageData = self.imageData;
        [SecretStore save];
    }
    self.secretTextView.text = @"";
    self.userImage.hidden = YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
