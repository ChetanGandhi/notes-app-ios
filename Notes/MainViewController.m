//
//  MainViewController.m
//  Notes
//
//  Created by Demo on 02/10/15.
//  Copyright (c) 2015 Tukargiri. All rights reserved.
//

#import "MainViewController.h"
#import "NotesManager.h"
#import "NoteCell.h"

@interface MainViewController ()
{
    NotesManager *notesManager;
    NSMutableArray *notes;
}

@end

@implementation MainViewController

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        notesManager = [[NotesManager alloc] init];
        notes = [@[[notesManager addNote:@"This is test note."]] mutableCopy];
    }
    
    return self;
}

// Table View Controller

-(void)viewDidLoad
{
    [super viewDidLoad];
    notes = [[notesManager allNotes] mutableCopy];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [notes count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"NoteCell";
    NoteCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    Note *note = [notes objectAtIndex:indexPath.row];
    [cell setDateFormat:@"EEE dd MMM yyyy"];
    [cell setNote:note];
    
    return cell;
}

@end
