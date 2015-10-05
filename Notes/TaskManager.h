//
//  NotesManager.h
//  Notes
//
//  Created by Cheta Gandhi on 02/10/15.
//  Copyright (c) 2015 Tukargiri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "List.h"
#import "Task.h"

@interface TaskManager : NSObject

-(Task *)createTaskWithDetails:(NSString *)details done:(BOOL)done forList:(List *)list;

@end
