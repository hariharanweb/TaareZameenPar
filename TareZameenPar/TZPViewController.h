#import <UIKit/UIKit.h>

@interface TZPViewController : UIViewController
- (IBAction)playSound:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *alphabhet1;
@property (weak, nonatomic) IBOutlet UIButton *alphabhet2;
@property (weak, nonatomic) IBOutlet UIButton *alphabhet3;
- (IBAction)incrementPage:(id)sender;
- (IBAction)decrementPage:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *nextImage;
@property (weak, nonatomic) IBOutlet UIButton *prevImage;


@end
