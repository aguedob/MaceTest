//
//  MCTCamera.m
//  MaceTest
//
//  Created by Andrés Guerrero Doblado on 22/02/2020.
//

#import "MCTCamera.h"

@implementation MCTCamera


- (id)initWithBridge:(RCTBridge *)bridge
{
    if ((self = [super init])) {
        self.bridge = bridge;
        self.session = [AVCaptureSession new];
        self.sessionQueue = dispatch_queue_create("cameraQueue", DISPATCH_QUEUE_SERIAL);
        self.previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:self.session];
    }
    return self;
}

@end
