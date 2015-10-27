//
//  StatusPhotoView.m
//  Weibo
//
//  Created by jiangys on 15/10/25.
//  Copyright © 2015年 Jiangys. All rights reserved.
//

#import "StatusPhotoView.h"
#import "Photo.h"
#import "UIImageView+WebCache.h"

@interface StatusPhotoView()
@property (nonatomic, weak) UIImageView *gifView;
@end

@implementation StatusPhotoView

- (UIImageView *)gifView
{
    if (!_gifView) {
        UIImage *image = [UIImage imageNamed:@"timeline_image_gif"];
        UIImageView *gifView = [[UIImageView alloc] initWithImage:image];
        [self addSubview:gifView];
        self.gifView = gifView;
    }
    return _gifView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 内容模式
        self.contentMode = UIViewContentModeScaleAspectFill;
        // 超出边框的内容都剪掉
        self.clipsToBounds = YES;
    }
    return self;
}

- (void)setPhoto:(Photo *)photo
{
    _photo = photo;
    
    // 设置图片
    [self sd_setImageWithURL:[NSURL URLWithString:photo.thumbnail_pic] placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    
    // 显示\隐藏gif控件
    // 判断是够以gif或者GIF结尾
    self.gifView.hidden = ![photo.thumbnail_pic.lowercaseString hasSuffix:@"gif"];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.gifView.x = self.width - self.gifView.width;
    self.gifView.y = self.height - self.gifView.height;
}
@end
