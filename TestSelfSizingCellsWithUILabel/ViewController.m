//
//  ViewController.m
//  TestUILabel
//
//  Created by Sean Antony on 04/08/2015.
//  Copyright (c) 2015 Sean Antony. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell1.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view setBackgroundColor:[UIColor grayColor]];
    
    [self setTopLabel:[UILabel new]];
    [self.topLabel setNumberOfLines:0];
    [self.topLabel setFont:[UIFont systemFontOfSize:13]];
    [self.topLabel setTextColor:[UIColor whiteColor]];
    [self.topLabel setText:@"This demo app has a table view consisting of one table view cell class that has one UILabel.\n\nThe switch control activates the consequences of setting the text of the label exclusively in one of the following methods:\n\n(OFF) - tableView:willDisplayCell:forRowAtIndexPath:\n(ON) - tableView:cellForRowAtIndexPath:\n\nUse the switch control and scroll the table view to see the change in self sizing cell auto layout behaviour."];
    
    [self setSwitchControl:[UISwitch new]];
    [self.switchControl setSelected:NO];
    [self.switchControl addTarget:self action:@selector(switchControlDidTouchUpInside) forControlEvents:UIControlEventTouchUpInside];
    
    [self setTableView:[UITableView new]];
    [self setTableViewDataSource:[[TableViewDataSource alloc] initWithSwitchController:self]];
    [self setTableViewDelegate:[[TableViewDelegate alloc] initWithSwitchController:self]];
    [self.tableView setDataSource:self.tableViewDataSource];
    [self.tableView setDelegate:self.tableViewDelegate];
    [self.tableView setEstimatedRowHeight:50];
    [self.tableView setRowHeight:UITableViewAutomaticDimension];
    NSString *tableViewCell1 = NSStringFromClass([TableViewCell1 class]);
    [self.tableView registerNib:[UINib nibWithNibName:tableViewCell1 bundle:nil] forCellReuseIdentifier:tableViewCell1];
    
    [self setupAutoLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)switchControlDidTouchUpInside {
    [self.tableView reloadData];
}

- (BOOL)isOn {
    return self.switchControl.isOn;
}

#pragma mark - Auto Layout

- (void)setupAutoLayout {
    [self.view addSubview:self.topLabel];
    [self.view addSubview:self.switchControl];
    [self.view addSubview:self.tableView];
    for (UIView *view in self.view.subviews) {
        [view removeConstraints:view.constraints];
        [view setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    NSMutableArray *constraints = [NSMutableArray new];
    //Top Label
    [constraints addObject:[NSLayoutConstraint constraintWithItem:self.topLabel
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.topLabel.superview
                                                        attribute:NSLayoutAttributeTop
                                                       multiplier:1
                                                         constant:24]];
    [constraints addObject:[NSLayoutConstraint constraintWithItem:self.topLabel
                                                        attribute:NSLayoutAttributeLeading
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.topLabel.superview
                                                        attribute:NSLayoutAttributeLeading
                                                       multiplier:1
                                                         constant:8]];
    [constraints addObject:[NSLayoutConstraint constraintWithItem:self.topLabel
                                                        attribute:NSLayoutAttributeTrailing
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.topLabel.superview
                                                        attribute:NSLayoutAttributeTrailing
                                                       multiplier:1
                                                         constant:-8]];
    //Switch control
    [constraints addObject:[NSLayoutConstraint constraintWithItem:self.switchControl
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.topLabel
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1
                                                         constant:8]];
    [constraints addObject:[NSLayoutConstraint constraintWithItem:self.switchControl
                                                        attribute:NSLayoutAttributeLeading
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.topLabel.superview
                                                        attribute:NSLayoutAttributeLeading
                                                       multiplier:1
                                                         constant:8]];
    [constraints addObject:[NSLayoutConstraint constraintWithItem:self.switchControl
                                                        attribute:NSLayoutAttributeTrailing
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.topLabel.superview
                                                        attribute:NSLayoutAttributeTrailing
                                                       multiplier:1
                                                         constant:-8]];
    //Table View
    [constraints addObject:[NSLayoutConstraint constraintWithItem:self.tableView
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.switchControl
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1
                                                         constant:8]];
    [constraints addObject:[NSLayoutConstraint constraintWithItem:self.tableView
                                                        attribute:NSLayoutAttributeBottom
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.tableView.superview
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1
                                                         constant:-8]];
    [constraints addObject:[NSLayoutConstraint constraintWithItem:self.tableView
                                                        attribute:NSLayoutAttributeLeading
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.tableView.superview
                                                        attribute:NSLayoutAttributeLeading
                                                       multiplier:1
                                                         constant:8]];
    [constraints addObject:[NSLayoutConstraint constraintWithItem:self.tableView
                                                        attribute:NSLayoutAttributeTrailing
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.tableView.superview
                                                        attribute:NSLayoutAttributeTrailing
                                                       multiplier:1
                                                         constant:-8]];
    [self.view addConstraints:constraints];
    [self.view layoutIfNeeded];
}

@end
