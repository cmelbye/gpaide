//
//  GPAAppDelegate.m
//  GPA
//
//  Created by Charlie Melbye on 1/21/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "GPAAppDelegate.h"

@implementation GPAAppDelegate

@synthesize window = _window;
@synthesize bannerView = _bannerView;
@synthesize currentController = _currentController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    _bannerView = [[ADBannerView alloc] init];
    _bannerView.delegate = self;
    
    return YES;
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    [_currentController showBannerView:banner animated:YES];
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    [_currentController hideBannerView:_bannerView animated:YES];
}

/*
// Optional UITabBarControllerDelegate method
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
}
*/

/*
// Optional UITabBarControllerDelegate method
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed {
}
*/



@end

