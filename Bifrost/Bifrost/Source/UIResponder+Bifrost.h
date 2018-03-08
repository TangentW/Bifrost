//
//  UIResponder+Bifrost.h
//  Bifrost
//
//  Created by Tangent on 08/03/2018.
//  Copyright © 2018 Tangent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BifProtocols.h"

@interface UIResponder (Bifrost) <BifEventReceiver, BifEventSender>

@end
