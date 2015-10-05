//
//  MainViewController.m
//  Notes
//
//  Created by Cheta Gandhi on 02/10/15.
//  Copyright (c) 2015 Tukargiri. All rights reserved.
//

#import "MainViewController.h"
#import "NotesManager.h"
#import "ListManager.h"
#import "TaskManager.h"
#import "NoteCell.h"
#import "List.h"
#import "Task.h"
#import "AppDelegate.h"

@interface MainViewController ()
{
    NotesManager *notesManager;
    ListManager *listManager;
    TaskManager *taskManager;
    NSArray *notes;
    NSArray *lists;
    NSDateFormatter *dateFormatter;
}

@property(nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation MainViewController

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        notesManager = [[NotesManager alloc] init];
        listManager = [[ListManager alloc] init];
        taskManager = [[TaskManager alloc] init];
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"EEE dd MMMM yyyy | hh:mm aa"];
    }
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    notes = [notesManager allNotes];
    lists = [listManager allList];
}


-(void)createNote:(id)sender
{
    [notesManager addNote:@"Note"];
    notes = [notesManager allNotes];
    [self.tableView reloadData];
}

-(void)createList:(id)sender
{
    List *list = [listManager createListWithTitle:@"Task List" andTasks:nil];
    NSMutableOrderedSet *taskSet = [NSMutableOrderedSet orderedSet];
    
    for (NSInteger counter = 0; counter < 5; ++counter)
    {
        Task *task = [taskManager createTaskWithDetails:[NSString stringWithFormat:@"Task %ld", counter] done:false forList:list];
        [taskSet addObject:task];
    }
    
    [list addTasks:taskSet];
    
    lists = [listManager allList];
    [self.tableView reloadData];
}

-(void)markAsDone:(Task *)task
{
    task.done = [NSNumber numberWithBool:YES];
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [appDelegate saveContext];
    [self.tableView reloadData];
}

// Table View Controller

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [notes count] ? [lists count] + 1 : [lists count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
            return [notes count];
        default:
        {
            List *l = [lists objectAtIndex:section - 1];
            return [l.tasks count];
        }
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *noteCellIdentifier = @"NoteCell";
    static NSString *taskCellIdentifier = @"TaskCell";
    
    if(indexPath.section == 0)
    {
        NoteCell *cell = [tableView dequeueReusableCellWithIdentifier:noteCellIdentifier forIndexPath:indexPath];
        Note *note = [notes objectAtIndex:indexPath.row];
        [cell setDateFormatter:dateFormatter];
        [cell setNote:note];
        
        return cell;
    }
    else
    {
        TaskCell *cell = [tableView dequeueReusableCellWithIdentifier:taskCellIdentifier forIndexPath:indexPath];
        List *list = [lists objectAtIndex:indexPath.section - 1];
        Task *task = [list.tasks objectAtIndex:indexPath.row];
        [cell setTask:task];
        [cell setDelegate:self];
        
        return cell;
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return @"Notes";
            
        default:
        {
            List *l = [lists objectAtIndex:section - 1];
            return l.title ;
        }
    }
}

@end
