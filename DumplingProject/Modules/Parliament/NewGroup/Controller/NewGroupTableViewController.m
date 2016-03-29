//
//  NewGroupTableViewController.m
//  DumplingProject
//
//  Created by 顾新生 on 16/3/28.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "NewGroupTableViewController.h"
#import "GroupIconCell.h"
#import "GroupMembersCell.h"
#import "AlertView.h"
#import "UIImage+Thumb.h"
#import "GroupMembersCollectionCell.h"
#import "AddMembersTableViewController.h"
#import "SetGroupNameViewController.h"
@interface NewGroupTableViewController ()<UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation NewGroupTableViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];
    _tableView.backgroundColor=[UIColor whiteColor];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[GroupIconCell class] forCellReuseIdentifier:@"GroupIconCell"];
    [self.tableView registerClass:[GroupMembersCell class] forCellReuseIdentifier:@"GroupMembersCell"];
    
    //setupNavi
    [self setupNavi];
    
    //regist notices
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(addBtnClick) name:GroupIconCellAddBtnClick object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(membersCellBtnClick:) name:GroupMembersCollectionCellClickAction object:nil];

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden=!self.tabBarController.tabBar.isHidden;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden=!self.tabBarController.tabBar.isHidden;
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
#pragma mark -设置导航条
-(void)setupNavi{
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStylePlain target:self action:@selector(naviReturnBtnClick)];
    self.navigationItem.leftBarButtonItem=leftItem;
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(naviDoneBtnClick)];
    self.navigationItem.rightBarButtonItem=rightItem;
}
-(void)naviReturnBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)naviDoneBtnClick{
    NSLog(@"%s",__func__);
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -tableview的代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=nil;
    if (indexPath.row==0) {
        cell=[[GroupIconCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"GroupIconCell"];
    }else if (indexPath.row==1) {
        cell=[[GroupMembersCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"GroupMembersCell"];
    }else if (indexPath.row==2) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"groupname"];
        cell.textLabel.text=@"群组名称";
        cell.textLabel.font=[UIFont systemFontOfSize:15];
        cell.detailTextLabel.text=@"饺子1群";
        cell.detailTextLabel.font=[UIFont systemFontOfSize:13];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        
        
    }
    [self addSeperator:cell];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==2) {
        return 44;
    }
    if (indexPath.row==1) {
        return 170;
    }
    return 100;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==2) {//填写群名称
        SetGroupNameViewController *vc=[[SetGroupNameViewController alloc]init];
        UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
        vc.title=@"填写群名称";
        vc.completeBlock=^(NSString *inputStr){
            if (inputStr!=nil &&inputStr.length>0) {
                cell.detailTextLabel.text=inputStr;
            }
        };
        vc.groupName=cell.detailTextLabel.text;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark -actionshett
/**
 *  第一个cell中＋号按钮action
 */
-(void)addBtnClick{
    //弹出一个actionsheet
    UIAlertController *alertVC=[UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    __weak typeof(self) weakSelf=self;
    [alertVC addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [weakSelf actionSheetItemClick:action];
    }]];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
         [weakSelf actionSheetItemClick:action];
    }]];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alertVC animated:YES completion:nil];

}
-(void)actionSheetItemClick:(UIAlertAction *)action{
    NSLog(@"%s--%@",__func__,action.title);
    UIImagePickerController *imgPicker=[[UIImagePickerController alloc]init];
    if ([@"拍照" isEqualToString:action.title]) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera ]) {
            imgPicker.sourceType=UIImagePickerControllerSourceTypeCamera;
        }else{
            [self showAlertWithTitle:@"提示" message:@"当前相机不可用"];
        }
    }
    if ([@"相册" isEqualToString:action.title]) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary ]) {
            imgPicker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
        }else{
            [self showAlertWithTitle:@"提示" message:@"当前相册不可用"];
        }
    }
    imgPicker.allowsEditing=YES;
    imgPicker.delegate=self;

    [self presentViewController:imgPicker animated:YES completion:nil];
    
}
#pragma mark -UIImagePickerController的代理方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    //TODO:增加群组图片
    NSLog(@"2---%@",info);
    [self close:picker];
    UIImage *thumb=[UIImage createThumbFromImage:info[@"UIImagePickerControllerOriginalImage"] size:CGSizeMake(44, 44)];
    NSLog(@"%@",thumb);
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self close:picker];
}
-(void)close:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -members cell中的按钮点击事件
-(void)membersCellBtnClick:(NSNotification *)notice{

    NSLog(@"%@",notice.name);
    BOOL flag=[notice.object boolValue];
    if (flag) {//增加成员操作
        NSLog(@"add click");
        [self addMembersToGroup];
    }else{//删除成员操作
        NSLog(@"del click");
        [self delMemberFromGroup];
    }

}
/**
 *  增加成员操作
 */
-(void)addMembersToGroup{
    //TODO:add method body
    AddMembersTableViewController *vc=[[AddMembersTableViewController alloc]init];
    vc.title=@"选择联系人";
    [self.navigationController pushViewController:vc animated:YES];
}
/**
 *  删除成员操作
 */
-(void)delMemberFromGroup{
    //TODO:add method body
}

@end
