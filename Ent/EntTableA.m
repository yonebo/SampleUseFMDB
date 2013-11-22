//
//  EntTableA.m
//  test666
//
//  Created by MacPro01 on 2013/11/05.
//  Copyright (c) 2013年 eyoneya. All rights reserved.
//

#import "Common.h"
#import "EntTableA.h"
#import "SqliteDB.h"
#import <Sqlite3.h>
#import "FMDatabaseAdditions.h"

@implementation EntTableA

@synthesize key;
@synthesize textData;
@synthesize intData;
@synthesize boolData;

-(id) init{
    
    self = [super init];
    if (self) {
        key = -1;
    }
    return self;
}

+ (int) countAll{
    
    // connect database
    FMDatabase *db = [SqliteDB getDB];
    if (![db open]){
        return CONST_MSGERROR;
    }
    [db setShouldCacheStatements:YES];
    
    NSString *sql = [NSString stringWithFormat:@"select count(*) as count from tableA"];
    FMResultSet *rs = nil;
    rs = [db executeQuery:sql];
    
    int count = 0;
    if ([rs next]) {
        count = [rs intForColumn:@"count"];
    }
    
    [rs close];
    [db close];
    
    return count;
}

+ (NSMutableArray*) selectAll{
    
    // connect database
    FMDatabase *db = [SqliteDB getDB];
    if (![db open]){
        return nil;
    }
    [db setShouldCacheStatements:YES];
    
    NSString *sql = [NSString stringWithFormat:@"select key, textData, intData, boolData from tableA order by key"];
    FMResultSet *rs = nil;
    rs = [db executeQuery:sql];
    
    NSMutableArray *ret = [[NSMutableArray alloc] initWithCapacity:0];
    while ([rs next]) {
        EntTableA *ent = [EntTableA createEntTableA:rs];
        [ret addObject:ent];
    }
    
    [rs close];
    [db close];

    return ret;
}

+ (EntTableA*) selectByKey:(int)key{
    
    // connect database
    FMDatabase *db = [SqliteDB getDB];
    if (![db open]){
        return nil;
    }
    [db setShouldCacheStatements:YES];
    
    NSString *sql = [NSString stringWithFormat:@"select key, textData, intData, boolData from tableA where key = ?"];
    FMResultSet *rs = nil;
    rs = [db executeQuery:sql, [NSNumber numberWithInt:key]];
    
    EntTableA *ret = nil;
    
    if ([rs next]) {
        ret = [EntTableA createEntTableA:rs];
    }
    
    [rs close];
    [db close];

    return ret;
}

+ (EntTableA*) createEntTableA:(FMResultSet *)rs{
    
    EntTableA *ret = [[EntTableA alloc] init];
    
    ret.key = [rs intForColumn:@"key"];
    ret.textData = [rs stringForColumn:@"textData"];
    ret.intData = [rs intForColumn:@"intData"];
    ret.boolData = [rs boolForColumn:@"boolData"];

    return ret;
}

+ (int) saveKey:(int)key textData:(NSString *)textData intData:(int)intData boolData:(BOOL)boolData{
    
    // connect database
    FMDatabase *db = [SqliteDB getDB];
    if (![db open]){
        return CONST_MSGERROR;
    }
    [db setShouldCacheStatements:YES];
    
    // 存在チェック
    if ([EntTableA selectByKey:key] == nil) {
        // 存在しない ー 登録
        NSString *sql = @"INSERT INTO tableA (key, textData, intData, boolData) VALUES (?, ?, ?, ?)";
        [db executeUpdate:sql,[NSNumber numberWithInt:key], textData, [NSNumber numberWithInt:intData],[NSNumber numberWithInt:boolData]];
        
    } else {
        
        // 存在する ー 更新
        NSString *sql = @"UPDATE tableA SET textData = ?, intData = ?, boolData = ? WHERE key = ?";
        [db executeUpdate:sql ,textData ,[NSNumber numberWithInt:intData] ,[NSNumber numberWithInt:boolData] ,[NSNumber numberWithInt:key]];
    }
    
    int lastInsertRowId = (int)[db lastInsertRowId];
    [db close];

    return lastInsertRowId;
    
}

+ (void) deleteKey:(int)key {
    
    // connect database
    FMDatabase *db = [SqliteDB getDB];
    if (![db open]){
        return;
    }
    [db setShouldCacheStatements:YES];
    
    NSString *sql = @"DELETE FROM tableA WHERE key = ?";
    [db executeUpdate:sql, [NSNumber numberWithInt:key]];
    
    [db close];

    
}

@end
