//
//  NextViewController.m
//  LLPieChart
//
//  Created by LiXingLe on 16/3/10.
//  Copyright © 2016年 com.wildcat. All rights reserved.
//

#import "NextViewController.h"
#import "LLPieView.h"
@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    LLPieView *pie =[[LLPieView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    pie.circularRingRadius =20.f;    //圆环半径
    pie.radius = 100.f;              //圆饼半径
    pie.isShowSeperate=NO;           //是否显示分割
    [pie setTitle:@"资产总额(元)"
      andSubTitle:[NSString stringWithFormat:@"%.2f",200.f+300]];
    
    [pie setDataSource:@[@200, @300,@300,@500]
              andColor:@[HEXCOLOR(0x5c99fd),HEXCOLOR(0xf0595e),HEXCOLOR(0x005900),HEXCOLOR(0x005945)]];
    [self.view addSubview:pie];
    
    

}



@end
