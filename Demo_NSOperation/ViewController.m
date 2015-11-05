//
//  ViewController.m
//  Demo_NSOperation
//
//  Created by TuTu on 15/11/4.
//  Copyright © 2015年 teason. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //创建NSInvocationOperation对象，封装操作
    NSInvocationOperation *operation1 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(test1) object:nil];
    NSInvocationOperation *operation2 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(test2) object:nil];
    
    //创建对象，封装操作
    NSBlockOperation *operation3 = [NSBlockOperation blockOperationWithBlock:^{
        for (int i=0; i<5; i++) {
            NSLog(@"NSBlockOperation3--1----%@",[NSThread currentThread]);
        }
    }];

    [operation3 addExecutionBlock:^{
        for (int i=0; i<5; i++) {
            NSLog(@"NSBlockOperation3--2----%@",[NSThread currentThread]);
        }
    }];
    

    //创建NSOperationQueue
    NSOperationQueue * queue = [[NSOperationQueue alloc] init];
    //把操作添加到队列中
    [queue addOperation:operation1];
    [queue addOperation:operation2];
    [queue addOperation:operation3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)test1
{
    for (int i=0; i<5; i++) {
        NSLog(@"NSInvocationOperation--test1--%@",[NSThread currentThread]);
    }
}

-(void)test2
{
    for (int i=0; i<5; i++) {
        NSLog(@"NSInvocationOperation--test2--%@",[NSThread currentThread]);
    }
}

@end


