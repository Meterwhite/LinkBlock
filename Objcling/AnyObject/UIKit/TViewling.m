//
//  TViewling.m
//  Objcling
//
//  Created by meterwhite on 2020/8/25.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TViewling.h"

@interface TViewling ()
@property (readonly) TViewling *userInteractionEnabled;

@property (readonly) TViewling *userInteractionDisabled;

@property (readonly) TViewling *hide;

@property (readonly) TViewling *noHide;

@property (readonly) TViewling *clip;

@property (readonly) TViewling *noClip;

@property (readonly) TViewling *contentScaleToFill;

@property (readonly) TViewling *contentScaleAspectFit;

@property (readonly) TViewling *contentScaleAspectFill;

@property (readonly) TViewling *contentRedraw;

@property (readonly) TViewling *contentCenter;

@property (readonly) TViewling *contentTop;

@property (readonly) TViewling *contentBottom;

@property (readonly) TViewling *contentLeft;

@property (readonly) TViewling *contentRight;

@property (readonly) TViewling *contentTopLeft;

@property (readonly) TViewling *contentTopRight;

@property (readonly) TViewling *contentBottomLeft;

@property (readonly) TViewling *contentBottomRight;

@property (readonly) TViewling *sendBack;

@property (readonly) TViewling *bringFront;

@property (readonly) TViewling *snapshot;

@property (readonly) TViewling *forceEndEditing;

@property (readonly) TViewling *removeConstraints;
@end

@implementation TViewling

- (id)let {
    return self;
}

@end
