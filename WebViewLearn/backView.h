//
//  backView.h
//  WebViewLearn
//
/*
 基本思想如下：
 使用一个遮罩view，放在最上面，监听  touch event；
 然后下面的  UIView和它的子类都由offSet决定显示位置，进行移动
 */
//  Created by baidu on 16/8/12.
//  Copyright © 2016年 shiruichang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewWebView.h"
#import "MyScrollView.h"
#import "MaskView.h"


@interface backView : UIView

@property(nonatomic,strong)NewWebView * webView;
@property(nonatomic,strong)MyScrollView *myScrollView;
@property(nonatomic,strong)MaskView *maskView;

@end
