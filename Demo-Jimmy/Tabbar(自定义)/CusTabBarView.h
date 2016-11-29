//
//  CusTabBarView.h
//  Demo-Jimmy
//
//  Created by Lenwave on 16/11/29.
//  Copyright © 2016年 family. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CusTabBarView;
@protocol CusTabBarViewDelegate <NSObject>

-(void)tabbar:(CusTabBarView *)tabBar selectBtnFrom:(NSInteger)from to:(NSInteger)to;

-(void)plusBtnClick;

@end

@interface CusTabBarView : UIView


-(void)addtabbarItem:(UITabBarItem *)item;

@property(nonatomic,weak)id<CusTabBarViewDelegate>delegate;

@end
