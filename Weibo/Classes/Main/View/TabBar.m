//
//  TabBar.m
//  Weibo
//
//  Created by jiangys on 15/10/5.
//  Copyright © 2015年 Jiangys. All rights reserved.
//

#import "TabBar.h"

@interface TabBar()
@property (nonatomic, weak) UIButton *plusBtn;
@end

@implementation TabBar
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *plusBtn=[[UIButton alloc] init];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        
        plusBtn.size=plusBtn.currentBackgroundImage.size;
        [plusBtn addTarget:self action:@selector(plusClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:plusBtn];
        self.plusBtn=plusBtn;
    }
    return self;
}

/**
 *  加号按钮点击
 */
- (void)plusClick
{
    // 通知代理
    if ([self.tabBarDelegate respondsToSelector:@selector(tabBarDidClickPlusButton:)]) {
        [self.tabBarDelegate tabBarDidClickPlusButton:self];
    }
}

- (void)layoutSubviews
{
#warning [super layoutSubviews] 一定要调用
    [super layoutSubviews];
    
    // 1.设置加号按钮的位置
    self.plusBtn.centerX = self.width * 0.5;
    self.plusBtn.centerY = self.height * 0.5;
    
    // 2.设置其他tabbarButton的位置和尺寸
    CGFloat tabbarButtonW = self.width / 5;
    CGFloat tabbarButtonIndex = 0;
    for (UIView *child in self.subviews) {
        if ([child isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            // 设置宽度
            child.width = tabbarButtonW;
            // 设置x
            child.x = tabbarButtonIndex * tabbarButtonW;
            
            // 增加索引
            tabbarButtonIndex++;
            if (tabbarButtonIndex == 2) {
                tabbarButtonIndex++;
            }
        }
    }
}
@end
