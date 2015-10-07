//
//  DropdownMenu.h
//  Weibo
//
//  Created by jiangys on 15/10/6.
//  Copyright © 2015年 Jiangys. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DropdownMenu;

@protocol DropdownMenuDelegate <NSObject>
@optional
- (void)dropdownMenuDidDismiss:(DropdownMenu *)menu;
- (void)dropdownMenuDidShow:(DropdownMenu *)menu;
@end

@interface DropdownMenu : UIView

@property (nonatomic, weak) id<DropdownMenuDelegate> delegate;

/**
 *  内容
 */
@property (nonatomic, strong) UIView *content;

/**
 *  内容控制器
 */
@property (nonatomic, strong) UIViewController *contentController;

/**
 *  初始化菜单
 */
+(instancetype)menu;

/**
 *  显示
 *
 *  @param from 要显示的控件上
 */
- (void)showFrom:(UIView *)from;

/**
 *  销毁
 */
- (void)dismiss;


@end
