//
//  WFActivitySpecificItemProvider.h
//  ShareMe
//
//  Created by Wiley Wimberly on 12/2/12.
//  Copyright (c) 2012 Warm Fuzzy Apps LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

NSString *const WFActivitySpecificItemProviderTypeDefault;

typedef id (^WFActivitySpecificItemProviderItemBlock)(NSString *activityType);

@interface WFActivitySpecificItemProvider : UIActivityItemProvider

@property (nonatomic, copy) NSDictionary *items;

@property (nonatomic, copy) WFActivitySpecificItemProviderItemBlock itemBlock;

- (id)initWithPlaceholderItem:(id)placeholderItem
                        items:(NSDictionary *)items
                        block:(WFActivitySpecificItemProviderItemBlock)itemBlock;

- (id)initWithPlaceholderItem:(id)placeholderItem
                        items:(NSDictionary *)items;

- (id)initWithPlaceholderItem:(id)placeholderItem
                        block:(WFActivitySpecificItemProviderItemBlock)itemBlock;

- (id)initWithPlaceholderItem:(id)placeholderItem;

@end
