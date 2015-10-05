//
//  TabBar.h
//  Weibo
//
//  Created by jiangys on 15/10/5.
//  Copyright © 2015年 Jiangys. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TabBar;

@protocol TabBarDelegate <UITabBarDelegate>

@optional
-(void)tabBarDidClickPlusButton:(TabBar *)tabBar;

@end

@interface TabBar : UITabBar

@property (nonatomic, weak) id<TabBarDelegate> tabBarDelegate;

@end
