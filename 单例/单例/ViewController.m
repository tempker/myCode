//
//  ViewController.m
//  单例
//
//  Created by 元元魏 on 16/6/11.
//  Copyright © 2016年 魏元元. All rights reserved.
//

#import "ViewController.h"
#import "WYYWorkTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    WYYWorkTool *t1 = [WYYWorkTool shareWorkTool];
    WYYWorkTool *t2 = [WYYWorkTool shareWorkTool];
    WYYWorkTool *t3 = [[WYYWorkTool alloc]init];
    
    NSLog(@"t1的地址是:%p",t1);
    NSLog(@"t2的地址是:%p",t2);
    NSLog(@"t3的地址是:%p",t3);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
