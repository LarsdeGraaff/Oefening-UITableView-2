//
//  ViewController.m
//  Oefening-UITableView-2
//
//  Created by Jean Smits on 24/08/15.
//  Copyright (c) 2015 Jean Smits. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"
#import "FontTableViewController.h"

@interface ViewController () <KleurenProtocol, FontProtocol>
@property(strong,nonatomic) UIColor* color;
@property (strong, nonatomic) UIFont* font;
//@property (strong, nonatomic) UILabel* selectedFont;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.choosenColor.backgroundColor=[self color];
    self.chosenFont.text=self.font.familyName;
    self.chosenFont.font=self.font;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)colorSelected:(UIColor *)color{
    self.color=color;
}

-(void)fontSelected:(UIFont *)font{
    self.font=font;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    [super prepareForSegue:segue sender:sender];
    if ([segue.destinationViewController isKindOfClass:[TableViewController class]]) {
        TableViewController* controller = segue.destinationViewController;
        controller.kleurenDelegate=self;
    }
    
    else if ([segue.destinationViewController isKindOfClass:[FontTableViewController class]]){
        FontTableViewController* fontController= segue.destinationViewController;
        fontController.selectedFontProtocol=self;
        
    }
    
   
}


@end
