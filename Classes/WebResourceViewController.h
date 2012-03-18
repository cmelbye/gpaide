//
//  WebResourceViewController.h
//  GPA
//
//  Created by Charlie Melbye on 3/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebResourceViewController : UIViewController <UIWebViewDelegate>

@property (nonatomic, strong) NSString * webAddress;

@property (nonatomic, strong) IBOutlet UIWebView * resourceWebView;
@property (nonatomic, strong) IBOutlet UILabel * cannotConnectLabel;
@property (nonatomic, strong) IBOutlet UILabel * connectExplainLabel;

@end
