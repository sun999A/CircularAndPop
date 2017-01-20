//
//  RootViewController.m
//  CircularAndPop
//
//  Created by feiyu iOS on 17/1/20.
//  Copyright © 2017年 Mwy Group. All rights reserved.
//

#import "RootViewController.h"
#import "UIImageView+CornerRadius.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
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
