//
//  ViewController.m
//  Bifrost
//
//  Created by Tangent on 08/03/2018.
//  Copyright © 2018 Tangent. All rights reserved.
//

#import "ViewController.h"
#import "BifProtocols.h"
#import "UIControl+Bifrost.h"
#import "UIResponder+Bifrost.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [[UIButton alloc]init];
    btn.backgroundColor = [UIColor orangeColor];
    btn.frame = self.view.bounds;
    [self.view addSubview:btn];
    [btn postEvents:UIControlEventTouchUpInside identifier:@"FUCK" callback:^(NSString * _Nonnull back) {
        NSLog(@"FUCKING!!!");
        NSLog(@"%@", back);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

BIFHandler(FUCK) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        BIFCallback(@"曹操曹操");
    });
    return YES;
}

@end
