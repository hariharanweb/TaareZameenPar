//
//  TZPLevel2ViewController.h
//  TareZameenPar
//
//  Created by vigneshr on 25/09/12.
//  Copyright (c) 2012 Thoughtworks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TZPLevel2ViewController : UIViewController
- (IBAction)alphabetClicked:(id)sender;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *alphabetButtons;
- (IBAction)playSoundAgain:(id)sender;

@end
