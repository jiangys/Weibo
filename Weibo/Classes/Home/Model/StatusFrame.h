//
//  StatusFrame.h
//  Weibo
//
//  Created by jiangys on 15/10/24.
//  Copyright © 2015年 Jiangys. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Status;

// cell的边框宽度
#define StatusCellBorderW 10
// 昵称字体
#define StatusCellNameFont [UIFont systemFontOfSize:13]
// 时间字体
#define StatusCellTimeFont [UIFont systemFontOfSize:12]
// 来源字体
#define StatusCellSourceFont StatusCellTimeFont
// 正文字体
#define StatusCellContentFont [UIFont systemFontOfSize:14]

// 被转发微博的正文字体
#define StatusCellRetweetContentFont [UIFont systemFontOfSize:13]

// cell之间的间距
#define StatusCellMargin 15


@interface StatusFrame : NSObject

/** 存在微博模型 */
@property (nonatomic, strong) Status *status;

/** 原创微博整体 */
@property (nonatomic, assign, readonly) CGRect originalViewF;
/** 头像 */
@property (nonatomic, assign, readonly) CGRect iconViewF;
/** 会员图标 */
@property (nonatomic, assign, readonly) CGRect vipViewF;
/** 配图 */
@property (nonatomic, assign, readonly) CGRect photosViewF;
/** 昵称 */
@property (nonatomic, assign, readonly) CGRect nameLabelF;
/** 时间 */
@property (nonatomic, assign, readonly) CGRect timeLabelF;
/** 来源 */
@property (nonatomic, assign, readonly) CGRect sourceLabelF;
/** 正文 */
@property (nonatomic, assign, readonly) CGRect contentLabelF;

/** 转发微博整体 */
@property (nonatomic, assign) CGRect retweetViewF;
/** 转发微博正文 + 昵称 */
@property (nonatomic, assign) CGRect retweetContentLabelF;
/** 转发配图 */
@property (nonatomic, assign) CGRect retweetPhotosViewF;

/** cell的高度 */
@property (nonatomic, assign, readonly) CGFloat cellHeight;

@end
