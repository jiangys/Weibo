//
//  StatusPhotosView.h
//  Weibo
//
//  Created by jiangys on 15/10/25.
//  Copyright © 2015年 Jiangys. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatusPhotosView : UIView

/** 图片模型 */
@property (nonatomic, strong) NSArray *photos;

/**
 *  根据图片个数计算相册的尺寸
 */
+ (CGSize)sizeWithCount:(NSUInteger)count;
@end
