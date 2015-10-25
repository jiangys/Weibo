//
//  StatusCell.h
//  Weibo
//
//  Created by jiangys on 15/10/24.
//  Copyright © 2015年 Jiangys. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StatusFrame;

@interface StatusCell : UITableViewCell
@property (nonatomic, strong) StatusFrame *statusFrame;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
