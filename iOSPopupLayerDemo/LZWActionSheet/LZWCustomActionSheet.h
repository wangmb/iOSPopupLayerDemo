//
//  CustomActionSheet.h
//  LZWCustomActionSheet
//
//  Created by hbh  on 14-9-26.
//  Copyright (c) 2014年 lizhiwei. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface LZWCustomActionSheet : UIView
-(id)initWithView:(UIView *)view AndHeight:(float)height;

-(void)showInView:(UIView *)view;

@property (nonatomic,strong) UIView *backGroundView;
@property (nonatomic,assign) CGFloat LXActionSheetHeight;
- (void)tappedCancel;
@end
