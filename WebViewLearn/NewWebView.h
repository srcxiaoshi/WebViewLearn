//
//  NewWebView.h
//  WebViewLearn
//
//  Created by baidu on 16/8/11.
//  Copyright © 2016年 shiruichang. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol UIScrollViewFromWebViewDelegate <NSObject>

- (void)WebScrollViewDidScroll:(CGPoint )begin WithEnd:(CGPoint )end;

@end





@interface NewWebView : UIWebView <UIScrollViewDelegate,UIGestureRecognizerDelegate>

@property(nonatomic,strong)UIView *bottomView;

@property(nonatomic,weak) id<UIScrollViewFromWebViewDelegate>  webScrollViewDelegate;

@property(nonatomic,assign)CGPoint begin;

@property(nonatomic,assign)CGPoint end;

@property(nonatomic,assign)BOOL isEnd;

@end
