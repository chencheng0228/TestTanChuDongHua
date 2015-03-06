//
//  ViewController.m
//  Test_约束代码
//
//  Created by admin on 15-1-22.
//  Copyright (c) 2015年 ___CC___. All rights reserved.
//

#import "ViewController.h"
#import "TestView.h"
#import "JCPopoverView.h"

@interface ViewController ()
@property (nonatomic,strong) TestView *animaView;
@property (nonatomic) int k;
@property CGPoint pointNow;

@property (nonatomic,strong) JCPopoverView *popView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    self.k = 0;
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(200, 200, 100, 100)];
    button.tag = 800;
    button.backgroundColor = [UIColor brownColor];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.animaView = [TestView makeNewViewWithFrame:CGRectMake(0, 0, 100, 100) andPoint:button.center];
    [self.view addSubview:self.animaView];
    [self.view addSubview:button];
    
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    button2.tag = 900;
    button2.backgroundColor = [UIColor redColor];
    [self.view addSubview:button2];
    [button2 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.popView = [[JCPopoverView alloc] initWithPoint:CGPointMake(200, 50) titles:@[@"1",@"2",@"3"] images:nil];
    
    self.popView.selectRowAtIndex = ^(NSInteger index){
        if (index==1) {
            NSLog(@"1111111");
        }
    };
    
    
    
    

    
    
}

-(void)buttonAction:(id)snder
{
    UIButton *button = (UIButton *)snder;
    if (button.tag==800) {
        if (self.k==0) {
            self.k=2;
            [self.animaView ViewShow];
        }
        else{
            self.k=0;
            [self.animaView ViewDismiss];
            
        }
        
        [CATransaction commit];
    }
    else{
        [self.popView show];
    }
    
    
    //self.testView.transform = CGAffineTransformMakeScale(0.01f, 0.01f);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
