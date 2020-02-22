//
//  MCTCamera.h
//  MaceTest
//
//  Created by Andrés Guerrero Doblado on 22/02/2020.
//

#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>
#import <React/RCTBridge.h>
#import <React/RCTBridgeModule.h>

NS_ASSUME_NONNULL_BEGIN

@class MCTCamera;

@interface MCTCamera : UIView <AVCaptureVideoDataOutputSampleBufferDelegate>

@property AVCaptureDevice *videoDevice;
@property AVCaptureSession *session;
@property dispatch_queue_t sessionQueue;
@property (nonatomic, weak) RCTBridge *bridge;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *previewLayer;



- (id)initWithBridge:(RCTBridge *)bridge;

@end

NS_ASSUME_NONNULL_END
