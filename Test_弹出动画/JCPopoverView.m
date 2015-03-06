//
//  JCPopoverView.m
//  JEProject
//
//  Created by admin on 15-1-7.
//  Copyright (c) 2015年 DNE Technology Co.,Ltd. All rights reserved.
//

#import "JCPopoverView.h"
#import "UITableView+JCTableView.h"
#define TITLE_FONT [UIFont systemFontOfSize:16]
@implementation JCPopoverView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}

-(id)initWithPoint:(CGPoint)point titles:(NSArray *)titles images:(NSArray *)images
{
    self= [super init];
    if (self) {
       // self.backgroundColor = [UIColor blackColor];
        self.showPoint = point;
        self.titleArray = titles;
        self.imageArray = images;
        self.frame = [self getViewFrame];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        
        imageView.image = [UIImage imageNamed:@"menu_box.png"];
        [self addSubview:imageView];
        [self addSubview:self.tableView];
    }
    
    return self;
}

-(CGRect)getViewFrame
{
    CGRect frame = CGRectZero;
    
    for (NSString *title in self.titleArray) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
        NSDictionary *attributes = @{NSFontAttributeName:TITLE_FONT, NSParagraphStyleAttributeName:paragraphStyle.copy};
        CGFloat width = [title boundingRectWithSize:CGSizeMake(300, 100) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size.width;
        frame.size.width = MAX(width, frame.size.width);
    }
    frame.size.width = 100+frame.size.width;
    frame.origin.x = self.showPoint.x-2*frame.size.width/3-10;
    frame.origin.y = self.showPoint.y+25;
    frame.size.height = 144;
    return frame;
}

-(UITableView*)tableView
{
    if(_tableView!=nil)
    {
        return _tableView;
    }
    CGRect rect = self.frame;
    rect.origin.x = 0;
    rect.origin.y = 0;
    rect.size.height = rect.size.height;
    _tableView = [[UITableView alloc] initWithFrame:rect style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView clearLine];
    [_tableView clearBackGroundColor];
    return _tableView;
}

-(void)show;
{
    self.handerView = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.handerView setFrame:[UIScreen mainScreen].bounds];
    [self.handerView setBackgroundColor:[UIColor clearColor]];
    [self.handerView addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    
    [self.handerView addSubview:self];
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:_handerView];

//  CGPoint arrowPoint = [self convertPoint:self.showPoint fromView:_handerView];
//  self.layer.anchorPoint = CGPointMake(arrowPoint.x / self.frame.size.width, arrowPoint.y / self.frame.size.height);
//  self.frame = [self getViewFrame];
    
    self.alpha = 0.f;
    self.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
    [UIView animateWithDuration:0.2f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.transform = CGAffineTransformMakeScale(1.05f, 1.05f);
        self.alpha = 1.f;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.08f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.transform = CGAffineTransformIdentity;
        } completion:nil];
    }];
    
}

-(void)dismiss
{
    [self dismiss:YES];
}

-(void)dismiss:(BOOL)animated
{
    if (!animated) {
        [_handerView removeFromSuperview];
        return;
    }
    
    [UIView animateWithDuration:0.3f animations:^{
        self.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
        self.alpha = 0.f;
    } completion:^(BOOL finished) {
        [_handerView removeFromSuperview];
    }];
}


#pragma mark - UITableView DataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_titleArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.textColor = [UIColor whiteColor];
    }
    
    if ([_imageArray count] == [_titleArray count]) {
        cell.imageView.image = [UIImage imageNamed:[_imageArray objectAtIndex:indexPath.row]];
    }
    cell.textLabel.font = [UIFont systemFontOfSize:16];
    cell.textLabel.text = [_titleArray objectAtIndex:indexPath.row];
    
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0) {
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    
    return cell;
}

#pragma mark - UITableView Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (self.selectRowAtIndex) {
        self.selectRowAtIndex(indexPath.row);
    }
    [self dismiss:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

@end
