
# LLPieChart
* LLPieChart is A simple piechart library for Objective-C.
* 一个简单的饼图实现。

## 内容
* Getting Started
    * 支持xib 和代码集成
    * 支持饼图中间有分割线形式
    * 一分钟集成

## 使用

```objc
LLPieView *pie =[[LLPieView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
pie.circularRingRadius =20.f;    //圆环半径
pie.radius = 100.f;              //圆饼半径
pie.isShowSeperate=NO;           //是否显示分割
[pie setTitle:@"资产总额(元)"
  andSubTitle:[NSString stringWithFormat:@"%.2f",200.f+300]];
    
[pie setDataSource:@[@200, @300,@300,@500]
          andColor:@[HEXCOLOR(0x5c99fd),HEXCOLOR(0xf0595e),HEXCOLOR(0x005900),HEXCOLOR(0x005945)]];
[self.view addSubview:pie];

```

##效果展示

![(xib实现)](https://github.com/Lves/LLPieChart/blob/master/Images/show1.png)
![(代码实现)](https://github.com/Lves/LLPieChart/blob/master/Images/show2.png)
