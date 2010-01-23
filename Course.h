//
//  Course.h
//  GPA
//
//  Created by Charlie Melbye on 1/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <CoreData/CoreData.h>


@interface Course : NSManagedObject  
{
}

@property (nonatomic, retain) NSString * letterGrade;
@property (nonatomic, retain) NSString * courseName;

@end



