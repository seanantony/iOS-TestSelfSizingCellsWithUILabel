//
//  TableViewDataSource.h
//  TestUILabel
//
//  Created by Sean Antony on 05/08/2015.
//  Copyright (c) 2015 Sean Antony. All rights reserved.
//

#import "Switchable.h"

@interface TableViewDataSource : NSObject<UITableViewDataSource>

@property (nonatomic) NSArray *dataSource;
@property (nonatomic) NSObject<Switchable> *switchController;

- (instancetype)initWithSwitchController:(NSObject<Switchable> *)switchController;

@end
