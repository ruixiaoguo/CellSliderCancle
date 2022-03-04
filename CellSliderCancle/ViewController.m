//
//  ViewController.m
//  CellSliderCancle
//
//  Created by GRX on 2022/3/4.
//
/*! app尺寸 */
#define Main_Screen_Height [[UIScreen mainScreen] bounds].size.height
#define Main_Screen_Width  [[UIScreen mainScreen] bounds].size.width

#import "ViewController.h"
#import "SliderMenu.h"
#import "MyCustomCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,SliderMenuDelegate>
@property(nonatomic,strong)UITableView *MyTableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.MyTableView];
}

#pragma mark=================tableviewDelegate================
- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView*)tableView
 numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView*)tableView
heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}
- (UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footView = [[UIView alloc]init];
    return footView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (UITableViewCell*)tableView:(UITableView*)tableView
        cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    MyCustomCell *bookCell = [tableView dequeueReusableCellWithIdentifier:@"RecycleBinCell" forIndexPath:indexPath];
    bookCell.menuDelegate = self;
    return bookCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([SliderMenu shared].currentCell.state == SliderMenuOpen) {
        [[SliderMenu shared].currentCell close];
        return;
    }
}

#pragma mark===================SliderDelegate=================
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if ([SliderMenu shared].currentCell.state == SliderMenuOpen) {
        [[SliderMenu shared].currentCell close];
    }
}
- (NSArray<MenuItem *> *)sliderMenuItemsForIndexPath:(NSIndexPath *)indexPath{
    MenuItem *item1 = [MenuItem title:@"删除" bgcolor:UIColor.redColor bgImage:@""];
    item1.width = 87;
    MenuItem *item2 = [MenuItem title:@"恢复" bgcolor:UIColor.greenColor bgImage:@""];
    item2.width = 87;
    return @[item1,item2];
}

  
- (BOOL)sliderMenuDidSelectIndex:(NSInteger)index atIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"didSelectIndex:%ld row:%ld",index,indexPath.section);
    return true;
}

- (UITableView *)MyTableView {
    if (!_MyTableView) {
        _MyTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, Main_Screen_Width ,Main_Screen_Height) style:UITableViewStyleGrouped];
        _MyTableView.dataSource = self;
        _MyTableView.delegate = self;
        _MyTableView.backgroundColor = [UIColor whiteColor];
        _MyTableView.showsVerticalScrollIndicator = NO;
        _MyTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_MyTableView registerClass:[MyCustomCell class] forCellReuseIdentifier:@"RecycleBinCell"];
    }
    return _MyTableView;
}



@end
