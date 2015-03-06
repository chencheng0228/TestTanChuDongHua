
//
//  TestView.m
//  Test_弹出动画
//
//  Created by admin on 15-1-22.
//  Copyright (c) 2015年 ___CC___. All rights reserved.
//

#import "TestView.h"

@implementation TestView

-(void)drawRect:(CGRect)rect
{
    
}


-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


+(TestView *)makeNewViewWithFrame:(CGRect)frame andPoint:(CGPoint)point
{
    TestView *view = [[self alloc] initWithFrame:frame];
    view.pointNow = point;
    view.backgroundColor = [UIColor redColor];
    view.hidden = YES;
    return view;
    
}


-(void)ViewShow
{
    if (self.hidden==YES) {
        self.hidden = NO;
    }
   
    
    CABasicAnimation *positionAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    CGPoint originPosition = self.pointNow;
    CGPoint finalPosition = CGPointMake(self.pointNow.x, self.pointNow.y+120);
    positionAnimation.duration = 1;
    
    //动画效果
    positionAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    positionAnimation.fromValue = [NSValue valueWithCGPoint:originPosition];
    positionAnimation.toValue = [NSValue valueWithCGPoint:finalPosition];
    
    positionAnimation.removedOnCompletion = NO;
    positionAnimation.fillMode = kCAFillModeForwards;
    
    
    [self.layer addAnimation:positionAnimation forKey:@"positionAnimation"];
    
    self.layer.position = finalPosition;
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.duration = 1;
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:0.01f];
    scaleAnimation.toValue = [NSNumber numberWithFloat:1.f];
    scaleAnimation.fillMode = kCAFillModeForwards;
    scaleAnimation.removedOnCompletion = NO;
    scaleAnimation.beginTime = CACurrentMediaTime() + 0.03f;
    
    [self.layer addAnimation:scaleAnimation forKey:@"scaleAnimation"];
     self.transform = CGAffineTransformMakeScale(0.01f, 0.01f);
    [CATransaction commit];
    
    
}



-(void)ViewDismiss
{
    CABasicAnimation * scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.duration = 1;
    
    //动画效果
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:1.f];
    scaleAnimation.toValue = [NSNumber numberWithFloat:0.01f];
    scaleAnimation.fillMode = kCAFillModeForwards;
    scaleAnimation.removedOnCompletion = NO;
    scaleAnimation.beginTime = CACurrentMediaTime() + 0.03f;
    [self.layer addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    self.transform = CGAffineTransformMakeScale(1.f, 1.f);
    
    
    CABasicAnimation *positionAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    CGPoint originPosition = self.layer.position;
    CGPoint finalPosition = self.pointNow;
    
    positionAnimation.duration = 1;
    
    //动画效果
    positionAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    positionAnimation.fromValue = [NSValue valueWithCGPoint:originPosition];
    positionAnimation.toValue = [NSValue valueWithCGPoint:finalPosition];
    
    positionAnimation.fillMode = kCAFillModeForwards;
    positionAnimation.removedOnCompletion = NO;
    
    [self.layer addAnimation:positionAnimation forKey:@"positionAnimation"];
    self.layer.position = finalPosition;
    [CATransaction commit];
    
}

@end
