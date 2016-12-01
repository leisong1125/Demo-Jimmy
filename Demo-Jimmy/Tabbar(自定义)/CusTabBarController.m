//
//  CusTabBarController.m
//  Demo-Jimmy
//
//  Created by Lenwave on 16/11/29.
//  Copyright © 2016年 family. All rights reserved.
//

#import "CusTabBarController.h"

@interface CusTabBarController ()<CusTabBarViewDelegate,HyPopMenuViewDelegate>

@property(nonatomic,strong)CusTabBarView *tabBtn2;

@property (nonatomic, strong) HyPopMenuView* menu;

@end

@implementation CusTabBarController


- (instancetype)init
{
    self = [super init];
    if (self) {
        //初始化
        // 创建子控制器
        
        HomePageVC *home = [[HomePageVC alloc] init];
        
        [self addControllerWithClass:home title:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
        NewsVC *message = [[NewsVC alloc] init];
        [self addControllerWithClass:message title:@"消息" image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
        FoundVC *discover = [[FoundVC alloc] init];
        [self addControllerWithClass:discover title:@"发现" image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected"];
        MineVC *profile = [[MineVC alloc] init];
        [self addControllerWithClass:profile title:@"我" image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
        [self pop];
    }
    return self;
}

- (void)pop
{
    _menu = [HyPopMenuView sharedPopMenuManager];
    PopMenuModel* model = [PopMenuModel
                           allocPopMenuModelWithImageNameString:@"tabbar_compose_idea"
                           AtTitleString:@"文字/头条"
                           AtTextColor:[UIColor grayColor]
                           AtTransitionType:PopMenuTransitionTypeCustomizeApi
                           AtTransitionRenderingColor:nil];
    
    PopMenuModel* model1 = [PopMenuModel
                            allocPopMenuModelWithImageNameString:@"tabbar_compose_photo"
                            AtTitleString:@"相册/视频"
                            AtTextColor:[UIColor grayColor]
                            AtTransitionType:PopMenuTransitionTypeSystemApi
                            AtTransitionRenderingColor:nil];
    
    PopMenuModel* model2 = [PopMenuModel
                            allocPopMenuModelWithImageNameString:@"tabbar_compose_camera"
                            AtTitleString:@"拍摄/短视频"
                            AtTextColor:[UIColor grayColor]
                            AtTransitionType:PopMenuTransitionTypeCustomizeApi
                            AtTransitionRenderingColor:nil];
    
    PopMenuModel* model3 = [PopMenuModel
                            allocPopMenuModelWithImageNameString:@"tabbar_compose_lbs"
                            AtTitleString:@"签到"
                            AtTextColor:[UIColor grayColor]
                            AtTransitionType:PopMenuTransitionTypeSystemApi
                            AtTransitionRenderingColor:nil];
    
    PopMenuModel* model4 = [PopMenuModel
                            allocPopMenuModelWithImageNameString:@"tabbar_compose_review"
                            AtTitleString:@"点评"
                            AtTextColor:[UIColor grayColor]
                            AtTransitionType:PopMenuTransitionTypeCustomizeApi
                            AtTransitionRenderingColor:nil];
    
    PopMenuModel* model5 = [PopMenuModel
                            allocPopMenuModelWithImageNameString:@"tabbar_compose_more"
                            AtTitleString:@"更多"
                            AtTextColor:[UIColor grayColor]
                            AtTransitionType:PopMenuTransitionTypeSystemApi
                            AtTransitionRenderingColor:nil];
    
    _menu.dataSource = @[ model, model1, model2, model3, model4, model5 ];
    _menu.delegate = self;
    _menu.popMenuSpeed = 12.0f;
    _menu.automaticIdentificationColor = false;
    _menu.animationType = HyPopMenuViewAnimationTypeViscous;
    
    popMenvTopView* topView = [popMenvTopView popMenvTopView];
    topView.frame = CGRectMake(0, 44, CGRectGetWidth(self.view.frame), 92);
    _menu.topView = topView;

}



-(void)addControllerWithClass:(UIViewController*)vc title:(NSString *)title image:(NSString *)ImageName selectedImage:(NSString  *)selectImg{
    UINavigationController *nv=[[UINavigationController alloc]initWithRootViewController:vc];
    vc.tabBarItem.title=title;
    vc.tabBarItem.image=[UIImage imageNamed:ImageName];
    //选中时的图片
    UIImage *newImage=[UIImage imageNamed:selectImg];
    newImage=[newImage imageWithRenderingMode:YES];//图片原样显示
    vc.tabBarItem.selectedImage=newImage;
    
    // 设置tabBarButton的标题颜色的文字
    [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]} forState:UIControlStateSelected];
    
    [self addChildViewController:nv];
    
    //系统的tabbarItem已经被移除，这里我们需要把我们自定义的tabbar中加上一个tabbarItem，
    [self.tabBtn2 addtabbarItem:vc.tabBarItem];
    
}

//实现代理方法
-(void)tabbar:(CusTabBarView *)tabBar selectBtnFrom:(NSInteger)from to:(NSInteger)to{
    //切换控制器
    UIViewController *vc = self.childViewControllers[to];
    self.selectedViewController = vc;
    
}

-(void)plusBtnClick
{
    _menu.backgroundType = HyPopMenuViewBackgroundTypeLightBlur;
    [_menu openMenu];
}


- (void)popMenuView:(HyPopMenuView*)popMenuView didSelectItemAtIndex:(NSUInteger)index
{
    OtherVC * otherVC = [[OtherVC alloc] init];
    otherVC.modalPresentationStyle = UIModalPresentationPopover;

    [self presentViewController:otherVC animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建自定义tabbar2
    CusTabBarView *tabbar=[[CusTabBarView alloc]init];//init创建控件
    //设置大小
    tabbar.frame=self.tabBar.frame;
    //添加到父控件中
    [self.view addSubview:tabbar];
    
    self.tabBtn2=tabbar;
    
    //移除系统的tabBar
    [self.tabBar removeFromSuperview];
    
    
    //设置代理
    tabbar.delegate=self;
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
