//
//  UIImage+Effect.m
//  Weibo
//
//  Created by jiangys on 15/10/6.
//  Copyright © 2015年 Jiangys. All rights reserved.
//

#import "UIImage+Effect.h"

@implementation UIImage (Effect)

/**
 *  返回一张可以随意拉伸不变形的图片
 *
 *  @param name 图片名字
 */
+ (UIImage *)imageToResizable:(NSString *)name
{
    UIImage *normal = [UIImage imageNamed:name];
    CGFloat w = normal.size.width * 0.5;
    CGFloat h = normal.size.height * 0.5;
    return [normal resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w)];
}

@end
