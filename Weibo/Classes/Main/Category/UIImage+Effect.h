//
//  UIImage+Effect.h
//  Weibo
//
//  Created by jiangys on 15/10/6.
//  Copyright © 2015年 Jiangys. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Effect)

/**
 *  返回一张可以随意拉伸不变形的图片
 *
 *  @param name 图片名字
 */
+ (UIImage *)imageToResizable:(NSString *)name;

@end
