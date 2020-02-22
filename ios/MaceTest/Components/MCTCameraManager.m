//
//  MCTCameraManager.m
//  MaceTest
//
//  Created by Andrés Guerrero Doblado on 22/02/2020.
//

#import "MCTCameraManager.h"
#import "MCTCamera.h"

@implementation MCTCameraManager

RCT_EXPORT_MODULE(MCTCamera);

- (UIView *)view
{
  return [[MCTCamera alloc] initWithBridge:self.bridge];
}

@end
