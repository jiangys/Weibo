//
//  TabBarViewController.m
//  Weibo
//
//  Created by jiangys on 15/10/5.
//  Copyright (c) 2015年 Jiangys. All rights reserved.
//

#import "TabBarViewController.h"
#import "DiscoverViewController.h"
#import "HomeViewController.h"
#import "ProfileViewController.h"
#import "MessageCenterViewController.h"
#import "NavigationViewController.h"
#import "TabBar.h"
#import "PlusViewController.h"

@interface TabBarViewController ()<TabBarDelegate>

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.初始化子控制器
    HomeViewController *home = [[HomeViewController alloc]init];
    [self addChildVc:home title:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    
    MessageCenterViewController *messageCenter = [[MessageCenterViewController alloc] init];
    [self addChildVc:messageCenter title:@"消息" image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
    
    DiscoverViewController *discover = [[DiscoverViewController alloc] init];
    [self addChildVc:discover title:@"发现" image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected"];
    
    ProfileViewController *profile = [[ProfileViewController alloc] init];
    [self addChildVc:profile title:@"我" image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
    
    // 2.更新系统自带的控制器
    TabBar *tabBar=[[TabBar alloc]init];
    tabBar.tabBarDelegate=self;
    [self setValue:tabBar forKey:@"tabBar"];
}

/**
 *  添加一个子控制器
 *
 *  @param childVc       子控制器
 *  @param title         标题
 *  @param image         图片
 *  @param selectedImage 选中的图片
 */
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字
    childVc.title = title; // 同时设置tabbar和navigationBar的文字
    
    // 设置子控制器的图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = YSColor(123, 123, 123);
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    
    // 添加为子控制器
    //[self addChildViewController:childVc];
    
    // 先给外面传进来的小控制器 包装 一个导航控制器
    NavigationViewController *nav=[[NavigationViewController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
}

-(void)tabBarDidClickPlusButton:(TabBar *)tabBar
{
    PlusViewController *plusVc=[[PlusViewController alloc] init];
    plusVc.title = @"弹出控制器";
    plusVc.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(plusClost)];
    
    NavigationViewController *nav=[[NavigationViewController alloc] initWithRootViewController:plusVc];

    [self presentViewController:nav animated:YES completion:nil];

    NSLog(@"tabBarDidClickPlusButton");
}

/**
 *  关闭弹出控制器
 */
-(void)plusClost
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
