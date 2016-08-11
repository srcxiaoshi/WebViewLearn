//
//  NewWebView.h
//  WebViewLearn
//
//  Created by baidu on 16/8/11.
//  Copyright © 2016年 shiruichang. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol UIScrollViewFromWebViewDelegate <NSObject>

- (void)WebScrollViewDidScroll:(UIScrollView *)scrollView;

@end

@interface NewWebView : UIWebView <UIScrollViewDelegate>

@property(nonatomic,strong)UIView *bottomView;

@property(nonatomic,weak) id<UIScrollViewFromWebViewDelegate>  webScrollViewDelegate;

@end
