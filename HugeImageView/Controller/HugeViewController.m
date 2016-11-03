//
//  HugeViewController.m
//  HugeImageLoader
//
//  Created by Jakey on 2016/11/3.
//  Copyright © 2016年 Jakey. All rights reserved.
//

#import "HugeViewController.h"

@interface HugeViewController ()

@end

@implementation HugeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"直接加载巨图";
    // Do any additional setup after loading the view, typically from a nib.
//    UIImage *image = [UIImage imageNamed:@"huge.jpg"];
    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"huge" ofType:@"jpg"]];

    UIImageView *imageView = [[UIImageView alloc]init];
    CGRect rect = self.view.frame;
    rect.size.height = image.size.height/(image.size.width/self.view.frame.size.width);
    imageView.frame = rect;
    imageView.image = image;
    [self.scrollView addSubview:imageView];
    self.scrollView.contentSize = imageView.frame.size;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"didReceiveMemoryWarning");
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
