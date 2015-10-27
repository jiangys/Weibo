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
    }
    
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
