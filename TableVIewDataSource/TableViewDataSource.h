//
//  TableViewDataSource.h
//  code
//
//  Created by Howe on 2020/3/18.
//  Copyright © 2020 howe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface TableViewDataSource : NSObject <UITableViewDataSource>
+ (TableViewDataSource *)dataSourceWithItems:(NSArray *)items cellIdentifier:(NSString *)cellIdentifier configureCellBlock:(void (^)(UITableViewCell *cell, id data))cellBlock;
@end

NS_ASSUME_NONNULL_END
