//
//  AboutViewController.h
//  GPA
//
//  Created by Charlie Melbye on 1/28/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebResourceViewController.h"

@interface AboutViewController : UITableViewController <MFMailComposeViewControllerDelegate> {

}

- (IBAction)openSupport:(id)sender;

@end
