//
//  Bifrost.m
//  Bifrost
//
//  Created by Tangent on 08/03/2018.
//  Copyright © 2018 Tangent. All rights reserved.
//

#import "Bifrost.h"
#import "BifEvent.h"

@implementation Bifrost

+ (nonnull SEL)selectorForIdentifier:(nonnull NSString *)identifier {
    NSString *selectorString = [NSString stringWithFormat:@"BIF_%@::", identifier];
    return NSSelectorFromString(selectorString);
}

+ (BOOL)handleEvent:(nonnull BifEvent *)event with:(nonnull id)obj {
    SEL selector = [self selectorForIdentifier:event.identifier];
    if(![obj respondsToSelector:selector]) return NO;
    
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:
                                [[obj class] instanceMethodSignatureForSelector:selector]];
    invocation.target = obj;
    invocation.selector = selector;
    id data = event.data; BifCallback callback = event.callback;
    [invocation setArgument:&data atIndex:2];
    [invocation setArgument:&callback atIndex:3];
    [invocation invoke];
    BOOL shouldNotHandOn;
    [invocation getReturnValue:&shouldNotHandOn];
    return shouldNotHandOn;
}

@end
