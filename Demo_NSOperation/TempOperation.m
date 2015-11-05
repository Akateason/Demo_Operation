//
//  TempOperation.m
//  Demo_NSOperation
//
//  Created by TuTu on 15/11/4.
//  Copyright © 2015年 teason. All rights reserved.
//

#import "TempOperation.h"

@implementation TempOperation
@synthesize delegate = _delegate;
@synthesize imageUrl = _imageUrl;

// 初始化
- (id)initWithUrl:(NSString *)url delegate:(id)delegate
{
    if(self = [super init])
    {
        self.imageUrl = url;
        self.delegate = delegate;
    }
    
    return self;
}

//// 释放内存
//- (void)dealloc
//{
//    [super dealloc];
//    [_delegate release];
//    [_imageUrl release];
//}


/**
 *  定义非并发的NSOperation要简单许多,只需要重载-(void)main这个方法，在这个方法里面执行主任务,并正确地响应取消事件;
 */

// 执行主任务
- (void)main
{
    // 新建一个自动释放池，如果是异步执行操作，那么将无法访问到主线程的自动释放池
    @autoreleasepool
    {
        if(self.isCancelled) return;
        
        // 获取图片数据
        NSURL *url = [NSURL URLWithString:self.imageUrl];
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        if(self.isCancelled) {
            url = nil ;
            imageData = nil ;
            return ;
        }
        
        // 初始化图片
        UIImage *image = [UIImage imageWithData:imageData];
        if(self.isCancelled) {
            image = nil ;
            return ;
        }
        
        if([self.delegate respondsToSelector:@selector(downloadFinishWithImage:)])
        {
            // 把图片数据传回到主线程
            [(NSObject *)self.delegate performSelectorOnMainThread:@selector(downloadFinishWithImage:)
                                                        withObject:image
                                                     waitUntilDone:NO] ;
        }
    }
}

@end
