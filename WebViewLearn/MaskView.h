//
//  MaskView.h
//  WebViewLearn
//
//  Created by baidu on 16/8/12.
//  Copyright © 2016年 shiruichang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class backView;
@interface MaskView : UIView


//开始移动的点
@property(nonatomic,assign)CGPoint begin;

//
@property(nonatomic,weak)backView *backView;

//开始点，在web,还是在Scroll,在web=YES，在scroll=NO
@property(nonatomic,assign)BOOL isInWeb;

@end
