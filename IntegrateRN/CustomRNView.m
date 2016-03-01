//
//  CustomRNView.m
//  IntegrateRN
//
//  Created by Vagmi Mudumbai on 01/03/16.
//  Copyright © 2016 Vagmi Mudumbai. All rights reserved.
//

#import "CustomRNView.h"
#import "React/RCTViewManager.h"

@interface RCT_EXTERN_MODULE(CustomRNViewManager, RCTViewManager)

RCT_EXPORT_VIEW_PROPERTY(message, NSString)

@end