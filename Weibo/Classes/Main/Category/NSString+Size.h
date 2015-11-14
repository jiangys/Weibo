//
//  NSString+Size.h
//  Weibo
//
//  Created by jiangys on 15/10/24.
//  Copyright © 2015年 Jiangys. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Size)
- (CGSize)textSizeWithFont:(UIFont *)font maxW:(CGFloat)maxW;
- (CGSize)textSizeWithFont:(UIFont *)font;
@end
