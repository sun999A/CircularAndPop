//
//  RootViewController.m
//  CircularAndPop
//
//  Created by feiyu iOS on 17/1/20.
//  Copyright © 2017年 Mwy Group. All rights reserved.
//

#import "RootViewController.h"
#import "UIImageView+CornerRadius.h"
#import "LCActionSheet.h"
@interface RootViewController ()<UIAlertViewDelegate, LCActionSheetDelegate>

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(20, 150, 100, 100);
    [button setTitle:@"弹出框" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(click) forControlEvents:1 <<  6];
    [self.view addSubview:button];
    
    
    
#pragma notification --- 本工具提供两种使用方式，UIImageView+CornerRadius较方便，若不喜欢使用Category方式则可以使用ZYImageView。
    
    
#pragma mark - 圆形
     UIImageView *imageView = [[UIImageView alloc] initWithRoundingRectImageView];
    [imageView setFrame:CGRectMake(130, 80, 150, 150)];
    [self.view addSubview:imageView];
    
    
    //UIImageView *imageViewSecond = [[UIImageView alloc] initWithCornerRadiusAdvance:20.f rectCornerType:UIRectCornerBottomLeft | UIRectCornerTopRight  | UIRectCornerBottomRight];
     UIImageView *imageViewSecond = [[UIImageView alloc] initWithCornerRadiusAdvance:20.f rectCornerType:UIRectCornerAllCorners];
    [imageViewSecond setFrame:CGRectMake(130, 280, 150, 150)];
    [self.view addSubview:imageViewSecond];
    
    
    UIImageView *imageViewThird = [[UIImageView alloc] initWithFrame:CGRectMake(130, 480, 150, 150)];
    //[imageViewThird zy_cornerRadiusAdvance:20.f rectCornerType:UIRectCornerBottomRight | UIRectCornerTopLeft];
    [imageViewThird zy_cornerRadiusRoundingRect];
    [imageViewThird zy_attachBorderWidth:5.f color:[UIColor blackColor]];
    [self.view addSubview:imageViewThird];
    
    
#pragma mark - setImage anytime
    imageView.image = [UIImage imageNamed:@"mac_dog"];
    imageViewSecond.image = [UIImage imageNamed:@"mac_dog"];
    imageViewThird.image = [UIImage imageNamed:@"mac_dog"];

}


- (void)click{
//    LCActionSheet *actionSheet = [LCActionSheet sheetWithTitle:@"Default LCActionSheet"
//                                                      delegate:self
//                                             cancelButtonTitle:@"Cancel"
//                                             otherButtonTitles:@"Button 1", @"Button 2", @"Button 3", nil];
//    [actionSheet show];
    
//    LCActionSheet *actionSheet     = [[LCActionSheet alloc] initWithTitle:nil
//                                                                 delegate:self
//                                                        cancelButtonTitle:@"Cancel"
//                                                        otherButtonTitles:@"Button 1", @"Button 2", @"Button 3", @"This is a very very very very very very long button title~", @"Button 5", nil];
//    actionSheet.title              = @"This is a very very very very very very very very very very very very very very very very very very very very very very very very very very very long title~";
//    actionSheet.cancelButtonTitle  = @"Close";
//    [actionSheet appendButtonTitles:@"Button 6", @"Button 7", nil];
//    actionSheet.titleColor         = [UIColor orangeColor];
//    actionSheet.buttonColor        = [UIColor greenColor];
//    actionSheet.titleFont          = [UIFont boldSystemFontOfSize:15.0f];
//    actionSheet.buttonFont         = [UIFont boldSystemFontOfSize:15.0f];
//    actionSheet.buttonHeight       = 60.0f;
//    actionSheet.scrolling          = YES;
//    actionSheet.visibleButtonCount = 3.6f;
//    actionSheet.darkViewNoTaped    = YES;
//    actionSheet.unBlur             = YES;
//    
//    // V 2.1.0+ Use `destructiveButtonIndexSet` instead `redButtonIndexSet`.
//    actionSheet.destructiveButtonIndexSet = [NSSet setWithObjects:@0, @2, nil];
//    actionSheet.destructiveButtonColor    = [UIColor blueColor];
//    
//    // V 2.7.0+
//    actionSheet.titleEdgeInsets = UIEdgeInsetsMake(10, 20, 30, 40);
//    
//    // V 2.7.1+
//    actionSheet.separatorColor = [UIColor orangeColor];
//    
//    [actionSheet show];

    LCActionSheet *actionSheet = [LCActionSheet sheetWithTitle:@"Block LCActionSheet" cancelButtonTitle:@"Cancel" clicked:^(LCActionSheet *actionSheet, NSInteger buttonIndex) {
        
        NSLog(@"clickedButtonAtIndex: %d", (int)buttonIndex);
        
    } otherButtonTitles:@"Button 1", @"Button 2", @"Button 3", @"Button 4", @"Button 5", @"Button 6", nil];
    
    // actionSheet.blurEffectStyle = UIBlurEffectStyleLight;
    
    actionSheet.scrolling          = YES;
    actionSheet.visibleButtonCount = 3.6f;
    
    actionSheet.willPresentHandle = ^(LCActionSheet *actionSheet) {
        NSLog(@"willPresentActionSheet-");
    };
    
    actionSheet.didPresentHandle = ^(LCActionSheet *actionSheet) {
        NSLog(@"didPresentActionSheet-");
    };
    
    actionSheet.willDismissHandle = ^(LCActionSheet *actionSheet, NSInteger buttonIndex) {
        NSLog(@"willDismissWithButtonIndex:- %d", (int)buttonIndex);
    };
    
    actionSheet.didDismissHandle = ^(LCActionSheet *actionSheet, NSInteger buttonIndex) {
        NSLog(@"didDismissWithButtonIndex:- %d", (int)buttonIndex);
    };
    
    [actionSheet show];

    
}



#pragma mark - LCActionSheet Delegate

- (void)actionSheet:(LCActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"clickedButtonAtIndex: %d", (int)buttonIndex);
}

- (void)willPresentActionSheet:(LCActionSheet *)actionSheet {
    NSLog(@"willPresentActionSheet");
}

- (void)didPresentActionSheet:(LCActionSheet *)actionSheet {
    NSLog(@"didPresentActionSheet");
}

- (void)actionSheet:(LCActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex {
    NSLog(@"willDismissWithButtonIndex: %d", (int)buttonIndex);
}

- (void)actionSheet:(LCActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    NSLog(@"didDismissWithButtonIndex: %d", (int)buttonIndex);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
