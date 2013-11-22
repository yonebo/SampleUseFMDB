//
//  EntTableA.h
//  test666
//
//  Created by MacPro01 on 2013/11/05.
//  Copyright (c) 2013年 eyoneya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"

@interface EntTableA : NSObject
{
    NSInteger key;
    NSString *textData;
    NSInteger intData;
    BOOL boolData;
}

@property(nonatomic, assign)NSInteger key;
@property(nonatomic, retain)NSString *textData;
@property(nonatomic, assign)NSInteger  intData;
@property BOOL boolData;

/// DB操作用メソッド
// 全件データ取得
+ (NSMutableArray*) selectAll;
// 全件数
+ (int) countAll;
// 対象キーのデータ取得
+ (EntTableA*) selectByKey:(int)key;
// 保存
+ (int) saveKey:(int)key textData:(NSString*)textData intData:(int)intData boolData:(BOOL)boolData;
// 削除
+ (void) deleteKey:(int) key;

// local
+ (EntTableA*) createEntTableA:(FMResultSet*) rs;

@end
