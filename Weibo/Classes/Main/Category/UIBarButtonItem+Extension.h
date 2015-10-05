//
//  UIBarButtonItem+Extension.h
//  Weibo
//
//  Created by jiangys on 15/10/5.
//  Copyright © 2015年 Jiangys. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
+ (UIBarButtonItem *)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;
@end
