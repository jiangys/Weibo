//
//  SearchBar.m
//  Weibo
//
//  Created by jiangys on 15/10/5.
//  Copyright © 2015年 Jiangys. All rights reserved.
//

#import "SearchBar.h"
#import "UIImage+Effect.h"

@implementation SearchBar

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        self.font=[UIFont systemFontOfSize:15];
        self.placeholder=@"请输入搜索条件";
        self.background =[UIImage imageToResizable:@"searchbar_textfield_background"];
        
        UIImageView *searchIcon=[[UIImageView alloc]init];
        searchIcon.image=[UIImage imageNamed:@"searchbar_textfield_search_icon"];
        searchIcon.height=30;
        searchIcon.width=30;
        // 保持图片原来的尺寸
        searchIcon.contentMode=UIViewContentModeCenter;
        self.leftView=searchIcon;
        self.leftViewMode=UITextFieldViewModeAlways;
    }
    return self;
}

+(instancetype)searchBar
{
    return [[self alloc]init];
}

@end
