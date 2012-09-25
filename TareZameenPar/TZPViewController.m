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

@implementation TZPViewController {
    char *selectedCharList;
    int page;
}
@synthesize avSound;

- (void)viewDidLoad
{
    [super viewDidLoad];
    page = 0;
    [self displayThreeAlphabets];
    
}

-(void) displayThreeAlphabets {
    char alphabets[7] = {'A','G','B','F','C','E','D'};
    int startIndex = page * 3;
    
    UIImage *image1 = [UIImage imageNamed:[NSString stringWithFormat:@"%c.png",alphabets[startIndex]]];
    UIImage *image2 = [UIImage imageNamed:[NSString stringWithFormat:@"%c.png",alphabets[startIndex+1]]];
    UIImage *image3 = [UIImage imageNamed:[NSString stringWithFormat:@"%c.png",alphabets[startIndex+2]]];
    
    [[self alphabhet1] setBackgroundImage:image1 forState:UIControlStateNormal];
    [[self alphabhet2] setBackgroundImage:image2 forState:UIControlStateNormal];
    [[self alphabhet3] setBackgroundImage:image3 forState:UIControlStateNormal];
    
    [[self nextImage] setHidden:FALSE];
    [[self prevImage] setHidden:FALSE];
    
    if(page == 2) {
        [[self nextImage] setHidden:TRUE];
    }
    
    if(page == 0){
        [[self prevImage] setHidden:TRUE];
    }
}

- (void)viewDidUnload
{
    [self setAlphabhet1:nil];
    [self setAlphabhet2:nil];
    [self setAlphabhet3:nil];
    [self setNextImage:nil];
    [self setPrevImage:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (IBAction)playSound:(id)sender {
    char alphabets[7] = {'A','G','B','F','C','E','D'};
    int startIndex = page * 3;
    
    int tag = ((UIButton*) sender).tag;
    NSString *fileName = [NSString stringWithFormat:@"%c",(alphabets[startIndex+tag])];
    NSLog(@"File name %@",fileName);
    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:fileName
                                              withExtension:@"mp3"];
    avSound = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:nil];    
    [avSound play];
}
- (IBAction)incrementPage:(id)sender {
    page++;
    [self displayThreeAlphabets];
}
- (IBAction)decrementPage:(id)sender {
    page--;
    [self displayThreeAlphabets];
}
@end
