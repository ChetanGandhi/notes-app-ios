//
//  NotesManager.h
//  Notes
//
//  Created by Cheta Gandhi on 02/10/15.
//  Copyright (c) 2015 Tukargiri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "List.h"

@interface ListManager : NSObject

-(List *)createListWithTitle:(NSString *)title andTasks:(NSOrderedSet *)tasks;
-(NSArray *)allList;

@end
