//
//  MulticastDelegateBaseObject.h
//  MyXMPP
//
//  Created by 龚海伟 on 14-9-24.
//  Copyright (c) 2014年 龚海伟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCDMulticastDelegate.h"

//多播委托的基类
@interface MulticastDelegateBaseObject : NSObject{
    id multicastDelegate;
    dispatch_queue_t moduleQueue;
    void *moduleQueueTag;
}

- (id)init;
- (id)initWithDispatchQueue:(dispatch_queue_t)queue;

@property (readonly) dispatch_queue_t moduleQueue;
@property (readonly) void *moduleQueueTag;

- (void)addDelegate:(id)delegate delegateQueue:(dispatch_queue_t)delegateQueue;
- (void)removeDelegate:(id)delegate delegateQueue:(dispatch_queue_t)delegateQueue;
- (void)removeDelegate:(id)delegate;
@end
