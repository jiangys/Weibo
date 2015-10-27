//
//  NSDate+Time.h
//  Weibo
//
//  Created by jiangys on 15/10/25.
//  Copyright © 2015年 Jiangys. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Time)
/**
 *  判断某个时间是否为今年
 */
- (BOOL)isThisYear;
/**
 *  判断某个时间是否为昨天
 */
- (BOOL)isYesterday;
/**
 *  判断某个时间是否为今天
 */
- (BOOL)isToday;
@end
