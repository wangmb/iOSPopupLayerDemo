//
//  ViewController.m
//  iOSPopupLayerDemo
//
//  Created by chentianyu on 15/5/29.
//  Copyright (c) 2015年 chentianyu. All rights reserved.
//

#import "ViewController.h"
#import "LZWCustomActionSheet.h"
#import "PrefixHeader.pch"

@interface ViewController ()<UITextFieldDelegate>
{
    UIView *testView;
    
    
    UILabel *popupLayertitle;
    UILabel *topSeperatorLabel;
    UILabel *usernameLabel;
    UITextField *testTextField;
    UIButton *confirmButton;
    UILabel *bottomSeperatorLabel;
    UILabel *noteLabel;
    
    LZWCustomActionSheet *sheet;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)selectAction:(UIButton *)sender {
    
    testView = [[UIView alloc] initWithFrame:CGRectMake(20,44, self.view.frame.size.width-40, 300)];
    
    
    popupLayertitle  = [[UILabel alloc] initWithFrame:CGRectMake(0, -32, 200, 30)];
    [popupLayertitle setText:@"添加绑定用户名"];
    [popupLayertitle setTextColor:[UIColor colorWithRed:42/255.0f green:187/255.0f blue:157/255.0f alpha:1.0f]];
    [testView addSubview:popupLayertitle];
    
    topSeperatorLabel = [[UILabel alloc] initWithFrame:CGRectMake(-20, 0, testView.frame.size.width, 1)];
    [topSeperatorLabel setBackgroundColor:[UIColor colorWithRed:42/255.0f green:187/255.0f blue:157/255.0f alpha:1.0f]];
    [testView addSubview:topSeperatorLabel];
    
    usernameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, 60, 30)];
    [usernameLabel setText:@"用户名"];
    [usernameLabel setTextColor:RGB(142,143,143,1.0f)];
    [testView addSubview:usernameLabel];
    
    
    
    testTextField = [[UITextField alloc] initWithFrame:CGRectMake(60, 40, 200, 30)];
    [testView addSubview:testTextField];
    
    [testTextField.layer setBorderWidth:1.0f];
    [testTextField.layer setBorderColor:RGB(142,143,143,0.4f).CGColor];
    [testTextField setDelegate:self];
    
    
    confirmButton =  [[UIButton alloc] initWithFrame:CGRectMake(0, 100, testView.frame.size.width-40, 30)];
    [confirmButton setBackgroundColor:RGB(42, 187, 157, 1.0f)];
    [confirmButton setTitle:@"确认添加" forState:UIControlStateNormal];
    [confirmButton.layer setCornerRadius:4.0f];
    [confirmButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [confirmButton addTarget:self action:@selector(getUsername) forControlEvents:UIControlEventTouchUpInside];
    [testView addSubview:confirmButton];
    
    bottomSeperatorLabel = [[UILabel alloc] initWithFrame:CGRectMake(-20, 170, testView.frame.size.width, 1)];
    [bottomSeperatorLabel setBackgroundColor:RGB(142, 143, 143, 0.3f)];
    [testView addSubview:bottomSeperatorLabel];
    
    
    noteLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 173, testView.frame.size.width-40, 30)];
    [noteLabel setLineBreakMode:NSLineBreakByCharWrapping];
    [noteLabel setNumberOfLines:0];
    [noteLabel setText:@"注:绑定用户名只能添加一次,添加后不能修改"];
    CGSize size = [noteLabel sizeThatFits:CGSizeMake(noteLabel.frame.size.width, MAXFLOAT)];
    [noteLabel setFrame:CGRectMake(0, 173, testView.frame.size.width-40, size.height)];
    [noteLabel setTextColor:RGB(230,125,53,1.0f)];
    [testView addSubview:noteLabel];
    
    
    sheet = [[LZWCustomActionSheet alloc] initWithView:testView AndHeight:200];
    
    [sheet showInView:self.view];
}




- (void)getUsername
{
    NSLog(@"%@",testTextField.text);
    [sheet tappedCancel];
}

#pragma mark - 文本框委托方法
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
