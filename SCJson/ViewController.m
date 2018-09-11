//
//  ViewController.m
//  SCJson
//
//  Created by Mac on 2018/9/11.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "ViewController.h"
#import "NSDictionary+SC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //应用场景就是,不想把后台返回的json字符串解析成model,只是需要一个字段的值
    
    NSDictionary *json =
    @{
      @"msg" : @"处理成功",
      @"data" : @{
          @"meta" : @{
              @"per_page" : @(20),
              @"count" : @(1),
              @"prev_page" : @(1),
              @"current_page" : @(1),
              @"total" : @(1),
              @"next_page" : @(1),
              @"total_pages" : @(1)
          },
          @"list" : @[
                    @{
                        @"hit" : @"2发0中1走",
                        @"gifts" : @(0),
                        @"record" : @"",
                        @"win_str" : @"000",
                        @"league_name" : @"奥乙",
                        @"result_str" : @"320",
                        @"win_streak" : @(0),
                        @"away" : @"华顿斯",
                        @"avatar" : @"https://wx.qlogo.cn/mmopen/vi_32/XDgQlZGKI0O8LHeUDRG3UCicjnSVpvI842FHibZa1baWSfB9AbgiaduaY2oawml1YsF7hE91jcOoDqHOrYMFBmXEQ/132",
                        @"tag" : @"央视名嘴",
                        @"hit_rate" : @"0.00%",
                        @"home" : @"BW林茨",
                        @"level" : @(999),
                        @"recommend_id" : @(55),
                        @"nickname" : @"测试数据12",
                        @"analyst_id" : @(71353) ,
                        @"data" : @"里面的data"
                    }
                    ]
      },
      @"code" : @(1)
      };
    
    NSLog(@"away = %@",[json valueForUniqueKey:@"away"]);//华顿斯
    NSLog(@"data = %@",[json valueForUniqueKeys:@[@"data",@"data"]]);//里面的data
    NSLog(@"level = %@",[json valueForUniqueKey:@"level" checkClass:[NSNumber class]]);//999
    NSLog(@"level = %@",[json valueForUniqueKey:@"level" checkClass:[NSString class]]);//读取出来的不是字符串 所以返回 nil
    NSLog(@"level = %@",[json stringValueForUniqueKey:@"level"]);//读取出来的不是字符串,最终转出字符串
    
    NSMutableDictionary *mutableDic = [json copyMutable];
    NSMutableDictionary *meta = [mutableDic valueForUniqueKey:@"meta" checkClass:[NSMutableDictionary class]];
    [meta setValue:@"😄😄😄😄😄😄#########😄😄😄😄😄😄" forKey:@"insert动态插入"];
    NSLog(@"%@",mutableDic.jsonPrint);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
