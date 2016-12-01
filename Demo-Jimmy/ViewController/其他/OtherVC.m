//
//  OtherVC.m
//  Demo-Jimmy
//
//  Created by jimmy on 2016/11/29.
//  Copyright © 2016年 family. All rights reserved.
//

#import "OtherVC.h"

@interface OtherVC ()

@end

@implementation OtherVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UINavigationController * navi = [[UINavigationController alloc] initWithRootViewController:self];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor redColor];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
    self.view.backgroundColor = [UIColor whiteColor];
//    self.view.alpha = .3;
    
}

- (void)click
{
    UIViewController * vC = [[UIViewController alloc] init];
    
    [self.navigationController pushViewController:vC animated:YES];
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
