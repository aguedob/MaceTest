//
//  MCTCamera.m
//  MaceTest
//
//  Created by Andrés Guerrero Doblado on 22/02/2020.
//

#import "MCTCamera.h"

@implementation MCTCamera


- (void)getBackCamera
{
  
}

- (id)initWithBridge:(RCTBridge *)bridge
{
    if ((self = [super init])) {
        self.bridge = bridge;
      
        
      
      NSArray *videoDevices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];

      AVCaptureDevicePosition position = AVCaptureDevicePositionBack;

      for (AVCaptureDevice *device in videoDevices)
      {
          if (device.position == position) {
              self.videoDevice = device;
              break;
          }
      }
      
      // obtain device input
      NSError *error = nil;
      AVCaptureDeviceInput *videoDeviceInput = [AVCaptureDeviceInput deviceInputWithDevice:_videoDevice error:&error];
      if (!videoDeviceInput)
      {
          NSLog(@"%@", [NSString stringWithFormat:@"Unable to obtain video device input, error: %@", error]);
          return self;
      }
      
      // obtain the preset and validate the preset
      NSString *preset = AVCaptureSessionPresetMedium;
      if (![_videoDevice supportsAVCaptureSessionPreset:preset])
      {
          NSLog(@"%@", [NSString stringWithFormat:@"Capture session preset not supported by video device: %@", preset]);
          return self;
      }

      // CoreImage wants BGRA pixel format
      NSDictionary *outputSettings = @{ (id)kCVPixelBufferPixelFormatTypeKey : [NSNumber numberWithInteger:kCVPixelFormatType_32BGRA]};
      // create and configure video data output
      AVCaptureVideoDataOutput *videoDataOutput = [[AVCaptureVideoDataOutput alloc] init];
      videoDataOutput.videoSettings = outputSettings;
      
      // create the capture session
      _captureSession = [[AVCaptureSession alloc] init];
      _captureSession.sessionPreset = preset;
      
      // create the dispatch queue for handling capture session delegate method calls
      _captureSessionQueue = dispatch_queue_create("capture_session_queue", NULL);
      [videoDataOutput setSampleBufferDelegate:self queue:_captureSessionQueue];
      
      videoDataOutput.alwaysDiscardsLateVideoFrames = YES;
      
      // begin configure capture session
      [_captureSession beginConfiguration];

      if (![_captureSession canAddOutput:videoDataOutput])
      {
          NSLog(@"Cannot add video data output");
          _captureSession = nil;
          return self;
      }
      #if !(TARGET_IPHONE_SIMULATOR)
      self.previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:self.captureSession];
      self.previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
      self.previewLayer.needsDisplayOnBoundsChange = YES;
      #endif

      // connect the video device input and video data and still image outputs
      [_captureSession addInput:videoDeviceInput];
      [_captureSession addOutput:videoDataOutput];

      [_captureSession commitConfiguration];

      // then start everything
      [_captureSession startRunning];

      
    }
    return self;
}



@end
