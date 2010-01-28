//
//  FirstViewController.h
//  GPA
//
//  Created by Charlie Melbye on 1/21/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoursesViewController : UITableViewController <UIPickerViewDataSource, UIPickerViewDelegate, UIActionSheetDelegate, UITextFieldDelegate> {
	NSMutableDictionary *courses;	
	UIBarButtonItem *addButton;
	NSArray *letterGradeArray;
	UIAlertView *addCourseAlert;
	UITextField *addCourseField;
	NSInteger letterGradeSelection;
	NSIndexPath *editingIndex;
}

@property (nonatomic, retain) NSMutableDictionary *courses;
@property (nonatomic, retain) UIBarButtonItem *addButton;

- (NSString *)coursesDatabasePath;
- (void)saveCourseList;
- (void)showCourseAlert;
- (void)addCourse:(NSString *)courseName;

@end
