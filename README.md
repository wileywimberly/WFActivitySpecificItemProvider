# WFActivitySpecificItemProvider

UIActivityItemProvider subclass that provides activity specific items. Used with UIActivityViewController to have different items depending on which activity is selected.

```objective-c
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
``` 
