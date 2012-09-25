//
//  TZPLevel2ViewController.m
//  TareZameenPar
//
//  Created by vigneshr on 25/09/12.
//  Copyright (c) 2012 Thoughtworks. All rights reserved.
//

#import "TZPLevel2ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface TZPLevel2ViewController ()
@property AVQueuePlayer *queuePlayer;
@property AVAudioPlayer *avplayer;

@end

@implementation TZPLevel2ViewController{
    int page;
    int charIndexToChoose;
}

@synthesize queuePlayer;
@synthesize avplayer;

- (void)viewDidLoad
{
    [super viewDidLoad];
    page = 0;
    charIndexToChoose = 0;
    [self displayPage];
}

-(void) displayPage {
    char alphabets[28] = {'Q','W','E','R','T','Y','U','I','O','P','A','S','D','F','G','H','J','K','L','Z','X','C','V','B','N','M','Q','A'};
    int startIndex = page * 4;
    
    int random[4];
    int initial = rand() % 4;
    for(int i=0;i < 4;i++){
        random[i]= initial % 4;
        initial++;
    }
    
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (int i=0; i<4; i++) {
        int alphabetIndex = startIndex + random[i];
        NSLog(@"Index %d %c",alphabetIndex,alphabets[alphabetIndex]);
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%c.png",alphabets[alphabetIndex]]];
        [[[self alphabetButtons] objectAtIndex:i] setBackgroundImage:image forState:UIControlStateNormal];
        [images addObject:image];
        [[[self alphabetButtons] objectAtIndex:i] setTag:random[i]];
    }
    
    [self playSound];
}


- (void)playSound {
    char alphabets[28] = {'Q','W','E','R','T','Y','U','I','O','P','A','S','D','F','G','H','J','K','L','Z','X','C','V','B','N','M','Q','A'};
    int startIndex = page * 4;
    
    int tag = startIndex + charIndexToChoose;
    NSString *fileName = [NSString stringWithFormat:@"%c",(alphabets[tag])];
    NSLog(@"File name %@",fileName);    
    
    NSString *press = [[NSBundle mainBundle] pathForResource:@"press" ofType:@"wav"];
    NSString *myAlphabet = [[NSBundle mainBundle] pathForResource:fileName ofType:@"wav"];
    
    AVPlayerItem *pressItem = [AVPlayerItem playerItemWithURL:[NSURL fileURLWithPath:press]];
    AVPlayerItem *alphabetItem = [AVPlayerItem playerItemWithURL:[NSURL fileURLWithPath:myAlphabet]];
    
    self.queuePlayer = [AVQueuePlayer queuePlayerWithItems:[NSArray arrayWithObjects:pressItem, alphabetItem,nil]];

    [self.queuePlayer play];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setAlphabetButtons:nil];
    [super viewDidUnload];
}
- (IBAction)alphabetClicked:(id)sender {
    int selectedButton = ((UIButton*) sender).tag;

    if(selectedButton == charIndexToChoose){

        [self playSuccessFailure:TRUE];
        
        if(page == 6){
            charIndexToChoose++;
            charIndexToChoose = charIndexToChoose % 4;
        }
        page = page+1;
        page = page % 7;
        
        [self playSuccessFailure:TRUE];

        
    }else{

        [self playSuccessFailure:FALSE];
    }
}

-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    NSString *soundUrl = [[NSBundle mainBundle] pathForResource:@"correct" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:soundUrl];
    if ([player.url isEqual:url])
    {
        [self displayPage];
    }
}

-(void) playSuccessFailure:(BOOL) success {
    NSString *fileName = success ? @"correct":@"wrong";
    NSString *soundUrl = [[NSBundle mainBundle] pathForResource:fileName ofType:@"mp3"];
    avplayer =[[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:soundUrl] error:nil];
    [avplayer setDelegate:self];
    [avplayer prepareToPlay];
    [avplayer play];
}

- (IBAction)playSoundAgain:(id)sender {
    [self playSound];
}
@end
