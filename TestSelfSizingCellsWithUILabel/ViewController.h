//
//  ViewController.h
//  TestUILabel
//
//  Created by Sean Antony on 04/08/2015.
//  Copyright (c) 2015 Sean Antony. All rights reserved.
//

#import "TableViewDataSource.h"
#import "TableViewDelegate.h"
#import "Switchable.h"

@interface ViewController : UIViewController<Switchable>

@property (nonatomic) UILabel *topLabel;
@property (nonatomic) UISwitch *switchControl;
@property (nonatomic) UITableView *tableView;
@property (nonatomic) TableViewDataSource *tableViewDataSource;
@property (nonatomic) TableViewDelegate *tableViewDelegate;

@end

