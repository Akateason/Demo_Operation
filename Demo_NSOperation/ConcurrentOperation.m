//
//  TestOperation.m
//  Demo_NSOperation
//
//  Created by TuTu on 15/11/4.
//  Copyright © 2015年 teason. All rights reserved.
//

#import "ConcurrentOperation.h"

@interface ConcurrentOperation ()

@property (nonatomic, assign) BOOL finished;
@property (nonatomic, assign) BOOL executing;

@end


@implementation ConcurrentOperation

@synthesize finished = _finished;
@synthesize executing = _executing;

- (void)setFinished:(BOOL)finished {
    [self willChangeValueForKey:@"isFinished"];
    _finished = finished;
    [self didChangeValueForKey:@"isFinished"];
}

- (void)setExecuting:(BOOL)executing {
    [self willChangeValueForKey:@"isExecuting"];
    _executing = executing;
    [self didChangeValueForKey:@"isExecuting"];
}

- (void)start
{
    if ([self isCancelled])
    {
        _finished = YES;
        return;
    }
    else
    {
        _executing = YES;
        //start your task;
        
        //end your task
        
        _executing = NO;
        _finished = YES;
    }
}

@end
