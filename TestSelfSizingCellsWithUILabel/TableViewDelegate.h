//
//  TableViewDelegate.h
//  TestUILabel
//
//  Created by Sean Antony on 05/08/2015.
//  Copyright (c) 2015 Sean Antony. All rights reserved.
//

#import "Switchable.h"

@interface TableViewDelegate : NSObject<UITableViewDelegate>

@property (nonatomic) NSObject<Switchable> *switchController;

- (instancetype)initWithSwitchController:(NSObject<Switchable> *)switchController;

@end
