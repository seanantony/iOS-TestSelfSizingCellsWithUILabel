//
//  TableViewDataSource.m
//  TestUILabel
//
//  Created by Sean Antony on 05/08/2015.
//  Copyright (c) 2015 Sean Antony. All rights reserved.
//

#import "TableViewDataSource.h"
#import "TableViewCell1.h"

@implementation TableViewDataSource

- (instancetype)initWithSwitchController:(NSObject<Switchable> *)switchController
{
    self = [super init];
    if (self) {
        _switchController = switchController;
        NSMutableArray *data = [NSMutableArray new];
        for (int i = 0; i < 10; i++) {
            [data addObject:[self textFileResource:[NSString stringWithFormat:@"%i", i]]];
        }
        _dataSource = [NSArray arrayWithArray:data];
    }
    return self;
}

- (NSString*)textFileResource:(NSString*)resource {
    NSBundle *bundle = [NSBundle bundleForClass:self.class];
    NSString *filePath = [bundle pathForResource:resource ofType:@"txt"];
    NSError *error;
    NSString *text = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    if (error) {
        NSLog(@"Error: %@", error.localizedDescription);
        abort();
    }
    return text;
}

#pragma mark - UITableViewDataSource protocol required methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"TableViewCell1";
    TableViewCell1 *cell = (TableViewCell1 *) [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    NSString *labelText = self.dataSource[indexPath.row % 10];
    if (self.switchController.isOn) {
        [cell.label1 setText:labelText];
    } else {
        [cell setLabelText:labelText];
    }
    
    return cell;
}

@end
