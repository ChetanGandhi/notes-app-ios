//
//  NotesManager.m
//  Notes
//
//  Created by Cheta Gandhi on 02/10/15.
//  Copyright (c) 2015 Tukargiri. All rights reserved.
//

#import "TaskManager.h"
#import "AppDelegate.h"

@implementation TaskManager

NSString *const CORE_DATA_ENTITY_TASK = @"Task";

-(Task *)createTaskWithDetails:(NSString *)details done:(BOOL)done forList:(List *)list;
{
    AppDelegate *manager = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    Task *task = [NSEntityDescription insertNewObjectForEntityForName:CORE_DATA_ENTITY_TASK inManagedObjectContext:manager.managedObjectContext];
    task.details = details;
    task.done = [NSNumber numberWithBool:done];
    task.list = list;

    [manager saveContext];
    
    return task;
}

@end
