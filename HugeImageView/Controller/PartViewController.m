//
//  PartViewController.m
//  HugeImageLoader
//
//  Created by Jakey on 2016/11/3.
//  Copyright © 2016年 Jakey. All rights reserved.
//

#import "PartViewController.h"
#import <ImageIO/ImageIO.h>
@interface PartViewController ()

@end

@implementation PartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"分片加载巨图";
    // Do any additional setup after loading the view from its nib.
    
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    viewDidLoad中 1000 1000 fuck了
    [self.hugeImageView loadImageNamed:@"huge"];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)smallTouched:(id)sender {
    self.hugeImageView.imageScale = self.hugeImageView.imageScale/2;
}

- (IBAction)bigTouched:(id)sender {
    self.hugeImageView.imageScale = self.hugeImageView.imageScale*2;
}
@end
