//
//  ViewController.m
//  FunctionList
//
//  Created by 海信 on 2020/3/31.
//  Copyright © 2020 海信. All rights reserved.
//

#import "ViewController.h"
#import "PhotoAlbumViewController.h"
//system
#import <AVFoundation/AVCaptureDevice.h>
#import <AVFoundation/AVMediaFormat.h>
#import <Photos/Photos.h>
#import <AssetsLibrary/AssetsLibrary.h>

static NSString * const ListTableViewCellId = @"cellid";

@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic,readwrite,copy)NSArray *listNames;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"FuncList";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ListTableViewCellId];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ListTableViewCellId];
    cell.textLabel.text = self.listNames[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        [self showPhotoAlbum];
    }
}

- (void)showPhotoAlbum{
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) return;
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    imagePicker.delegate = self;
    imagePicker.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:imagePicker animated:YES completion:nil];
}

#pragma mark -- UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    [picker dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark -- getters && setter

- (NSArray *)listNames{
    if (!_listNames) {
        _listNames = @[@"视频剪辑"];
    }
    return _listNames;
}

@end
