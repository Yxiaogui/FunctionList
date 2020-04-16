//
//  PhotoAlbumViewController.m
//  FunctionList
//
//  Created by 海信 on 2020/3/31.
//  Copyright © 2020 海信. All rights reserved.
//

#import "PhotoAlbumViewController.h"

@interface PhotoAlbumViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@end

@implementation PhotoAlbumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) return;
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.delegate = self;
    imagePicker.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:imagePicker animated:YES completion:nil];
    
}



#pragma mark -- UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    [picker dismissViewControllerAnimated:YES completion:nil];
}


@end
