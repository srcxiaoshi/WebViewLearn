//
//  UIScrollView+UITouch.h
//  WebViewLearn
//
//  Created by baidu on 16/8/11.
//  Copyright © 2016年 shiruichang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (UITouch)

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;

@end
