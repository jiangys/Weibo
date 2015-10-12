//
//  NewfeatureViewController.m
//  Weibo
//
//  Created by jiangys on 15/10/11.
//  Copyright © 2015年 Jiangys. All rights reserved.
//

#import "NewfeatureViewController.h"
#import "TabBarViewController.h"

// 新特性图片总数
#define NewfeatureCount 4

@interface NewfeatureViewController ()<UIScrollViewDelegate>

/** 滑动图片 分页 */
@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation NewfeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.添加UISrollView
    [self setupScrollView];
    
    // 2.添加pageControl
    [self setupPageControl];
}

/**
 *  添加UISrollView
 */
- (void)setupScrollView
{
    UIScrollView *scrollView=[[UIScrollView alloc] init];
    scrollView.frame=self.view.bounds;
    scrollView.delegate=self;
    [self.view addSubview:scrollView];
    
    CGFloat scrollW=scrollView.width;
    CGFloat scrollH=scrollView.height;
    for (int i=0; i < NewfeatureCount;i++) {
        UIImageView *imageView=[[UIImageView alloc] init];
        imageView.width=scrollW;
        imageView.height=scrollH;
        imageView.y=0;
        imageView.x=i*scrollW;
        // 显示图片
        NSString *name=[NSString stringWithFormat:@"new_feature_%d",i+1];
//        if (FourInch) { // 4inch  需要手动去加载4inch对应的-568h图片
//            name = [name stringByAppendingString:@"-568h"];
//        }
        imageView.image=[UIImage imageNamed:name];
        if (i==(NewfeatureCount-1)) {
            [self setupLastImageView:imageView];
        }
        
        [scrollView addSubview:imageView];
    }
    
    // 3.设置scrollView的其他属性
    // 如果想要某个方向上不能滚动，那么这个方向对应的尺寸数值传0即可
    scrollView.contentSize = CGSizeMake(NewfeatureCount * scrollW, 0);
    scrollView.bounces = NO; // 去除弹簧效果
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
}

/**
 *  添加pageControl
 */
- (void)setupPageControl
{
    UIPageControl *pageControl=[[UIPageControl alloc] init];
    pageControl.numberOfPages=NewfeatureCount;
    pageControl.currentPageIndicatorTintColor=YSColor(253, 98, 42);
    pageControl.pageIndicatorTintColor=YSColor(189, 189, 189);
    pageControl.centerX=self.view.width * 0.5;
    pageControl.centerY=self.view.height-50;
    
    [self.view addSubview:pageControl];
    self.pageControl=pageControl;
}

/**
 *  初始化最后一个imageView
 *
 *  @param imageView 最后一个imageView
 */
- (void)setupLastImageView:(UIImageView *)imageView
{
    // 开启交互
    imageView.userInteractionEnabled=YES;
    
    // 添加分享复选框
    UIButton *shareBtn=[[UIButton alloc] init];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
    [shareBtn setTitle:@"分享给大家" forState:UIControlStateNormal];
    [shareBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    shareBtn.titleLabel.font=[UIFont systemFontOfSize:15];
    // titleEdgeInsets:只影响按钮内部的titleLabel
    shareBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    shareBtn.width=200;
    shareBtn.height=30;
    shareBtn.centerX=imageView.width*0.5;
    shareBtn.centerY=imageView.height*0.7;
    [shareBtn addTarget:self action:@selector(shareClick:) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:shareBtn];
    
    // 开始微博
    UIButton *startBtn=[[UIButton alloc] init];
    [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
    [startBtn setTitle:@"开始微博" forState:UIControlStateNormal];
    startBtn.size=startBtn.currentBackgroundImage.size;
    startBtn.centerX=imageView.width*0.5;
    startBtn.centerY=imageView.height*0.78;
    [startBtn addTarget:self action:@selector(startClick) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:startBtn];
}

/**
 *  分享给大家
 */
- (void)shareClick:(UIButton *)shareBtn
{
    shareBtn.selected=!shareBtn.isSelected;
}

/**
 *  开始微博
 */
- (void)startClick
{
    // 切换到TabBarController
    /*
     切换控制器的手段
     1.push：依赖于UINavigationController，控制器的切换是可逆的，比如A切换到B，B又可以回到A
     2.modal：控制器的切换是可逆的，比如A切换到B，B又可以回到A
     3.切换window的rootViewController
     */
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = [[TabBarViewController alloc] init];
}

#pragma ScrollView 代理
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 获取页码
    CGFloat doublePage=scrollView.contentOffset.x/scrollView.width;
    int intPage=(int)(doublePage+0.5);
    
    // 设置页码
    self.pageControl.currentPage=intPage;
}

@end
