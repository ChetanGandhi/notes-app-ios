//
//  NotesManager.m
//  Notes
//
//  Created by Cheta Gandhi on 02/10/15.
//  Copyright (c) 2015 Tukargiri. All rights reserved.
//

#import "ListManager.h"
#import "AppDelegate.h"

@implementation ListManager

NSString *const CORE_DATA_ENTITY_LIST = @"List";
NSString *const KEY_LIST_CREATED_ON = @"createdOn";

-(NSArray *)allList
{
    NSManagedObjectContext *context = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    NSError *error = nil;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:CORE_DATA_ENTITY_LIST];
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:KEY_LIST_CREATED_ON ascending:NO];
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    
    return [context executeFetchRequest:fetchRequest error:&error];
}

-(List *)createListWithTitle:(NSString *)title andTasks:(NSOrderedSet *)tasks
{
    AppDelegate *manager = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    List *list = [NSEntityDescription insertNewObjectForEntityForName:CORE_DATA_ENTITY_LIST inManagedObjectContext:manager.managedObjectContext];
    list.title = title;
    [list addTasks:tasks];

    [manager saveContext];
    
    return list;
}

@end
