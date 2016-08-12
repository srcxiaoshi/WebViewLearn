//
//  NewWebView.m
//  WebViewLearn
//
//  Created by baidu on 16/8/11.
//  Copyright © 2016年 shiruichang. All rights reserved.
//

#import "NewWebView.h"
//#import "UIScrollView+UITouch.h"

@implementation NewWebView

- (instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    self.scrollView.frame=CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
    self.scrollView.backgroundColor=[UIColor greenColor];
    self.bottomView=[[UIView alloc]initWithFrame:CGRectMake(frame.origin.x, frame.origin.y+frame.size.height, frame.size.width, frame.size.height/2)];
    [self addSubview:self.bottomView];
    self.scrollView.delegate=self;
    self.isEnd=NO;
    return self;
}

#pragma mark newWebView.ScrollView UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    //NSLog(@"height=%f\n",scrollView.contentSize.height);
    if (-scrollView.contentOffset.y+scrollView.contentSize.height<=self.frame.size.height) {
        self.isEnd=YES;
        //NSLog(@"到头了\n");
    }
    else
    {
        self.isEnd=NO;
    }
}


@end
