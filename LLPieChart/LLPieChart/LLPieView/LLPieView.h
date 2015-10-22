//
//  LLPieView.h
//  PieChartDemo
//
//  Created by LiXingLe on 15/10/13.
//  Copyright © 2015年 com.wildcat. All rights reserved.
//

#import <UIKit/UIKit.h>

#define HEXCOLOR(c)                         [UIColor colorWithRed:((c>>16)&0xFF)/255.0f green:((c>>8)&0xFF)/255.0f blue:(c&0xFF)/255.0f alpha:1.0f]

@interface LLPieView : UIView


@property (nonatomic,assign) CGFloat circularRingRadius;
/* 设置数据源*/
-(void) setDataSource:(NSArray *)dataSource andColor:(NSArray *)colorArray;
/* 设置标题和子标题*/
-(void)setTitle:(NSString *)title andSubTitle:(NSString *)subtitle;

@property (nonatomic, assign) BOOL isShowSeperate;

@end
