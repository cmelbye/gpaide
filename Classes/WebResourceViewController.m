//
//  WebResourceViewController.m
//  GPA
//
//  Created by Charlie Melbye on 3/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WebResourceViewController.h"

@implementation WebResourceViewController

@synthesize webAddress;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.resourceWebView.backgroundColor = [UIColor clearColor];
    self.resourceWebView.alpha = 0.0;
    
    for(UIView *wview in [[[self.resourceWebView subviews] objectAtIndex:0] subviews]) {
        if([wview isKindOfClass:[UIImageView class]]) { wview.hidden = YES; } 
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.resourceWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.webAddress]]];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    self.cannotConnectLabel.hidden = NO;
    self.connectExplainLabel.hidden = NO;
    
    [UIView beginAnimations:nil context:NULL];
    
    self.cannotConnectLabel.alpha = 1.0;
    self.connectExplainLabel.alpha = 1.0;
    
    [UIView commitAnimations];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    self.cannotConnectLabel.hidden = YES;
    self.connectExplainLabel.hidden = YES;
    self.cannotConnectLabel.alpha = 0.0;
    self.connectExplainLabel.alpha = 0.0;
    
    [UIView beginAnimations:nil context:NULL];
    
    self.resourceWebView.alpha = 1.0;
    
    [UIView commitAnimations];
}

@end
