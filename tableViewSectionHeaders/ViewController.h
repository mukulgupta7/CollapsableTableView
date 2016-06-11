//
//  ViewController.h
//  tableViewSectionHeaders
//
//  Created by Mukul Gupta on 10/06/16.
//  Copyright (c) 2016 Mukul Gupta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tablesearch;
@property (nonatomic)NSArray * array1;
@property (nonatomic)NSArray *array2;
@property (nonatomic ) NSArray * array3;

@end

