//
//  UIControl+Bifrost.m
//  Bifrost
//
//  Created by Tangent on 08/03/2018.
//  Copyright © 2018 Tangent. All rights reserved.
//

#import "UIControl+Bifrost.h"
#import "BifEvent.h"
#import "UIResponder+Bifrost.h"
#import <objc/runtime.h>

@implementation UIControl (Bifrost)

- (void)postEvents:(UIControlEvents)events mapper:(EventMapper)mapper {
    __weak typeof(self) weakSelf = self;
    _UIControlTarget *targer = [[_UIControlTarget alloc]initWithCallback:^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (strongSelf) [strongSelf send:mapper()];
    }];
    [self addTarget:targer action:@selector(exec) forControlEvents:events];
    
    SEL key = @selector(postEvents:mapper:);
    NSMutableDictionary *dic = objc_getAssociatedObject(self, key);
    if (!dic) {
        dic = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, key, dic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [dic setObject:targer forKey:[NSString stringWithFormat:@"%lu", (unsigned long)events]];
}

- (void)postEvents:(UIControlEvents)events identifier:(NSString *)identifier callback:(BifCallback)callback {
    [self postEvents:events mapper:^BifEvent *{
        return [[BifEvent alloc]initWithIdentifier:identifier data:nil callback:callback];
    }];
}

- (void)postEvents:(UIControlEvents)events identifier:(NSString *)identifier {
    [self postEvents:events identifier:identifier];
}

@end

@interface _UIControlTarget ()
@property(nonatomic, copy) void (^callback)(void);
@end

@implementation _UIControlTarget : NSObject
- (instancetype)initWithCallback:(void (^)(void))callback {
    if (self = [super init]) {
        self.callback = callback;
    }
    return self;
}

- (void)exec {
    self.callback();
}
@end

