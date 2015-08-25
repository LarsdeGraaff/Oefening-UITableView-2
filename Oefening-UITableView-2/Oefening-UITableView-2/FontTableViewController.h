//
//  FontTableViewController.h
//  Oefening-UITableView-2
//
//  Created by Jean Smits on 24/08/15.
//  Copyright (c) 2015 Jean Smits. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol FontProtocol
-(void) fontSelected: (UIFont*) font;
@end
@interface FontTableViewController : UITableViewController
@property (weak,nonatomic) id <FontProtocol> selectedFontProtocol;

@end
