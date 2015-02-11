//
//  ViewController.m
//  Test_约束代码
//
//  Created by admin on 15-1-22.
//  Copyright (c) 2015年 ___CC___. All rights reserved.
//

#import "ViewController.h"
#import "TestView.h"

@interface ViewController ()
@property (nonatomic,strong) TestView *animaView;
@property (nonatomic) int k;
@property CGPoint pointNow;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    self.k = 0;
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(200, 200, 100, 100)];
    button.backgroundColor = [UIColor brownColor];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.animaView = [TestView makeNewViewWithFrame:CGRectMake(0, 0, 100, 100) andPoint:button.center];
    [self.view addSubview:self.animaView];
    [self.view addSubview:button];
    

    
    
    
    
    

    
    
}

-(void)buttonAction:(id)snder
{
    
    
    if (self.k==0) {
        self.k=2;
        [self.animaView ViewShow];
    }
    else{
        self.k=0;
        [self.animaView ViewDismiss];
        
    }
    
    [CATransaction commit];
    
    //self.testView.transform = CGAffineTransformMakeScale(0.01f, 0.01f);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
