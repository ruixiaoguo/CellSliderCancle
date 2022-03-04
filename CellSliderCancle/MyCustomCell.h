//
//  RecycleBinCell.h
//  Spark
//
//  Created by GRX on 2022/2/9.
//

#import "SliderCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyCustomCell : SliderCell
@property(nonatomic,strong)UILabel *titleLable;
@property(nonatomic,strong)UILabel *timeLable;
@end

NS_ASSUME_NONNULL_END
