//
//  FirstViewController.h
//  GPA
//
//  Created by Charlie Melbye on 1/21/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdMobDelegateProtocol.h"

@interface CoursesViewController : UITableViewController <UIPickerViewDataSource, UIPickerViewDelegate, UIActionSheetDelegate, UITextFieldDelegate, AdMobDelegate> {
	NSMutableDictionary *courses;	
	UIBarButtonItem *addButton;
	NSArray *letterGradeArray;
	UIAlertView *addCourseAlert;
	UITextField *addCourseField;
	NSInteger letterGradeSelection;
	NSIndexPath *editingIndex;
	AdMobView *advert;
	NSTimer *refreshTimer;
}

@property (nonatomic, retain) NSMutableDictionary *courses;
@property (nonatomic, retain) UIBarButtonItem *addButton;

- (void)refreshAd:(NSTimer *)timer;
- (NSString *)coursesDatabasePath;
- (void)saveCourseList;
- (void)showCourseAlert;
- (void)addCourse:(NSString *)courseName;

@end
