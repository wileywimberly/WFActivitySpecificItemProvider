//
//  WFActivitySpecificItemProvider.m
//  ShareMe
//
//  Created by Wiley Wimberly on 12/2/12.
//  Copyright (c) 2012 Warm Fuzzy Apps LLC. All rights reserved.
//

#import "WFActivitySpecificItemProvider.h"

NSString *const WFActivitySpecificItemProviderTypeDefault =
    @"WFActivitySpecificItemProviderTypeDefault";

@implementation WFActivitySpecificItemProvider

- (id)initWithPlaceholderItem:(id)placeholderItem
                        items:(NSDictionary *)items
                        block:(WFActivitySpecificItemProviderItemBlock)itemBlock
{
    self = [super initWithPlaceholderItem:placeholderItem];

    if (self) {

        _items = [items copy];
        _itemBlock = [itemBlock copy];
    }

    return self;
}

- (id)initWithPlaceholderItem:(id)placeholderItem
                        items:(NSDictionary *)items
{
    return [self initWithPlaceholderItem:placeholderItem
                                   items:items
                                   block:nil];
}

- (id)initWithPlaceholderItem:(id)placeholderItem
                        block:(WFActivitySpecificItemProviderItemBlock)itemBlock
{
    return [self initWithPlaceholderItem:placeholderItem
                                   items:nil
                                   block:itemBlock];
}

- (id)initWithPlaceholderItem:(id)placeholderItem
{
    return [self initWithPlaceholderItem:placeholderItem
                                   items:nil
                                   block:nil];
}

- (id)item
{
    id item = nil;

    // check items dictionary first
    item = [self items][[self activityType]];

    if (item)
        return item;

    // try calling block
    if ([self itemBlock])
        item = [self itemBlock]([self activityType]);

    if (item)
        return item;

    // check items dictionary for default
    item = [self items][WFActivitySpecificItemProviderTypeDefault];

    if (item)
        return item;

    // return placeholder as last resort
    return [self placeholderItem];
}

@end
