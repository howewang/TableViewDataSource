//
//  TableViewDataSource.m
//  code
//
//  Created by Howe on 2020/3/18.
//  Copyright © 2020 howe. All rights reserved.
//

#import "TableViewDataSource.h"

typedef void(^ConfigureCellBlock)(UITableViewCell * _Nonnull, id _Nonnull);

@interface TableViewDataSource ()
@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) ConfigureCellBlock cellBlock;
@property (nonatomic, copy) NSString *cellIdentifierString;
@end

@implementation TableViewDataSource

+ (TableViewDataSource *)dataSourceWithItems:(NSArray *)items cellIdentifier:(NSString *)cellIdentifier configureCellBlock:(ConfigureCellBlock)cellBlock {
    TableViewDataSource *dataSource = [[TableViewDataSource alloc] init];
    dataSource.dataSource = items;
    dataSource.cellBlock = cellBlock;
    dataSource.cellIdentifierString = cellIdentifier;
    return dataSource;
}


#pragma --mark events
- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    return [self.dataSource objectAtIndex:indexPath.row];
}

#pragma --mark TableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifierString forIndexPath:indexPath];
    id item = [self itemAtIndexPath:indexPath];
    if (self.cellBlock != nil) {
        self.cellBlock(cell, item);
    }
    return cell;
}


#pragma --mark setter&getter
- (NSArray *)dataSource {
    if (_dataSource == nil) {
        _dataSource = [NSArray array];
    }
    return _dataSource;
}

#pragma --mark init
- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}
@end
