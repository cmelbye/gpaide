//
//  AboutViewController.m
//  GPA
//
//  Created by Charlie Melbye on 1/28/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import <MessageUI/MessageUI.h>
#import "AboutViewController.h"

@implementation AboutViewController

- (IBAction)openSupport:(id)sender {
	if ([MFMailComposeViewController canSendMail]) {
		MFMailComposeViewController *mail = [[MFMailComposeViewController alloc] init];
		[mail setToRecipients:[NSArray arrayWithObject:@"charles.melbye@gmail.com"]];
		[mail setSubject:@"GPAide Support"];
		[mail setMailComposeDelegate:self];
		[self presentModalViewController:mail animated:YES];
	} else {
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://cmelbye.github.com/gpaide/support.html"]];
	}
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
	[self dismissModalViewControllerAnimated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"TipsAndTricksSegue"]) {
        WebResourceViewController *vc = segue.destinationViewController;
        vc.webAddress = @"http://cmelbye.github.com/gpaide/tips.html";
    } else if ([segue.identifier isEqualToString:@"AboutSegue"]) {
        WebResourceViewController *vc = segue.destinationViewController;
        vc.webAddress = @"http://cmelbye.github.com/gpaide/about.html";
    }
}

@end
