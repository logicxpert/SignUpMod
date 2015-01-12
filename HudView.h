//
//  HUDView.h
//  HUDView
//

#import <UIKit/UIKit.h>
#import "TJSpinner.h"
@interface HudView : UIView
{
	UILabel *loadingLabel;
	HudView *loadingView;
    UIView *viewAlphafive;
    TJSpinner *spinner;
}

@property (nonatomic,retain) UILabel *loadingLabel;
@property (nonatomic,retain)  HudView *loadingView;
-(id)loadingViewInView:(UIView *)aSuperview text:(NSString*)hudText;
-(void)removeView;
-(void)setUserInteractionEnabledForSuperview:(UIView *)aSuperview;
@end
