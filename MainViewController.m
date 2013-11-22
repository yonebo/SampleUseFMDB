//
//  MainViewController.m
//  SampleUseFMDB
//
//  Created by MacPro01 on 2013/11/21.
//  Copyright (c) 2013年 eyoneya. All rights reserved.
//

#import "MainViewController.h"
#import "SqliteDB.h"
#import "EntTableA.h"

@interface MainViewController ()
@end

@implementation MainViewController

@synthesize tfKey;
@synthesize tfTData;
@synthesize tfIData;
@synthesize swBData;
@synthesize buttonSearch;
@synthesize buttonDelete;
@synthesize buttonRegistry;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/// 登録ボタン押下処理
- (IBAction)saveData:(id)sender {
}

/// 削除ボタン押下処理
- (IBAction)deleteData:(id)sender {
}

///検索ボタン押下処理
- (IBAction)searchData:(id)sender {
    
    // 検索条件
    NSInteger key = [tfKey.text integerValue];
    if (key < 1){
        NSLog(@"[key]を入力してください");
        return;
    }
    
    EntTableA *ent = [EntTableA selectByKey:key];
    if (ent != nil) {
        tfTData.text = ent.textData;
        tfIData.text = [NSString stringWithFormat:@"%d", ent.intData];
        //tfBData.text = [NSString stringWithFormat:@"%d", ent.boolData];
    }
}

/// スイッチ切り替え処理
- (IBAction)switchBData:(id)sender {
}

/// テキストボックス-フォーカスアウト時処理
- (IBAction)closeSoftwareKeyboard:(id)sender{
    [sender resignFirstResponder];
}

@end
