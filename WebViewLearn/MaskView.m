//
//  MaskView.m
//  WebViewLearn
//
//  Created by baidu on 16/8/12.
//  Copyright © 2016年 shiruichang. All rights reserved.
//

#import "MaskView.h"
#import "backView.h"

@implementation MaskView

#pragma mark - 视图控制器的触摸事件
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    NSLog(@"start\n");
    //取得当前位置
    self.begin=[[touches anyObject] locationInView:self];
    if (self.backView) {
        //对开始点再细分
        
        //开始点在web中
        if ([self.backView.webView pointInside:self.begin withEvent:event]) {
            self.isInWeb=YES;
        }
        else if([self.backView.myScrollView pointInside:self.begin withEvent:event])
        {
            self.isInWeb=NO;
        }
            
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    NSLog(@"moving\n");
    //取得一个触摸对象（对于多点触摸可能有多个对象）
    UITouch *touch=[touches anyObject];

    //取得当前位置
    CGPoint nowPoint=[touch locationInView:self];
    NSLog(@"");
    //移动逻辑
    if (self.isInWeb)
    {
        //判断是向上移动，还是向下移动
        //这里只是关注y坐标
        
        //向下滑动
        if (nowPoint.y-self.begin.y>=0)
        {
            
            //move 点在web中
            if ([self.backView.webView pointInside:nowPoint withEvent:event]) {
                //先不考虑滑动速度
                self.backView.webView.scrollView.contentOffset=CGPointMake(self.backView.webView.scrollView.contentOffset.x, self.backView.webView.scrollView.contentOffset.y-(nowPoint.y-self.begin.y));
                self.begin=nowPoint;
            }
            else
            {
                //不在不处理
            }
            
        }
        else    //向上
        {
            //关键点
            //move 点在web中
            if ([self.backView.webView pointInside:nowPoint withEvent:event]) {
                //先不考虑滑动速度
                //处理webView到底后，外面的scrollView滑动
                if (self.backView.webView.isEnd) {
                    //到底了
                    self.backView.myScrollView.contentOffset=CGPointMake(self.backView.myScrollView.contentOffset.x, self.backView.myScrollView.contentOffset.y-(nowPoint.y-self.begin.y));
                    self.begin=nowPoint;
                }
                else
                {
                    self.backView.webView.scrollView.contentOffset=CGPointMake(self.backView.webView.scrollView.contentOffset.x, self.backView.webView.scrollView.contentOffset.y-(nowPoint.y-self.begin.y));
                    self.begin=nowPoint;
                }
            }
            else
            {
                //不在不处理
            }
        }
    }
    else
    {
        //开始点不在webView
        
    }
    
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"end\n");
}


@end
