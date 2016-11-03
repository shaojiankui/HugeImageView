//
//  RootViewController.m
//  HugeImageLoader
//
//  Created by Jakey on 2016/11/3.
//  Copyright © 2016年 Jakey. All rights reserved.
//

#import "RootViewController.h"
#import "HugeViewController.h"
#import "PartViewController.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)hugeTouched:(id)sender {
    HugeViewController *huge = [[HugeViewController alloc]init];
    [self.navigationController pushViewController:huge animated:YES];
}

- (IBAction)partTouched:(id)sender {
    PartViewController *part = [[PartViewController alloc]init];
    [self.navigationController pushViewController:part animated:YES];
}
@end
