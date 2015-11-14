//
//  StatusToolbar.m
//  Weibo
//
//  Created by Apple on 15/11/14.
//  Copyright © 2015年 Jiangys. All rights reserved.
//

#import "StatusToolbar.h"

@interface StatusToolbar()

/** 存放所有的按钮 */
@property(nonatomic,strong) NSMutableArray *btns;

/** 分割线 */
@property(nonatomic,strong) NSMutableArray *dividers;


@property (nonatomic, weak) UIButton *repostBtn;
@property (nonatomic, weak) UIButton *commentBtn;
@property (nonatomic, weak) UIButton *attitudeBtn;

@end

@implementation StatusToolbar

- (NSMutableArray *)btns
{
    if (!_btns) {
        self.btns = [NSMutableArray array];
    }
    return _btns;
}

- (NSMutableArray *)dividers
{
    if (!_dividers) {
        self.dividers = [NSMutableArray array];
    }
    return _dividers;
}

+ (instancetype)toolbar
{
    return [[self alloc]init];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 添加按钮
        self.repostBtn = [self setupBtn:@"转发" icon:@"timeline_icon_retweet"];
        self.commentBtn = [self setupBtn:@"评论" icon:@"timeline_icon_comment"];
        self.attitudeBtn = [self setupBtn:@"赞" icon:@"timeline_icon_unlike"];
        
        // 添加分割线
        [self setupDivider];
        [self setupDivider];
    }
    return self;
}

/**
 *  在这个方法里设置尺寸
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSUInteger btnCount = self.btns.count;
    CGFloat btnW = self.width / btnCount;
    CGFloat btnH = self.height;
    
    for (int i = 0; i < btnCount; i++) {
        UIButton *btn = self.btns[i];
        btn.y = 0;
        btn.width = btnW;
        btn.height = btnH;
        btn.x = i * btnW;
    }
    
    NSUInteger dividerCount = self.dividers.count;
    for (int i = 0; i < dividerCount; i++) {
        UIImageView *divider = self.dividers[i];
        divider.y = 0;
        divider.x = (i + 1) *btnW;
        divider.height = btnH;
        divider.width = 1;
    }
}



/**
 *  初始化一个按钮
 *
 *  @param title 按钮文字
 *  @param icon  按钮图标
 *
 *  @return 返回按钮
 */
- (UIButton *)setupBtn:(NSString *)title icon:(NSString *)icon
{
    UIButton *btn=[[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"timeline_card_bottom_background_highlighted"] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    [self addSubview:btn];
    
    // 存放按钮
    [self.btns addObject:btn];
    
    return btn;
}

/**
 *  初始化分割线
 */
- (void)setupDivider
{
    UIImageView *divider = [[UIImageView alloc] init];
    divider.image = [UIImage imageNamed:@"timeline_card_bottom_line"];
    
    [self addSubview:divider];
    
    [self.dividers addObject:divider];
}

-(void)setStatus:(Status *)status
{
    
    
}
@end
