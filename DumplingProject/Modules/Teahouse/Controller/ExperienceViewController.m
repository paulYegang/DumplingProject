//
//  ExperienceViewController.m
//  DumplingProject
//
//  Created by 叶刚 on 16/3/23.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "ExperienceViewController.h"
#import "ExperienceSearchViewController.h"
#import "ExperienceCell.h"

@interface ExperienceViewController ()<UISearchResultsUpdating,UISearchBarDelegate>
@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) NSMutableArray *resultArray;
@property (nonatomic, strong) NSMutableArray *tempsArray;
@end

@implementation ExperienceViewController

static id _instace;
+(instancetype) shareInstanceType{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instace = [[self alloc] init];
    });
    return _instace;
}

- (NSMutableArray *)resultArray{
    if (!_resultArray) {
        _resultArray = [NSMutableArray array];
        for (int i = 1; i < 11 ; i ++) {
            NSString *str = [NSString stringWithFormat:@"王涛的测试数据%d",i];
            [self.resultArray addObject:str];
        }
    }
    return _resultArray;
}

- (NSMutableArray *)tempsArray{
    if (!_tempsArray) {
        _tempsArray = [NSMutableArray array];
    }
    return _tempsArray;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
//    self.iconImage.hidden = YES;
    [self initSearchController];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"江湖经验";
    self.definesPresentationContext = YES;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//返回上一页面
-(void)leftBtnAction{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)initSearchController{
    UIBarButtonItem * leftBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStyleDone target:self action:@selector(leftBtnAction)];
    leftBtn.tintColor = [UIColor whiteColor];
    [leftBtn setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem=leftBtn;

    UIBarButtonItem * rightBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStyleDone target:self action:@selector(leftBtnAction)];
    rightBtn.tintColor = [UIColor whiteColor];
    [rightBtn setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem=rightBtn;
    
    ExperienceSearchViewController *resultTVC = [[ExperienceSearchViewController alloc] init];
    UINavigationController *resultVC = [[UINavigationController alloc] initWithRootViewController:resultTVC];
    self.searchController = [[UISearchController alloc]initWithSearchResultsController:resultVC];
    self.searchController.searchResultsUpdater = self;
    
    //self.searchController.dimsBackgroundDuringPresentation = NO;
    //self.searchController.hidesNavigationBarDuringPresentation = NO;
    
    
    self.searchController.searchBar.frame = CGRectMake(self.searchController.searchBar.frame.origin.x,self.searchController.searchBar.frame.origin.y,self.searchController.searchBar.frame.size.width,44);
    self.tableView.tableHeaderView = self.searchController.searchBar;
//    self.searchController.searchBar.barTintColor = [UIColor redColor];
    self.searchController.searchBar.barTintColor = [UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:1];
    self.searchController.searchBar.delegate = self;
    self.searchController.searchBar.placeholder = @"搜索";
    resultTVC.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 1)];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.resultArray.count;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ExperienceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (cell == nil) {
        cell = [[ExperienceCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
    }
//    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
//    cell.textLabel.text = self.resultArray[indexPath.row];
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}


#pragma mark - UISearchResultsUpdating

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    UINavigationController *navController = (UINavigationController *)self.searchController.searchResultsController;
    ExperienceSearchViewController *resultVC = (ExperienceSearchViewController *)navController.topViewController;
    [self filterContentForSearchText:self.searchController.searchBar.text];
    resultVC.resultsArray = self.tempsArray;
    [resultVC.tableView reloadData];
}

#pragma mark - Private Method
- (void)filterContentForSearchText:(NSString *)searchText{
    NSLog(@"%@",searchText);
    NSUInteger searchOptions = NSCaseInsensitiveSearch | NSDiacriticInsensitiveSearch;
    [self.tempsArray removeAllObjects];
    for (int i = 0; i < self.resultArray.count; i++) {
        NSString *title = self.resultArray[i];
        NSRange storeRange = NSMakeRange(0, title.length);
        NSRange foundRange = [title rangeOfString:searchText options:searchOptions range:storeRange];
        if (foundRange.length) {
            [self.tempsArray addObject:self.resultArray[i]];
        }
    }
}

/*
 #pragma mark - Table view delegate
 
 // In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
 // Navigation logic may go here, for example:
 // Create the next view controller.
 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
 
 // Pass the selected object to the new view controller.
 
 // Push the view controller.
 [self.navigationController pushViewController:detailViewController animated:YES];
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



//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    self.tabBarController.tabBar.hidden = YES;
//    self.iconImage.hidden = YES;
//}
//
//-(void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//    self.tabBarController.tabBar.hidden = NO;
//    self.iconImage.hidden = NO;
//}
//
//-(void) setupUI{
//    
//    UIView *viewback = [[UIView alloc] init];
//    viewback.backgroundColor = [UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:1];
//    [self.view addSubview:viewback];
//    
//    [viewback mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(@0);
//        make.height.equalTo(@50);
//        make.top.equalTo(@64);
//    }];
//    
////    UISearchController
////    
////    UISearchBar *search = [[UISearchBar alloc] init];
////    search.placeholder = @"搜索";
////    search.tintColor = [UIColor clearColor];
////    [viewback addSubview: search];
////    
////    [search mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.left.top.equalTo(@10);
////        make.height.equalTo(@30);
////        make.right.bottom.equalTo(@(-10));
////    }];
//}
//

@end
