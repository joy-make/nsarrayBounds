//
//  NSArray+LXZArray.m
//  windowUserInterfaceTest
//
//  Created by wangguopeng on 16/1/22.
//  Copyright © 2016年 joymake. All rights reserved.
//  数组越界

#import "NSArray+LXZArray.h"
#import <objc/runtime.h>

@implementation NSArray (LXZArray)

+(void)load{
    [super load];
    Method fromMethod = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(objectAtIndex:));
    Method toMethod = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(lxzObjectAtIndex:));
    method_exchangeImplementations(fromMethod, toMethod);
}

- (id)lxzObjectAtIndex:(NSInteger)index{
    if (self.count-1 <index) {
        @try {
            [self lxzObjectAtIndex:index];
        }
        @catch (NSException *exception) {
            NSLog(@"---------- %s Crash Because Method %s  ----------\n", class_getName(self.class), __func__);
            NSLog(@"ERROR:%@",[exception callStackSymbols]);
        }
        @finally {}
        return nil;
    }else{
        return [self lxzObjectAtIndex:index];
    }
}

@end
