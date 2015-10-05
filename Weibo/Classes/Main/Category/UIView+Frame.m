//
//  UIView+Frame.m
//  Weibo
//
//  Created by jiangys on 15/10/5.
//  Copyright © 2015年 Jiangys. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

#pragma mark - Getters

- (CGFloat)x
{
    return self.origin.x;
}

- (CGFloat)y
{
    return self.origin.y;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (CGFloat)width
{
    return self.size.width;
}

- (CGFloat)height
{
    return self.size.height;
}

- (CGSize)size
{
    return self.frame.size;
}

- (CGPoint)origin
{
    return self.frame.origin;
}


#pragma mark - Setters

- (void)setX:(CGFloat)x
{
    CGPoint point = self.origin;
    point.x = x;
    self.origin = point;
}

- (void)setY:(CGFloat)y
{
    CGPoint point = self.origin;
    point.y = y;
    self.origin = point;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (void)setWidth:(CGFloat)width
{
    CGSize size = self.size;
    size.width = width;
    self.size = size;
}

- (void)setHeight:(CGFloat)height
{
    CGSize size = self.size;
    size.height = height;
    self.size = size;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect rect = self.frame;
    rect.origin = origin;
    self.frame = rect;
}

- (void)setSize:(CGSize)size
{
    CGRect rect = self.frame;
    rect.size = size;
    self.frame = rect;
}


#pragma mark - Summation

- (void)addToX:(CGFloat)value
{
    self.x = self.x + value;
}

- (void)addToY:(CGFloat)value
{
    self.y = self.y + value;
}

- (void)addToWidth:(CGFloat)value
{
    self.width = self.width + value;
}

- (void)addToHeight:(CGFloat)value
{
    self.height = self.height + value;
}


#pragma mark - Multiplication

- (void)multiplyToX:(CGFloat)value
{
    self.x = self.x * value;
}

- (void)multiplyToY:(CGFloat)value
{
    self.y = self.y * value;
}

- (void)multiplyToWidth:(CGFloat)value
{
    self.width = self.width * value;
}

- (void)multiplyToHeight:(CGFloat)value
{
    self.height = self.height * value;
}


#pragma mark - Deprecated

- (void)setFrameOriginX:(CGFloat)x
{
    self.x = x;
}

- (void)setFrameOriginY:(CGFloat)y
{
    self.y = y;
}

- (void)setFrameWidth:(CGFloat)width
{
    self.width = width;
}

- (void)setFrameHeight:(CGFloat)height
{
    self.height = height;
}

- (void)setFrameOrigin:(CGPoint)origin
{
    self.origin = origin;
}

- (void)setFrameSize:(CGSize)size
{
    self.size = size;
}

@end
