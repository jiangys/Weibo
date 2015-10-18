//
//  MBProgressHUD+YS.h
//  Weibo
//
//  Created by jiangys on 15/10/17.
//  Copyright © 2015年 Jiangys. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (YS)

+ (void)showSuccess:(NSString *)success;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;

+ (void)showError:(NSString *)error;
+ (void)showError:(NSString *)error toView:(UIView *)view;

+ (MBProgressHUD *)showMessage:(NSString *)message;
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;

+ (void)showText:(NSString *)message;
+ (void)showText:(NSString*)message toView:(UIView *)view;

+ (void)hideHUD;
+ (void)hideHUDForView:(UIView *)view;

@end
