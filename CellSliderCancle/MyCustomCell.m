//
//  RecycleBinCell.m
//  Spark
//
//  Created by GRX on 2022/2/9.
//

#import "MyCustomCell.h"

@implementation MyCustomCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor orangeColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self createView];
    }
    return self;
}

-(void)createView{
    /** 章节标题 */
    UILabel *titleLable = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 100, 45)];
    titleLable.text = @"第一章-名称";
    titleLable.textColor = [UIColor blackColor];
    titleLable.font = [UIFont systemFontOfSize:15];
    titleLable.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:titleLable];
    self.titleLable = titleLable;
    /** 日期 */
    UILabel *timeLable = [[UILabel alloc]initWithFrame:CGRectMake(220, 0, 100, 45)];
    timeLable.text = @"2021/1/1";
    timeLable.textColor = [UIColor blackColor];
    timeLable.font = [UIFont systemFontOfSize:15];
    timeLable.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:timeLable];
    self.timeLable = timeLable;
}
@end
