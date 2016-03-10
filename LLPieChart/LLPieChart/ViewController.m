//
//  ViewController.m
//  LLPieChart
//
//  Created by LiXingLe on 15/10/22.
//  Copyright © 2015年 com.wildcat. All rights reserved.
//

#import "ViewController.h"
#import "LLPieView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet LLPieView *pieView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"LLPieChart";
    
    self.pieView.isShowSeperate=YES;                //是否显示分割
    self.pieView.radius = 130.f;                    //圆饼半径
    self.pieView.circularRingRadius = 50.f;         //圆环半径
    [self.pieView setTitle:@"资产总额(元)"
               andSubTitle:[NSString stringWithFormat:@"%.2f",200.f+300]];
    //设置数据源
    [self.pieView setDataSource:@[@200, @300,@300]
                       andColor:@[HEXCOLOR(0x5c99fd),HEXCOLOR(0xf0595e),HEXCOLOR(0x005900)]];

}


@end
