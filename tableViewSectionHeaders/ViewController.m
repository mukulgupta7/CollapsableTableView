//
//  ViewController.m
//  tableViewSectionHeaders
//
//  Created by Mukul Gupta on 10/06/16.
//  Copyright (c) 2016 Mukul Gupta. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize tablesearch,array1,array2,array3;
bool customerIsCollapsed = YES;
bool siteIsCollapsed = YES;
bool sitesIsCollapsed = YES;


- (void)viewDidLoad {
    [super viewDidLoad];
    array1=[[NSArray alloc]initWithObjects:@"first",@"second",@"third", nil];
    array2=[[NSArray alloc]initWithObjects:@"first2",@"second2",@"thrid2", nil];
    array3=[[NSArray alloc]initWithObjects:@"first3",@"second3",@"thrid3", nil];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tablesearch.frame.size.width, 35)];
    
    UILabel *lblSection = [UILabel new];
    [lblSection setFrame:CGRectMake(0, 0, 300, 30)];
    [lblSection setFont:[UIFont fontWithName:@"Helvetica-Bold" size:17]];
    [lblSection setBackgroundColor:[UIColor clearColor]];
    lblSection.alpha = 0.5;
    if(section == 0)
    {
        if(!customerIsCollapsed)
            
            
            [lblSection setText:@"Table 1 "];
        else
            [lblSection setText:@"Table 1 "];

        
    }
    else if (section==1)
    {
        if(!sitesIsCollapsed)
            
            [lblSection setText:@"Table 2 "];
        else
         [lblSection setText:@"Table 2 "];
        
    }
    
    
    else
    {
        if(!siteIsCollapsed)
        
            [lblSection setText:@"Table 3 "];
        else
            [lblSection setText:@"Table 3 "];
        
    }
    
    UIButton *btnCollapse = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnCollapse setFrame:CGRectMake(0, 0, tablesearch.frame.size.width, 35)];
    [btnCollapse setBackgroundColor:[UIColor clearColor]];
    [btnCollapse addTarget:self action:@selector(touchedSection:) forControlEvents:UIControlEventTouchUpInside];
    btnCollapse.tag = section;
    [headerView addSubview:lblSection];
    [headerView addSubview:btnCollapse];
    return headerView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if(section == 0)
    {
        if(customerIsCollapsed)
            return 0;
        else
            return array1.count;
    }
    else if (section == 1)
    {
        if(siteIsCollapsed)
            return 0;
        else
            return array2.count;
        
    }
    else if (section == 2)
    {
        if(sitesIsCollapsed)
            return 0;
        else
            return array3.count;
        
    }
    
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        
    }
    if (indexPath.section==0)
    {
        cell.textLabel.text=[array1 objectAtIndex:indexPath.row];
    }
    else if (indexPath.section ==1)
    {
        cell.textLabel.text=[array2 objectAtIndex:indexPath.row];
    }
    else if (indexPath.section ==2)
    {
        cell.textLabel.text=[array3 objectAtIndex:indexPath.row];
    }
    
    
    return cell;
    
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3 ;
}

- (IBAction)touchedSection:(id)sender
{
    UIButton *btnSection = (UIButton *)sender;
    
    if(btnSection.tag == 0)
    {
        if(!customerIsCollapsed)
        {
            customerIsCollapsed = YES;
            siteIsCollapsed = YES;
            sitesIsCollapsed=YES;
            
            
        }
        else
        {
            customerIsCollapsed = NO;
            siteIsCollapsed = YES;
            sitesIsCollapsed = YES;
        }
        
    }
    else if(btnSection.tag == 1)
    {
       
        if(!siteIsCollapsed)
        {
            siteIsCollapsed = YES;
            customerIsCollapsed = YES;
            sitesIsCollapsed = YES;
            
        }
        else
        {
            siteIsCollapsed = NO;
            customerIsCollapsed = YES;
            sitesIsCollapsed = YES;
        }
        
        
        
    }
    else if(btnSection.tag == 2)
    {
        
        if(!siteIsCollapsed)
        {
            sitesIsCollapsed = YES;
            customerIsCollapsed = YES;
            siteIsCollapsed = YES;
            
        }
        else
        {
            sitesIsCollapsed = NO;
            customerIsCollapsed = YES;
            siteIsCollapsed = YES;
        }
        
    }
    
    [tablesearch reloadData];
}

@end