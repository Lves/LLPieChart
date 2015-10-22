//
//  LLPieView.m
//  PieChartDemo
//
//  Created by LiXingLe on 15/10/13.
//  Copyright © 2015年 com.wildcat. All rights reserved.
//

#import "LLPieView.h"


@interface LLPieView ()
{
    double allCount;
}
@property (nonatomic,strong) NSMutableArray *degreeArray;

@property (nonatomic,strong) NSArray *dataSource;
@property (nonatomic,strong) NSArray *colorArray;
@property (nonatomic,strong) UILabel *titleLabel;  //标题
@property (nonatomic,strong) UILabel *subTitleLabel; //子标题
@end




@implementation LLPieView

static inline float radians(double degrees) {
    return degrees *  M_PI/ 180.f;
}


- (void)drawRect:(CGRect)rect {
    
    CGContextRef context=UIGraphicsGetCurrentContext();
    //设置半径
    CGFloat radius=130.f;
    if (self.circularRingRadius==0) {
        self.circularRingRadius=54.f;
    }
    
    CGFloat intRadius=radius-self.circularRingRadius;
    //设置圆心的坐标
    CGFloat centerX=self.bounds.size.width/2.f;
    CGFloat centerY=self.bounds.size.height/2.f;
    //设置起始角度
    CGFloat pieStart=90.f;
    //设置旋转方向
    int clockwise=0; //1: 顺时针 ; 0:逆时针
    
    //画扇形
    if(allCount == 0){  //无资产
        CGContextSetFillColorWithColor(context, [HEXCOLOR(0xefeff4) CGColor]);
        CGContextMoveToPoint(context, centerX, centerY);
        CGContextAddArc(context, centerX, centerY, radius,radians(0), radians(360), clockwise);
        CGContextClosePath(context);
        CGContextFillPath(context);
    }else{
        for (int i=0; i<self.degreeArray.count; i++) {
            CGFloat end=pieStart+[self.degreeArray[i] doubleValue];
            
            if (self.isShowSeperate) {
                if(i%2==0){  //分割线
                    UIColor *fillColor=self.colorArray[(int)(i/2)];
                    CGContextSetFillColorWithColor(context, [fillColor CGColor]);
                }else{
                    CGContextSetFillColorWithColor(context, [HEXCOLOR(0xefeff4) CGColor]);
                }
            }else{
                CGContextSetFillColorWithColor(context, [self.colorArray[i] CGColor]);
            }

            
            CGContextMoveToPoint(context, centerX, centerY);
            CGContextAddArc(context, centerX, centerY, radius,radians(pieStart), radians(end), clockwise);
            CGContextClosePath(context);
            CGContextFillPath(context);
            pieStart+=[self.degreeArray[i] doubleValue];
        }
        
    }
    //画内圆
    CGContextSetFillColorWithColor(context, [[UIColor whiteColor] CGColor]);
    CGContextMoveToPoint(context, centerX, centerY);
    CGContextAddArc(context, centerX, centerY, intRadius, 0, radians(360.f), 0);
    CGContextClosePath(context);
    CGContextFillPath(context);
    
}


-(void) setDataSource:(NSArray *)dataSource andColor:(NSArray *)colorArray{
    _dataSource=dataSource;
    _colorArray=colorArray;
    
    
    if (self.dataSource==nil||self.dataSource.count<=0) {
        return;
    }
    
    self.degreeArray=[NSMutableArray array];
    
    
    for (NSNumber *count in self.dataSource) {
        allCount+=[count doubleValue];
    }
    
    //计算每部分的角度
    for (int i=0; i<self.dataSource.count; i++) {
        NSNumber *number =self.dataSource[i];
        double count=[number doubleValue];
        
        if (self.isShowSeperate) {
            CGFloat degree=(count/allCount)*(360.f-2*self.dataSource.count);
            [self.degreeArray addObject:[NSNumber numberWithDouble:degree]];
            //加分割线
            [self.degreeArray addObject:[NSNumber numberWithDouble:2.f]];
        }else{
            CGFloat degree=(count/allCount)*360.f;
            [self.degreeArray addObject:[NSNumber numberWithDouble:degree]];
        }
    }
    
    
    [self setNeedsDisplay];
}


-(void)setTitle:(NSString *)title andSubTitle:(NSString *)subtitle{
    //设置圆心的坐标
    CGFloat centerX=self.bounds.size.width/2.f;
    CGFloat centerY=self.bounds.size.height/2.f;
    if (self.titleLabel==nil) {
        self.titleLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 15)];
        self.titleLabel.center=CGPointMake(centerX, centerY-16.f);
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
        self.titleLabel.textColor=HEXCOLOR(0xbebebe);
        self.titleLabel.font=[UIFont systemFontOfSize:14.f];
        [self addSubview:self.titleLabel];
    }
    
    if (self.subTitleLabel==nil){
        self.subTitleLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 18)];
        self.subTitleLabel.center=CGPointMake(centerX, centerY+16.f);
        self.subTitleLabel.textAlignment=NSTextAlignmentCenter;
        self.subTitleLabel.textColor=HEXCOLOR(0x222222);
        self.subTitleLabel.font=[UIFont systemFontOfSize:18.f];
        self.subTitleLabel.adjustsFontSizeToFitWidth=YES;
        [self.subTitleLabel setMinimumScaleFactor:0.5f];
        [self addSubview:self.subTitleLabel];
    }
    
    self.titleLabel.text=title;
    self.subTitleLabel.text=subtitle;
    
}


@end
