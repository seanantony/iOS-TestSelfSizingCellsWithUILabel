//
//  TableViewDelegate.m
//  TestUILabel
//
//  Created by Sean Antony on 05/08/2015.
//  Copyright (c) 2015 Sean Antony. All rights reserved.
//

#import "TableViewDelegate.h"
#import "TableViewCell1.h"

@implementation TableViewDelegate

- (instancetype)initWithSwitchController:(NSObject<Switchable> *)switchController
{
    self = [super init];
    if (self) {
        _switchController = switchController;
    }
    return self;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(TableViewCell1 *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.switchController.isOn) {
        [cell.label1 setText:cell.labelText];
    }
}

@end
