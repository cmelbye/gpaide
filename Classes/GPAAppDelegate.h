//
//  GPAAppDelegate.h
//  GPA
//
//  Created by Charlie Melbye on 1/21/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@protocol BannerViewContainer <NSObject>

- (void)showBannerView:(ADBannerView *)bannerView animated:(BOOL)animated;
- (void)hideBannerView:(ADBannerView *)bannerView animated:(BOOL)animated;

@end

@interface GPAAppDelegate : UIResponder <UIApplicationDelegate, ADBannerViewDelegate> {
    UIWindow *window;
    ADBannerView *_bannerView;
}

@property (nonatomic, strong) IBOutlet UIWindow *window;
@property (nonatomic, strong) ADBannerView *bannerView;
@property (nonatomic, strong) UIViewController<BannerViewContainer> *currentController;

@end
