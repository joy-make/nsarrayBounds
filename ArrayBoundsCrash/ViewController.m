//
//  ViewController.m
//  ArrayBoundsCrash
//
//  Created by Joymake on 2017/5/26.
//  Copyright © 2017年 joymake. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSTimer *_timer;
}

@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@property (nonatomic,strong)NSArray *listArray;
@end

@implementation ViewController

static int repeats = 0;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    __weak __typeof(&*self)weakSelf = self;
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.4 repeats:10 block:^(NSTimer * _Nonnull timer) {
        weakSelf.displayLabel.text = repeats>=weakSelf.listArray.count-1?[NSString stringWithFormat:@"第%d个元素应该crash但没有crash",repeats++]:weakSelf.listArray[repeats++];
    }];
    _timer.fireDate = [NSDate distantFuture];

}

-(NSArray *)listArray{
    return _listArray =_listArray?:@[@"0",@"1",@"2"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)testListCrash:(id)sender {
    
    repeats = 0;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    _timer.fireDate = [NSDate distantPast];
    });

}

@end
