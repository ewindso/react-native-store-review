#import "RNStoreReview.h"
#import <StoreKit/SKStoreReviewController.h>

@implementation RNStoreReview

- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE()

- (NSDictionary *)constantsToExport
{
  return @{
    @"isAvailable": [SKStoreReviewController class] ? @(YES) : @(NO)
  };
}

RCT_EXPORT_METHOD(requestReview)
{
  if (@available(iOS 14.0, *)) {
      [SKStoreReviewController requestReviewInScene:[UIApplication sharedApplication].delegate.window.windowScene];
  } else if (@available(iOS 10.3, *)) {
      [SKStoreReviewController requestReview];
  }
}

+ (BOOL)requiresMainQueueSetup
{
  return YES;
}

@end
