//
//  ViewController.m
//  jsonToProperty_oc
//
//  Created by CityMedia on 2018/10/31.
//  Copyright © 2018年 free. All rights reserved.
//

#import "ViewController.h"
@interface ViewController()

@property (unsafe_unretained) IBOutlet NSTextView *textView;
@property (unsafe_unretained) IBOutlet NSTextView *textViewR;
@property (unsafe_unretained) IBOutlet NSTextView *textViewEditL;
@property (unsafe_unretained) IBOutlet NSTextView *textViewEditR;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    a

    // Do any additional setup after loading the view.
}
- (IBAction)btnAction:(id)sender {
    
    NSString * stra = self.textView.textStorage.string;
    
    stra = [stra stringByReplacingOccurrencesOfString:@" " withString:@""];
    stra = [stra stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    stra = [stra stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    stra = [stra stringByReplacingOccurrencesOfString:@"{" withString:@""];
    stra = [stra stringByReplacingOccurrencesOfString:@"}" withString:@""];
    
    NSString * sepStr = @";";
    
    if (self.textViewEditL.textStorage.string.length > 0) {
        sepStr = self.textViewEditL.textStorage.string;
    }
    NSArray * arr = [stra componentsSeparatedByString:sepStr];
    
    NSString * strDef = @"";
    for (NSString * str in arr) {
        if (str.length > 0 && ![str isEqualToString:@" "] ) {
        }else{
            break;
        }
        
        
        NSString * setStra = @"=";
        if (self.textViewEditR.textStorage.string.length > 0) {
            setStra = self.textViewEditR.textStorage.string;
        }
        NSArray * arrKeyValue =  [str componentsSeparatedByString:setStra];
        
//        NSArray * arrKeyValue = [str componentsSeparatedByString:@"="];
        NSString * key = arrKeyValue[0];
        NSString * value = [arrKeyValue lastObject] ;
        
        if ([value rangeOfString:@"\\U"].location != NSNotFound) {
            value = [self stringByReplaceUnicode:value];
        }
        NSString * lastStr = @"/**";
        lastStr = [lastStr stringByAppendingString:@"\n"];
        lastStr = [lastStr stringByAppendingString:@" * "];
        lastStr = [lastStr stringByAppendingString:key];
        lastStr = [lastStr stringByAppendingString:@"  "];
        lastStr = [lastStr stringByAppendingString:value];
        lastStr = [lastStr stringByAppendingString:@"\n"];
        lastStr = [lastStr stringByAppendingString:@"*/"];
        lastStr = [lastStr stringByAppendingString:@"\n"];
        lastStr = [lastStr stringByAppendingString:@"@property(nonatomic,copy) NSString * "];
        lastStr = [lastStr stringByAppendingString:key];
        lastStr = [lastStr stringByAppendingString:@";"];
        lastStr = [lastStr stringByAppendingString:@"\n"];
        strDef = [strDef stringByAppendingString:lastStr];
    }
    self.textViewR.string = strDef;
    
    
}


- (NSString *)stringByReplaceUnicode:(NSString *)unicodeString
{
    NSMutableString *convertedString = [unicodeString mutableCopy];
    [convertedString replaceOccurrencesOfString:@"\\U" withString:@"\\u" options:0 range:NSMakeRange(0, convertedString.length)];
    CFStringRef transform = CFSTR("Any-Hex/Java");
    CFStringTransform((__bridge CFMutableStringRef)convertedString, NULL, transform, YES);
    
    return convertedString;
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

/**
 {
 academyId = 1;
 academyName = "\U6570\U7406\U5b66\U9662";
 }
 */




@end
