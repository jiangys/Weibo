//
//  StatusToolbar.h
//  Weibo
//
//  Created by Apple on 15/11/14.
//  Copyright © 2015年 Jiangys. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Status;

@interface StatusToolbar : UIView
+ (instancetype)toolbar;

@property(nonatomic,strong) Status *status;
@end
