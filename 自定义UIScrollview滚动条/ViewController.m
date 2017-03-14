//
//  ViewController.m
//  自定义UIScrollview滚动条
//
//  Created by WOSHIPM on 2017/3/14.
//  Copyright © 2017年 WOSHIPM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>{
    
    UIView *sliderView;
    UIView *slideBackView;
    
}
@property(nonatomic, strong)UIScrollView *scrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 164, self.view.frame.size.width, 233)];
        _scrollView.delegate = self;
        
        _scrollView.scrollEnabled = YES;
        _scrollView.bounces = NO;
        _scrollView.showsHorizontalScrollIndicator=NO;
        _scrollView.layer.shadowColor = [UIColor redColor].CGColor;//shadowColor阴影颜色
        _scrollView.layer.shadowOffset = CGSizeMake(0,0);//shadowOffset阴影偏移,x向右偏移，y向下偏移
        _scrollView.layer.shadowOpacity = 0.5;//阴影透明度，默认0
        _scrollView.layer.shadowRadius = 3;//阴影半径，默认3

    }
    return _scrollView;
}
-(void)loadView{
    [super loadView];
    [self.view addSubview:self.scrollView];
    slideBackView=[[UIView alloc] initWithFrame:CGRectMake(15, _scrollView.frame.origin.y+_scrollView.frame.size.height+20, self.view.frame.size.width-30, 8)];
    [self.view addSubview:slideBackView];
    slideBackView.backgroundColor = [UIColor colorWithRed:0.91 green:0.91 blue:0.91 alpha:1.00];
    slideBackView.layer.cornerRadius = 4;
    
    sliderView = [[UIView alloc] init];
    [self.view addSubview:sliderView];
    sliderView.frame=CGRectMake(slideBackView.frame.origin.x, slideBackView.frame.origin.y+(slideBackView.frame.size.height-7 )/2, 40 , 7 );
    
    sliderView.backgroundColor =[UIColor colorWithRed:0.12 green:0.72 blue:0.88 alpha:1.00];
    sliderView.layer.cornerRadius = 3.5;
 
  NSArray *textDesArr=@[@"• 产品战略规划：市场目标、用户目标、关键成功要素分析、管理和运用自己的资源来达成目标\n• 产品战略实施：有损原则、平衡原则、聚焦原则\n• 产品需求文档：实例讲解，牛逼的需求文档是怎么诞生的\n• 主动：战略思考、资源争取\n• 推动：项目立项、迭代跟踪\n• 沟通：上传下达、思想一统\n• 平衡：各方协调、跨部沟通\n• 把控：管理得法、取舍有道",
                     
                        @"• 用户思维：具体案例解析\n• 运营思维：具体案例解析\n• 数据思维：具体案例解析\n• 产品经理的用研能力模型\n• 用户研究基本概念解析\n• 用研基础搭建及建设\n• 用研人员分工及工作职责细分",
               
                    @"• 常用用户研究方法详解\n• 桌面研究、定性研究、定量研究三种方法举例讲解及详细步骤解析\n• 卡诺模型\n• 战略级的市场及用户研究\n• 以科学的方法在产品整个生命周期中进行“研究”",
                    @"• 品生命周期用户研究侧重点以及研究方法解读\n• 产品用研规划建立\n• 在产品不同生命周期，侧重不同用研方法，更准确进行产品迭代",
                   
                    @"• 格局：大格局思维，聚焦做实事\n• 决策：让琐碎的运营变有趣，“舍得”之道\n• owner精神：有狼性\n• 敏锐：“细节”出真知\n• 商业素养",
                    @"• 高情商：做个让人感觉“舒适”的资深运营\n• 凝聚力：1+1>2，善用团队用人所长，没有完美的个人，只有优秀的团队\n• 影响力：在互联网领域成为运营专家，沉淀经验，让成功有迹可循\n• 知识传承力：资深运营的价值，不是个人优秀，而是让人人优秀。",
                    @"• 数据运营体系的构成\n• 数据规范与平台\n• 数据运营体系结构\n• 数据数据平台构建\n• 核心数据指标\n• 移动端产品数据埋点范例\n• 数据需求指标\n• 产品关键数据\n• 数据运营体系的构成",
            
                    
                    ];

    NSInteger contentCount=textDesArr.count;
    for (NSInteger i = 0; i <contentCount; i++) {
     
            
        
            UILabel *textDesLabel=[[UILabel alloc] initWithFrame:CGRectMake(10+190 *i,0, 180 , 233 )];
            [_scrollView addSubview:textDesLabel];
            textDesLabel.textColor=[UIColor colorWithRed:0.49 green:0.49 blue:0.49 alpha:1.00];
            textDesLabel.font = [UIFont systemFontOfSize:12 ];
            textDesLabel.text = textDesArr[i];
            textDesLabel.numberOfLines = 0;
            textDesLabel.layer.borderWidth = 0.5;
            textDesLabel.layer.borderColor = [UIColor colorWithRed:0.91 green:0.91 blue:0.91 alpha:1.00].CGColor;
            textDesLabel.backgroundColor = [UIColor whiteColor];
        
            
 
        
    }
    
    
    
    _scrollView.contentSize = CGSizeMake(190*contentCount+10, 0);
    

    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
    [UIView animateWithDuration:0.5 animations:^{
        
        CGPoint offset =  scrollView.contentOffset;
        
        // scrollView的当前位移/scrollView的总位移=滑块的当前位移/滑块的总位移
        //        offset/(scrollView.contentSize.width-scrollView.frame.size.width)=滑块的位移/(slideBackView.frame.size.width-sliderView.frame.size.width)
        //        滑块距离屏幕左边的距离加上滑块的当前位移，即为滑块当前的x
        
        CGRect frame=sliderView.frame;
        
        frame.origin.x=15 + offset.x*(slideBackView.frame.size.width-sliderView.frame.size.width)/(scrollView.contentSize.width-scrollView.frame.size.width);
        
        sliderView.frame = frame;
        
        
        
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    /**
     
     
     
     */
}


@end
