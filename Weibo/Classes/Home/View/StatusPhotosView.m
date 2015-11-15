//
//  StatusPhotosView.m
//  Weibo
//
//  Created by jiangys on 15/10/25.
//  Copyright © 2015年 Jiangys. All rights reserved.
//

#import "StatusPhotosView.h"
#import "StatusPhotoView.h"
#import "Photo.h"
#import "SDPhotoBrowser.h"

#define StatusPhotoWH 70
#define StatusPhotoMargin 10
#define StatusPhotoMaxCol(count) ((count==4)?2:3)

@implementation StatusPhotosView

- (void)setPhotos:(NSArray *)photos
{
    _photos = photos;
    
    NSUInteger photosCount = photos.count;
    
    // 创建足够多的图片控制
    while (self.subviews.count < photosCount) {
        StatusPhotoView *photoView = [[StatusPhotoView alloc] init];
        [self addSubview:photoView];
    }
    
    // 遍历所有的图片控件，设置图片
    for (int i = 0; i < self.subviews.count; i++) {
        StatusPhotoView *photoView = self.subviews[i];
        
        if (i < photosCount) {
            photoView.photo = photos[i];
            photoView.hidden = NO;
        } else{
            photoView.hidden=YES;
        }
        
        photoView.tag = i;
        // 添加手势监听器（一个手势监听器 只能 监听对应的一个view）
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] init];
        [recognizer addTarget:self action:@selector(tapPhoto:)];
        [photoView addGestureRecognizer:recognizer];
    }
    
}

- (void)tapPhoto:(UITapGestureRecognizer *)recognizer
{
    SDPhotoBrowser *browser = [[SDPhotoBrowser alloc] init];
    browser.sourceImagesContainerView = self; // 原图的父控件
    browser.imageCount = self.photos.count; // 图片总数
    browser.currentImageIndex = recognizer.view.tag;
    browser.delegate =self; //self.subviews[recognizer.view.tag];
    [browser show];
}

#pragma mark - photobrowser代理方法

// 返回临时占位图片（即原来的小图）
- (UIImage *)photoBrowser:(SDPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index
{
    return  [(StatusPhotoView *)self.subviews[index] image];
}


// 返回高质量图片的url
- (NSURL *)photoBrowser:(SDPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index
{
    NSString *urlStr = [[self.photos[index] thumbnail_pic] stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"];
    return [NSURL URLWithString:urlStr];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 设置图片的尺寸和位置
    NSUInteger photosCount = self.photos.count;
    int maxCol = StatusPhotoMaxCol(photosCount);
    for (int i = 0; i<photosCount; i++) {
        StatusPhotoView *photoView = self.subviews[i];
        
        int col = i % maxCol;
        photoView.x = col * (StatusPhotoWH + StatusPhotoMargin);
        
        int row = i / maxCol;
        photoView.y = row * (StatusPhotoWH + StatusPhotoMargin);
        photoView.width = StatusPhotoWH;
        photoView.height = StatusPhotoWH;
    }
}

+ (CGSize)sizeWithCount:(NSUInteger)count
{
    // 最大列数（一行最多有多少列）
    int maxCols = StatusPhotoMaxCol(count);
    
    NSUInteger cols = (count >= maxCols)? maxCols : count;
    CGFloat photosW = cols * StatusPhotoWH + (cols - 1) * StatusPhotoMargin;
    
    // 行数
    NSUInteger rows = (count + maxCols - 1) / maxCols;
    CGFloat photosH = rows * StatusPhotoWH + (rows - 1) * StatusPhotoMargin;
    
    return CGSizeMake(photosW, photosH);
}
@end
