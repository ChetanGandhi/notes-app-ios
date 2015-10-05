//
//  NotesManager.m
//  Notes
//
//  Created by Cheta Gandhi on 02/10/15.
//  Copyright (c) 2015 Tukargiri. All rights reserved.
//

#import "NotesManager.h"
#import "AppDelegate.h"

@implementation NotesManager

NSString *const CORE_DATA_ENTITY_NOTE = @"Note";
NSString *const KEY_CREATED_ON = @"createdOn";

-(NSArray *)allNotes
{
    NSManagedObjectContext *context = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    NSError *error = nil;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:CORE_DATA_ENTITY_NOTE];
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:KEY_CREATED_ON ascending:NO];
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    
    return [context executeFetchRequest:fetchRequest error:&error];
}

-(Note *)addNote:(NSString *)details
{
    AppDelegate *manager = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    Note *note = [NSEntityDescription insertNewObjectForEntityForName:CORE_DATA_ENTITY_NOTE inManagedObjectContext:manager.managedObjectContext];
    note.details = details;
    note.createdOn = [NSDate date];

    [manager saveContext];
    
    return note;
}

@end
