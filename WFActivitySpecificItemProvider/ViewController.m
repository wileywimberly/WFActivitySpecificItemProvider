//
//  ViewController.m
//  WFActivitySpecificItemProvider
//
//  Created by Wiley Wimberly on 12/3/12.
//  Copyright (c) 2012 Warm Fuzzy Apps LLC. All rights reserved.
//

#import "ViewController.h"

#import "WFActivitySpecificItemProvider.h"

@interface ViewController ()

- (IBAction)doit:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doit:(UIButton *)sender {

    // Use a dictionary
    WFActivitySpecificItemProvider *provider1 =
    [[WFActivitySpecificItemProvider alloc]
     initWithPlaceholderItem:@""
     items:@{
     WFActivitySpecificItemProviderTypeDefault : @"Hello, World!",
     UIActivityTypePostToFacebook : @"Hello, Facebook!",
     UIActivityTypePostToTwitter : @"Hello, Twitter!"
     }];


    // Use a block
    WFActivitySpecificItemProvider *provider2 =
    [[WFActivitySpecificItemProvider alloc]
     initWithPlaceholderItem:@""
     block:^(NSString *activityType){

         NSString *message = nil;

         if ([activityType isEqual:UIActivityTypePostToFacebook]) {

             message = @"Goodbye, Facebook!";

         } else if ([activityType isEqual:UIActivityTypePostToTwitter]) {

             message = @"Goodbye, Twitter!";

         } else {

             message = @"Goodbye, World!";
         }

         return message;
     }];

    UIActivityViewController *avc = [[UIActivityViewController alloc]
                                     initWithActivityItems:@[provider1, provider2]
                                     applicationActivities:nil];


    [avc setCompletionHandler:^(NSString *activityType, BOOL completed) {

        if (activityType) {

            NSLog(@"activity: %@ completed: %@",
                  activityType,
                  completed ? @"YES" : @"NO");
        } else {

            NSLog(@"No activity was selected. (Cancel)");
        }
        
    }];
    
    [self presentViewController:avc
                       animated:YES
                     completion:nil];
    

}

@end
