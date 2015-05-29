//
//  CustomActionSheet.m
//  LZWCustomActionSheet
//
//  Created by hbh  on 14-9-26.
//  Copyright (c) 2014年 lizhiwei. All rights reserved.
//

#import "LZWCustomActionSheet.h"

#define WINDOW_COLOR [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4]
#define ANIMATE_DURATION                        0.25f
#define ACTIONSHEET_BACKGROUNDCOLOR             [UIColor colorWithRed:106/255.00f green:106/255.00f blue:106/255.00f alpha:0.8]


static CGRect test;
@implementation LZWCustomActionSheet

-(id)initWithView:(UIView *)view AndHeight:(float)height{
    self = [super init];
    if (self) {
        //初始化背景视图
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        self.backgroundColor = WINDOW_COLOR;

        //添加手势，点击背景是弹出层消失
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedCancel)];
        [self addGestureRecognizer:tapGesture];
        
       
        
        
        //生成LZWActionSheetView
        self.backGroundView = [[UIView alloc] initWithFrame:view.frame];
        [self.backGroundView.layer setCornerRadius:6.0f];

        self.backGroundView.backgroundColor = [UIColor whiteColor];
         test = view.frame;
        
        [self addSubview:self.backGroundView];
        [self.backGroundView addSubview:view];
        
        [UIView animateWithDuration:0.25f animations:^{
            [self.backGroundView setFrame:view.frame];
        } completion:^(BOOL finished) {
            
        }];


    }
    
    return self;
}

- (void)tappedCancel
{
    [UIView animateWithDuration:ANIMATE_DURATION animations:^{
        [self.backGroundView setFrame:test];
        self.alpha = 0;
    } completion:^(BOOL finished) {
        if (finished) {
            [self removeFromSuperview];
        }
    }];
}

-(void)showInView:(UIView *)view{
    [[UIApplication sharedApplication].delegate.window.rootViewController.view addSubview:self];
    
}



-(void)docancel
{
    [self tappedCancel];
}



@end
