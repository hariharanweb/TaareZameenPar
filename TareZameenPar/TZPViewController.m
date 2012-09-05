//
//  TZPViewController.m
//  TareZameenPar
//
//  Created by Hariharan Thiagarajan on 05/09/12.
//  Copyright (c) 2012 Thoughtworks. All rights reserved.
//

#import "TZPViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface TZPViewController ()
@property AVAudioPlayer *avSound;

@end

@implementation TZPViewController
@synthesize avSound;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (IBAction)playSound:(id)sender {    
    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"a"
                                              withExtension:@"mp3"];
    avSound = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:nil];    
    [avSound play];
}
@end
