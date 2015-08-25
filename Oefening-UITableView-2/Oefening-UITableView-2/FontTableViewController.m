//
//  FontTableViewController.m
//  Oefening-UITableView-2
//
//  Created by Jean Smits on 24/08/15.
//  Copyright (c) 2015 Jean Smits. All rights reserved.
//

#import "FontTableViewController.h"
#import "FontTableViewCell.h"

@interface FontTableViewController ()
@property (strong,nonatomic) NSMutableDictionary* woordenboekFonts;
@property (strong, nonatomic) FontTableViewCell* fontTableViewCell;



@end

@implementation FontTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.woordenboekFonts = [[NSMutableDictionary alloc]init];
    NSArray * families= [UIFont familyNames];
    
    for(int i = 0; i < families.count; i ++){
        NSString * key= [families objectAtIndex:(i)];
        NSArray * types = [UIFont fontNamesForFamilyName:key];
        [self.woordenboekFonts setObject:types forKey:key];
    }
 
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
      [self.navigationController popViewControllerAnimated:YES];
    
    NSArray *allFontNames= [self fontNamesAtIndex:indexPath.section];
    NSString *fontname= allFontNames[indexPath.row ];
    UIFont *font= [UIFont fontWithName:fontname size:15];
    
    [self.selectedFontProtocol fontSelected:font];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSArray*) fontNamesAtIndex:(NSInteger) index {
    NSArray * values= [[self woordenboekFonts] allValues];
    return [values objectAtIndex:index];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return self.woordenboekFonts.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [[self fontNamesAtIndex:section]count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FontTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"font" forIndexPath:indexPath];
    
    NSArray *allFontNames= [self fontNamesAtIndex:indexPath.section];
    NSString *fontname= allFontNames[indexPath.row ];
    UIFont *font= [UIFont fontWithName:fontname size:15];
    
    cell.fontLabel.text=fontname;
    cell.fontLabel.font=font;

    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
