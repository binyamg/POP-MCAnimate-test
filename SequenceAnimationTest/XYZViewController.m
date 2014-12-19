//
//  XYZViewController.m
//  SequenceAnimationTest
//
//  Created by Binyam Teklu on 12/19/14.
//  Copyright (c) 2014 XYZ. All rights reserved.
//

#import "XYZViewController.h"
#import <pop/POP.h>
#define MCANIMATE_SHORTHAND
#import "POP+MCAnimate.h"

@interface XYZViewController ()

@property (strong, nonatomic) UITableView *tableview;

@end

@implementation XYZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    
    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(20, 30, 200, 300)];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    [self.view addSubview:_tableview];
    
    [_tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseId"];
}





- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseId" forIndexPath:indexPath];
    
    cell.textLabel.text = [@"row " stringByAppendingFormat:@"%d", indexPath.row];
    cell.textLabel.text = [cell.textLabel.text stringByAppendingFormat:@"%@ %@", cell.textLabel.text, cell.textLabel.text];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *visibleCells = [_tableview visibleCells];
    
    [visibleCells sequenceWithInterval:0.5 animations:^(UIView *cell, NSInteger index){
        CALayer *cellLayer = cell.layer;
        
        cellLayer.springSpeed = 2;
        
        cellLayer.spring.positionX = cellLayer.position.x - cellLayer.bounds.size.width;
        
        
    } completion:^(BOOL finished){
        [_tableview reloadData];
    }];
}







- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
