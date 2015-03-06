//
//  UITableView+JCTableView.m
//  Test_弹出动画
//
//  Created by admin on 15-3-6.
//  Copyright (c) 2015年 ___CC___. All rights reserved.
//

#import "UITableView+JCTableView.h"

@implementation UITableView (JCTableView)

-(void)clearLine
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    self.tableFooterView = view;
}

-(void)clearBackGroundColor
{
    self.backgroundView = nil;
    self.backgroundColor = [UIColor clearColor];
}

@end
