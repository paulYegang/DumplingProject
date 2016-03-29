//
//  PopMenuViewController.m
//  DumplingProject
//
//  Created by 叶刚 on 16/3/28.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "PopMenuViewController.h"

@interface PopMenuViewController ()

@end

@implementation PopMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor clearColor];

    [self setuPUI];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)setTitleArr:(NSArray *)titleArr{
    
    _titleArr = [NSArray arrayWithArray:titleArr];
    [self.tablview reloadData];
 
}

-(void) setImageArr:(NSArray *)imageArr{
    
    _imageArr = [NSArray arrayWithArray:imageArr];
    [self.tablview reloadData];
}


-(void) setuPUI{
    UIImageView *back = [[UIImageView alloc] init];
    back.image = [UIImage imageNamed:@"22"];
    [self.view addSubview:back];
    
    [back mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];

    
    _tablview = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tablview.delegate = self;
    _tablview.dataSource = self;
    _tablview.backgroundColor= [UIColor clearColor];
    _tablview.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tablview.rowHeight = 30;
    _tablview.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_tablview];
    
    [_tablview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@12);
        make.left.right.bottom.equalTo(@0);
        
    }];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}


-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellidentifier = @"cellidentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellidentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
    }
    cell.imageView.image =  [UIImage imageNamed:[NSString stringWithFormat:@"%@",[_imageArr objectAtIndex:indexPath.row]]];
    cell.textLabel.text = [_titleArr objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:12];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.indexpath) {
        self.indexpath (indexPath.row);
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
