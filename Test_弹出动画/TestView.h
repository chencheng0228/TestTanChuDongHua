//
//  TestView.h
//  Test_弹出动画
//
//  Created by admin on 15-1-22.
//  Copyright (c) 2015年 ___CC___. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^myBlock2)(NSString *str) ;
@interface TestView : UIView

@property (nonatomic) CGPoint pointNow;

@property (nonatomic,strong)void(^myBlock)(NSString *str);
@property (nonatomic, strong) NSString *str;

+(TestView *)makeNewViewWithFrame:(CGRect)frame andPoint:(CGPoint)point;

-(void)ViewShow;

-(void)ViewDismiss;




@end
