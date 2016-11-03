//
//  PartViewController.h
//  HugeImageLoader
//
//  Created by Jakey on 2016/11/3.
//  Copyright © 2016年 Jakey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HugeImageView.h"
@interface PartViewController : UIViewController

@property (weak, nonatomic) IBOutlet HugeImageView *hugeImageView;

- (IBAction)smallTouched:(id)sender;
- (IBAction)bigTouched:(id)sender;

@end
