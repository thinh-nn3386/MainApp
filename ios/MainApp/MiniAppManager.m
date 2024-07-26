#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>


@interface RCT_EXTERN_MODULE(MiniappManager, NSObject)

RCT_EXTERN_METHOD(getIsLaunch: (RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject
)

RCT_EXTERN_METHOD(openApp: (NSDictionary *)initProps)

RCT_EXTERN_METHOD(closeApp)

+ (BOOL)requiresMainQueueSetup
{
  return NO;
}


@end
