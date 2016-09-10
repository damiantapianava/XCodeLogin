//
//  ViewController.h
//  login
//
//  Created by Infraestructura on 09/09/16.
//  Copyright © 2016 Infraestructura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (BOOL)persistUser:(NSString *)user_name
          apellidos:(NSString *)apellidos
               edad:(NSInteger)edad
              email:(NSString *)email;

@property (weak, nonatomic) IBOutlet UITextField *txt_username;
@property (weak, nonatomic) IBOutlet UIButton *btn_signin;
@property (weak, nonatomic) IBOutlet UIScrollView *scroll_view;

- (IBAction)hideScrollTap:(id)sender;
- (IBAction)botonTouch:(id)sender;

@end

