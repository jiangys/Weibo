//
//  StatusPhotoView.h
//  Weibo
//
//  Created by jiangys on 15/10/25.
//  Copyright © 2015年 Jiangys. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Photo;

@interface StatusPhotoView : UIImageView

/** 图片模型 */
@property (nonatomic, strong) Photo *photo;

@end
