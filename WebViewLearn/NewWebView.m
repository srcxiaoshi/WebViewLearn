//
//  NewWebView.m
//  WebViewLearn
//
//  Created by baidu on 16/8/11.
//  Copyright © 2016年 shiruichang. All rights reserved.
//

#import "NewWebView.h"

@implementation NewWebView

- (instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    self.scrollView.frame=CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
    self.scrollView.backgroundColor=[UIColor greenColor];
    self.bottomView=[[UIView alloc]initWithFrame:CGRectMake(frame.origin.x, frame.origin.y+frame.size.height, frame.size.width, frame.size.height/2)];
    [self addSubview:self.bottomView];
    self.scrollView.delegate=self;
    return self;
}

#pragma mark newWebView.ScrollView UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"滑动了\n");
    NSLog(@"%f,%f\n",scrollView.contentOffset.y,scrollView.contentSize.height);
    if (-scrollView.contentOffset.y+scrollView.contentSize.height<=self.frame.size.height) {
        NSLog(@"到头了\n");
    }
}



@end
