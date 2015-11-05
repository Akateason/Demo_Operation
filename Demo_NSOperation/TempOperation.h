//
//  TempOperation.h
//  Demo_NSOperation
//
//  Created by TuTu on 15/11/4.
//  Copyright © 2015年 teason. All rights reserved.
//
/**
 *  定义非并发的NSOperation要简单许多,只需要重载-(void)main这个方法，在这个方法里面执行主任务,并正确地响应取消事件;
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// 图片下载的协议
@protocol DownloadOperationDelegate <NSObject>
- (void)downloadFinishWithImage:(UIImage *)image;
@end


@interface TempOperation : NSOperation
// 图片的url路径
@property(nonatomic, copy) NSString *imageUrl;
// 代理
@property(nonatomic, weak) id delegate ;
- (id)initWithUrl:(NSString *)url delegate:(id)delegate;

@end
