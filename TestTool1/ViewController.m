//
//  ViewController.m
//  TestTool1
//
//  Created by 二哈 on 16/11/14.
//  Copyright © 2016年 侯森魁. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button =  [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setTitle:@"拉起其他应用" forState:UIControlStateNormal];
    
    button .frame = CGRectMake(100, 100, 200, 100);
    
    button.backgroundColor = [UIColor redColor];
    
    [button addTarget:self action:@selector(jumpforOtherApp) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
}

- (void)jumpforOtherApp{
    
    if ([[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:@"anyoffice://"]])
    {
        
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"anyoffice://"]];
        
    }

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
