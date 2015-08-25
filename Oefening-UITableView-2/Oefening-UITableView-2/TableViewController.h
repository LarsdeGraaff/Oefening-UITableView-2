//
//  TableViewController.h
//  Oefening-UITableView-2
//
//  Created by Jean Smits on 24/08/15.
//  Copyright (c) 2015 Jean Smits. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol KleurenProtocol
-(void) colorSelected: (UIColor*) color;

@end

@interface TableViewController : UITableViewController
@property (weak, nonatomic) id <KleurenProtocol> kleurenDelegate;

@end
