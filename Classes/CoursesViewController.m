//
//  FirstViewController.m
//  GPA
//
//  Created by Charlie Melbye on 1/21/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "CoursesViewController.h"
#import "AdMobView.h"

@implementation CoursesViewController

@synthesize courses;
@synthesize addButton;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
 */

- (void)viewDidLoad {
    [super viewDidLoad];
	
	NSFileManager *fileManager = [NSFileManager defaultManager];
	
	// Load courses
	
	if([fileManager fileExistsAtPath:[self coursesDatabasePath]]) {
		NSLog(@"Course file exists, loading.");
		courses = [[NSMutableDictionary alloc] initWithContentsOfFile:[self coursesDatabasePath]];
	} else {
		NSLog(@"Course file does not exist, using an empty dict.");
		courses = [[NSMutableDictionary alloc] init];
	}
	
	[fileManager release];
	
	[courses retain];
	
	// Setup letter grade array
	letterGradeArray = [[[NSArray alloc] initWithObjects:@"A", @"A-", @"B+", @"B", @"B-", @"C+", @"C", @"C-", @"D+", @"D", @"D-", @"F", nil] retain];
	
	// Set the title
	self.title = @"Courses";
	
	// Set up the button
	self.navigationItem.leftBarButtonItem = self.editButtonItem;
	
	addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showCourseAlert)];
	self.navigationItem.rightBarButtonItem = addButton;
	
	advert = [[AdMobView requestAdWithDelegate:self] retain];
	advert.frame = CGRectMake(0, 0, 320, 48);
	self.tableView.tableHeaderView = advert;
}

- (void)didFailToReceiveAd:(AdMobView *)adView {
	advert = nil;
	self.tableView.tableHeaderView = nil;
	[advert release];
}

- (NSString *)publisherId {
	return kPublisherId;
}

- (NSString *)coursesDatabasePath {  
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	
	return [[paths objectAtIndex:0] stringByAppendingPathComponent:@"courses.plist"];
}

- (void)saveCourseList {
	NSLog(@"Saving course list atomically and updating table view data.");
	[courses writeToFile:[self coursesDatabasePath] atomically:YES];
	[self.tableView reloadData];
}

- (void)showCourseAlert {
	addCourseAlert = [[UIAlertView alloc] initWithTitle:@"What's the course called?\n\n" message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
	addCourseField = [[UITextField alloc] initWithFrame:CGRectMake(12.0, 45.0, 260.0, 25.0)];
	//[addCourseField setBackgroundColor:[UIColor whiteColor]];
	[addCourseField setAlpha:1];
	[addCourseField setBorderStyle:UITextBorderStyleRoundedRect];
	[addCourseField setKeyboardAppearance:UIKeyboardAppearanceAlert];
	[addCourseField setDelegate:self];
	
	[addCourseAlert addSubview:addCourseField];
	
	CGAffineTransform myTransform = CGAffineTransformMakeTranslation(0.0, 100.0);
	[addCourseAlert setTransform:myTransform];
	
	[addCourseField becomeFirstResponder];
	[addCourseAlert show];
}

- (void)addCourse:(NSString *)courseName {
	// Set it to "A" initially, they can change it.
	NSLog(@"Creating new course: %@", courseName);
	[courses setObject:@"A" forKey:courseName];
	[self saveCourseList];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView deselectRowAtIndexPath:indexPath animated:NO];
	
	editingIndex = indexPath;
	letterGradeSelection = [letterGradeArray indexOfObject:[[courses allValues] objectAtIndex:indexPath.row]];
	
	UIActionSheet *gradeSheet = [[UIActionSheet alloc] initWithTitle:@"\n\n\n\n\n\n\n\n\n\n\n\n"
															delegate:self
												   cancelButtonTitle:nil
											  destructiveButtonTitle:nil
												   otherButtonTitles:@"Okay", nil];
	
	UIPickerView *gradePicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
	gradePicker.dataSource = self;
	gradePicker.delegate = self;
	gradePicker.showsSelectionIndicator = YES;
	
    [gradePicker reloadAllComponents];
    [gradePicker selectRow:letterGradeSelection inComponent:0 animated:NO];
	
	[gradeSheet insertSubview:gradePicker atIndex:0];
	[gradeSheet showInView:[UIApplication sharedApplication].keyWindow];
	
	[gradePicker release];
	[gradeSheet release];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	if ([alertView isEqual:addCourseAlert] && buttonIndex == 1) {
		if ([addCourseField text] != @"" && [addCourseField text] != nil) {
			[self addCourse:[addCourseField text]];
		}
	}
}

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex {
	if ([alertView isEqual:addCourseAlert]) {
		[addCourseField resignFirstResponder];
	}
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
	return [letterGradeArray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	return [letterGradeArray objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	NSLog(@"Selected row %d", row);
	letterGradeSelection = row;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
	return 280.0;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
	return 40.0;
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
	NSLog(@"It was dismissed using the %d button", buttonIndex);
	NSString *courseName = [[courses allKeys] objectAtIndex:editingIndex.row];
	[courses setObject:[letterGradeArray objectAtIndex:letterGradeSelection] forKey:courseName];
	[self saveCourseList];
	NSLog(@"Updated %@ with new grade: %@", courseName, [letterGradeArray objectAtIndex:letterGradeSelection]);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [courses count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"Cell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
	}
	
	// Configure the cell.
	NSString *courseName = [[courses allKeys] objectAtIndex:indexPath.row];
	
	cell.textLabel.text = courseName;
	cell.detailTextLabel.text = [courses objectForKey:courseName];
	
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	if(editingStyle == UITableViewCellEditingStyleDelete) {
		NSString *courseKey = [[courses allKeys] objectAtIndex:indexPath.row];
		NSLog(@"Deleting %@", courseKey);
		
		[courses removeObjectForKey:courseKey];
		
		[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
	}
	
	[self saveCourseList];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
	NSLog(@"editing now!");
	
	return YES;
}

- (void)viewDidUnload {
	self.courses = nil;
	self.addButton = nil;
}


- (void)dealloc {
	[courses release];
	[addButton release];
	[super dealloc];
}

@end
