//
//  ViewController.m
//  login
//
//  Created by Infraestructura on 09/09/16.
//  Copyright © 2016 Infraestructura. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    BOOL keyboardisUP;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self persistUser:@"Damian" apellidos:@"Tapia Nava" edad:28 email:@"damian@kubofinanciero.com"];
    
    CGFloat maxY    = CGRectGetMaxX(self.txt_username.frame);
    CGFloat ancho   = CGRectGetMaxX([[UIScreen mainScreen] bounds]);
    CGSize  newSize = CGSizeMake(ancho, maxY + 15.0);
    
    self.scroll_view.contentSize = newSize;
    [self.scroll_view setContentSize:newSize];
}

-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"La vista está apunto de aparecer");
}

-(void)viewDidAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShowedCallback:) name:UIKeyboardDidShowNotification  object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHidedCallback:)  name:UIKeyboardWillHideNotification object:nil];
}

-(void)viewWillDisappear:(BOOL)animated{
    NSLog(@"La vista está apunto de desaparecer");
}

-(void)viewDidDisappear:(BOOL)animated{

    NSLog(@"La vista desapareció");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)persistUser:(NSString *)user_name
          apellidos:(NSString *)apellidos
               edad:(NSInteger)edad
              email:(NSString *)email{
    
    
    return YES;
};

-(void)keyboardShowedCallback:(NSNotification *) notif
{
    if(keyboardisUP)
    {
        return;
    }
    
    [self ajustarScroll:YES notif:notif];
}

-(void)keyboardHidedCallback:(NSNotification *) notif
{
    if(keyboardisUP)
    {
        return;
    }
    
    [self ajustarScroll:NO notif:notif];
}

-(void)ajustarScroll:(BOOL)aumento_ENABLED notif:(NSNotification *) notif
{
    NSDictionary * info;
    NSValue * value;
    CGRect keyboard_frame;
    CGSize size;
    
    info  =  notif.userInfo;
    value = [info valueForKey:UIKeyboardFrameEndUserInfoKey];
    keyboard_frame = [value CGRectValue];
    
    size = self.scroll_view.contentSize;
    
    if(aumento_ENABLED)
    {
        
        size.height += keyboard_frame.size.height;
        
    } else {
        
        size.height -= keyboard_frame.size.height;
    }
    
    self.scroll_view.contentSize = size;
    
    keyboardisUP = YES;
}

- (IBAction)hideScrollTap:(id)sender
{
    /*
    if([self.txt_username isFirstResponder])
    {
       [self.txt_username resignFirstResponder];
    }
    */
       
    for(UIView * view in self.scroll_view.subviews)
    {
        if([view isKindOfClass:[UITextField class]])
        {
            if([((UITextField *) view) isFirstResponder])
            {
                [((UITextField *) view) resignFirstResponder];
            }
        }
    }
}

- (IBAction)botonTouch:(id)sender
{
    
    
    UIAlertController *ac;
    UIAlertAction * botonOk;
    BOOL error_ENABLED;
    
    /* para crear una instancia
    UIView *view;
    view = [[UIView alloc] init];
     */
    
    if([self.txt_username.text isEqualToString:@""])
    {
        error_ENABLED = YES;
    }
    
    if(error_ENABLED)
    {
        ac = [UIAlertController alertControllerWithTitle:@"ER00R"
                                             message:@"ESTE ES UN MENSAJE DE ERROR"
                                      preferredStyle:UIAlertControllerStyleAlert];
    
    
        botonOk = [UIAlertAction actionWithTitle:@"ok"
                                           style:UIAlertActionStyleDefault
                                         handler:nil];
    
        [ac addAction:botonOk];
        
        [self presentViewController:ac animated:YES completion:nil];
        
    } else {
    
    
    
        [self performSegueWithIdentifier:@"loginOK" sender:self];
    }
}
@end
