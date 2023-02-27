//
//  ViewController.m
//  new
//
//  Created by Sohila on 09/01/2023.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSString *digits;
    NSString *sign;
    
    NSInteger value;
    BOOL isTyping;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    digits = self.res.text;
    isTyping = NO;
    // Do any additional setup after loading the view.
}
- (IBAction)numbers:(UIButton*)sender {
    if(!isTyping){
        digits = @"";
        isTyping = YES;
    }
    
    digits = [digits stringByAppendingString:sender.titleLabel.text];
    
    self.res.text = digits;
}


- (IBAction)operations:(UIButton*)sender {
    if(!sign){
        sign = sender.titleLabel.text;
        isTyping = NO;
        if(!value){
            value = [digits integerValue];
            self.res.text = digits;
        }
    }
}

- (IBAction)equal:(UIButton*)sender {
    NSInteger result = 0;
    
    if([sign isEqualToString:@"+"]){
        result = value + [digits integerValue];
    }else if([sign isEqualToString:@"-"]){
        result = value - [digits integerValue];
    }else if([sign isEqualToString:@"x"]){
        result = value * [digits integerValue];
    }else if([sign isEqualToString:@"/"]){
        result = value / [digits integerValue];
    }
    
    sign = nil;
    value = NO;
    isTyping = NO;
    self.res.text = [NSString stringWithFormat:@"%d", result];
}
- (IBAction)clear:(UIButton*)sender {
    digits = @"";
    value = 0;
    self.res.text = digits;
}

@end
