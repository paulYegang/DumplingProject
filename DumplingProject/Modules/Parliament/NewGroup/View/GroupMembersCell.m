//
//  GroupMembersCell.m
//  DumplingProject
//
//  Created by 顾新生 on 16/3/28.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "GroupMembersCell.h"
#import "GroupMembersCollectionCell.h"
@interface GroupMembersCell()<UICollectionViewDelegate,UICollectionViewDataSource>

@end
@implementation GroupMembersCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubviews];
    }
    return self;
}

-(void)setupSubviews{
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    layout.itemSize=CGSizeMake(SCREEN_WIDTH*0.15, SCREEN_WIDTH*0.2);
    layout.minimumLineSpacing=20;
    layout.minimumInteritemSpacing=20;
    
    _collectionView=[[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    _collectionView.dataSource=self;
    _collectionView.delegate=self;
    _collectionView.backgroundColor=[UIColor clearColor];
    _collectionView.showsVerticalScrollIndicator=NO;
    [self.contentView addSubview:_collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.equalTo(@10);
        make.right.and.bottom.equalTo(@(-20));
    }];
    [_collectionView registerClass:[GroupMembersCollectionCell class] forCellWithReuseIdentifier:@"collectioncell"];
    
}


#pragma mark -collectionview的代理方法
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    if (self.members.count==0) {
//        return self.members.count+1;
//    }
    return self.members.count+2;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    GroupMembersCollectionCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"collectioncell" forIndexPath:indexPath];

    if (indexPath.row==self.members.count) {//＋/-号
        cell.cellType=CollectionCellTypeActionAdd;
        
    }
    if (indexPath.row==self.members.count+1) {
        cell.cellType=CollectionCellTypeActionDel;
    }

    return cell;
}
#pragma mark -setter and getter
-(NSMutableArray *)members{
    if (_members==nil) {
        _members=[NSMutableArray array];
    }
    return _members;
}
@end
