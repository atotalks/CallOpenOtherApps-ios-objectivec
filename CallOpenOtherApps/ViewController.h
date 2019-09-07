//
//  ViewController.h
//  CallOpenOtherApps
//
//  Created by JuneK on 07/09/2019.
//  Copyright © 2019 JuneK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import "CustomTableViewCell.h"
#import <MessageUI/MessageUI.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate>


@end

