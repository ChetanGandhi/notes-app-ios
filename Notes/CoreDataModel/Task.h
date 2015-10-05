//
//  Task.h
//  Notes
//
//  Created by Cheta Gandhi on 02/10/15.
//  Copyright (c) 2015 Tukargiri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class List;

@interface Task : NSManagedObject

@property (nonatomic, retain) NSNumber * done;
@property (nonatomic, retain) NSString * details;
@property (nonatomic, retain) List *list;

@end
