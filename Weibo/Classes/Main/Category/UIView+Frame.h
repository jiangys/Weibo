//
//  UIView+Frame.h
//  Weibo
//
//  Created by jiangys on 15/10/5.
//  Copyright © 2015年 Jiangys. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 * Useful methods to simplify the way to modify a CoreGraphic rectangle.
 */
@interface UIView (Frame)

// Gets or Sets a value
@property (nonatomic, readwrite) CGFloat x;
@property (nonatomic, readwrite) CGFloat y;
@property (nonatomic, readwrite) CGFloat centerX;
@property (nonatomic, readwrite) CGFloat centerY;
@property (nonatomic, readwrite) CGFloat width;
@property (nonatomic, readwrite) CGFloat height;
@property (nonatomic, readwrite) CGPoint origin;
@property (nonatomic, readwrite) CGSize size;

// Sums a value. Can also substract by setting a negative value.
- (void)addToX:(CGFloat)value;
- (void)addToY:(CGFloat)value;
- (void)addToWidth:(CGFloat)value;
- (void)addToHeight:(CGFloat)value;

// Multiplies with a value. Can also divide by setting a decimal value.
- (void)multiplyToX:(CGFloat)value;
- (void)multiplyToY:(CGFloat)value;
- (void)multiplyToWidth:(CGFloat)value;
- (void)multiplyToHeight:(CGFloat)value;

// Deprecated
- (void)setFrameOriginX:(CGFloat)x DEPRECATED_MSG_ATTRIBUTE("Use -setX: instead");
- (void)setFrameOriginY:(CGFloat)y DEPRECATED_MSG_ATTRIBUTE("Use -setY: instead");
- (void)setFrameWidth:(CGFloat)width DEPRECATED_MSG_ATTRIBUTE("Use -setWidth: instead");
- (void)setFrameHeight:(CGFloat)height DEPRECATED_MSG_ATTRIBUTE("Use -setHeight: instead");
- (void)setFrameOrigin:(CGPoint)origin DEPRECATED_MSG_ATTRIBUTE("Use -setOrigin: instead");
- (void)setFrameSize:(CGSize)size DEPRECATED_MSG_ATTRIBUTE("Use -setSize: instead");

@end
