//
//  JCPopoverView.h
//  JEProject
//
//  Created by admin on 15-1-7.
//  Copyright (c) 2015年 DNE Technology Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface JCPopoverView : UIView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray *imageArray;
@property (nonatomic) CGPoint showPoint;
@property (nonatomic, strong) UIButton *handerView;


-(id)initWithPoint:(CGPoint)point titles:(NSArray *)titles images:(NSArray *)images;
-(void)show;
-(void)dismiss;
-(void)dismiss:(BOOL)animated;
@property (nonatomic,copy) void(^selectRowAtIndex)(NSInteger index);
@end
