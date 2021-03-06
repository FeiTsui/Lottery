//
//  JSHallTableViewController.m
//  网易彩票
//
//  Created by  江苏 on 16/4/26.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSHallTableViewController.h"
#import "CoverView.h"
#import "JSActivityView.h"
#import "JSDragDownView.h"

@interface JSHallTableViewController ()<JSActivityViewDelegate>

@property(nonatomic,assign)BOOL HadPopView;

@property(nonatomic,strong)JSDragDownView* dragView;

@end

@implementation JSHallTableViewController

-(JSDragDownView *)dragView{
    if (_dragView==nil) {
        _dragView=[JSDragDownView showInView:self.view];
        [self.view addSubview:_dragView];
    }
    return _dragView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建左边按钮，注意图片不要被系统自动渲染的方法
    UIImage *image = [UIImage imageNamed:@"CS50_activity_image"];
    
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(clickedLeft)];
    
    //设置右边按钮
    UIImage* rightImage=[UIImage imageNamed:@"Development"];
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[rightImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(clickedRight)];
    
}

#pragma mark-点击右边按钮
-(void)clickedRight{
    
    if (self.HadPopView==NO) {
        
        [self dragView];
        
    }else{
        
       [self.dragView hide:self.dragView];
        
        self.dragView=nil;
        
    }
    
    self.HadPopView=!self.HadPopView;
    
}

#pragma mark-点击左边按钮
-(void)clickedLeft{
    
    [CoverView show];
    
    JSActivityView* activityView=[JSActivityView show];
    
    activityView.delegate=self;
    
}

#pragma mark--JSActivityDelegate方法
-(void)activityViewDidClickedHiddenButton:(JSActivityView*)activityView{
    
    [activityView hide];
    
    [CoverView hide];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
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

@end
