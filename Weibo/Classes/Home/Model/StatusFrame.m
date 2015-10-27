//
//  StatusFrame.m
//  Weibo
//
//  Created by jiangys on 15/10/24.
//  Copyright © 2015年 Jiangys. All rights reserved.
//

#import "StatusFrame.h"
#import "Status.h"
#import "User.h"
#import "NSString+Size.h"
#import "StatusPhotosView.h"


@implementation StatusFrame

/**
 *  设置每一条微博的Frame 及cell的高度
 *
 *  @param status 微博模型
 */
-(void)setStatus:(Status *)status
{
    _status = status;
    
    User *user=status.user;
    
    // cell的宽度
    CGFloat cellW = [UIScreen mainScreen].bounds.size.width;
    
    /* 原创微博 */
    
    /** 头像 */
    CGFloat iconWH = 35;
    CGFloat iconX = StatusCellBorderW;
    CGFloat iconY = StatusCellBorderW;
    _iconViewF = CGRectMake(iconX, iconY, iconWH, iconWH);
    
    /** 昵称 */
    CGFloat nameX = CGRectGetMaxX(self.iconViewF) + StatusCellBorderW;
    CGFloat nameY = iconY;
    CGSize nameSize = [user.name sizeWithFont:StatusCellNameFont];
    _nameLabelF = (CGRect){{nameX, nameY}, nameSize};
    
    /** 会员图标 */
    if (user.isVip) {
        CGFloat vipX = CGRectGetMaxX(self.nameLabelF) + StatusCellBorderW;
        CGFloat vipY = nameY;
        CGFloat vipH = nameSize.height;
        CGFloat vipW = 14;
        _vipViewF = CGRectMake(vipX, vipY, vipW, vipH);
    }
    
    /** 时间 */
    CGFloat timeX = nameX;
    CGFloat timeY = CGRectGetMaxY(self.nameLabelF) + StatusCellBorderW;
    CGSize timeSize = [status.created_at sizeWithFont:StatusCellTimeFont];
    _timeLabelF = (CGRect){{timeX, timeY}, timeSize};
    
    /** 来源 */
    CGFloat sourceX = CGRectGetMaxX(self.timeLabelF) + StatusCellBorderW;
    CGFloat sourceY = timeY;
    CGSize sourceSize = [status.source sizeWithFont:StatusCellSourceFont];
    _sourceLabelF = (CGRect){{sourceX, sourceY}, sourceSize};
    
    /** 正文 */
    CGFloat contentX = iconX;
    CGFloat contentY = MAX(CGRectGetMaxY(self.iconViewF), CGRectGetMaxY(self.timeLabelF)) + StatusCellBorderW;
    CGFloat maxW = cellW - 2 * contentX;
    CGSize contentSize = [status.text sizeWithFont:StatusCellContentFont maxW:maxW];
    _contentLabelF = (CGRect){{contentX, contentY}, contentSize};
    
    /** 配图 */
    CGFloat originalH = 0;
    if (status.pic_urls.count) { // 有配图
        CGFloat photosX = contentX;
        CGFloat photosY = CGRectGetMaxY(self.contentLabelF) + StatusCellBorderW;
        CGSize photosSize = [StatusPhotosView sizeWithCount:status.pic_urls.count];
        _photosViewF = (CGRect){{photosX, photosY}, photosSize};
        
        originalH = CGRectGetMaxY(self.photosViewF) + StatusCellBorderW;
    } else { // 没配图
        originalH = CGRectGetMaxY(self.contentLabelF) + StatusCellBorderW;
    }
    
    /* cell的高度 */
    _cellHeight = originalH;
}

@end
