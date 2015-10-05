//
//  MainViewController.h
//  Notes
//
//  Created by Cheta Gandhi on 02/10/15.
//  Copyright (c) 2015 Tukargiri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskCell.h"

@interface MainViewController : UIViewController<UITabBarDelegate, UITableViewDataSource, TaskDelegate>

-(IBAction)createNote:(id)sender;
-(IBAction)createList:(id)sender;

@end

