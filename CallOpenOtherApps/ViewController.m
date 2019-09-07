//
//  ViewController.m
//  CallOpenOtherApps
//
//  Created by JuneK on 07/09/2019.
//  Copyright © 2019 JuneK. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, retain) NSMutableArray *mainArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self->_mainArr = [[NSMutableArray alloc] init];
    [self->_mainArr addObject:@"Call the scheme Apps"];
    [self->_mainArr addObject:@"Move To Apple WebPage"];
    [self->_mainArr addObject:@"Open the Apple Map App"];
    [self->_mainArr addObject:@"Looking for Apple Map Route"];
    
    [self->_mainArr addObject:@"Open the Google Map App"];
    [self->_mainArr addObject:@"Call the Phone"];
    [self->_mainArr addObject:@"Send the SMS Message"];
    
    
    [self->_mainArr addObject:@"Send the E-mail"];
    [self->_mainArr addObject:@"Play the Media"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self->_mainArr count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier =@"CustomCell";
    
    CustomTableViewCell *itCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    itCell.label.text = [self->_mainArr objectAtIndex:[indexPath row]];
    
    return itCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case 0:
            [self callApptoApp];
            break;
        case 1:
            [self openTheSafari];
            
            break;
        case 2:
            [self MoveToAppleMap];
            break;
            
        case 3:
            [self MoveToAppleMapRoute];
            break;
            
        case 4:
            [self MoveToGoogleMap];
            break;
            
        case 5:
            [self callPhone];
            break;
            
        case 6:
            [self sendSMSMessage];
            break;
            
        case 7:
            [self sendEmailMessage];
            break;
        case 8:
            [self playMediafile];
            break;
            
            
        default:
            break;
    }
    
    
}

-(void)callApptoApp {
    
    
    
    UIApplication *application = [UIApplication sharedApplication];
    NSURL *URL = [NSURL URLWithString:@"AppB://"];
    if([[UIDevice currentDevice].systemVersion floatValue] >= 10.0){
        
        if ([application respondsToSelector:@selector(openURL:options:completionHandler:)]) {
            [application openURL:URL options:@{}
               completionHandler:^(BOOL success) {
                   //                   NSLog(@"Open %@: %d",scheme,success);
               }];
        } else {
            BOOL success = [application openURL:URL];
            //            NSLog(@"Open %@: %d",scheme,success);
        }
        
        
    }
    else{
        
        bool can = [application canOpenURL:URL];
        
        if(can){
            [application openURL:URL];
        }
        
    }
}

-(void)openTheSafari {
    NSString* directionsURL = [NSString stringWithFormat:@"http://www.apple.com"];
    
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(openURL:options:completionHandler:)]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString: directionsURL] options:@{} completionHandler:^(BOOL success) {}];
    } else {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString: directionsURL]];
    }
}

-(void)MoveToAppleMap {
    
    NSString* directionsURL = [NSString stringWithFormat:@"http://maps.apple.com/?q=cupertino"];
    
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(openURL:options:completionHandler:)]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString: directionsURL] options:@{} completionHandler:^(BOOL success) {}];
    } else {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString: directionsURL]];
    }
}

-(void)MoveToAppleMapRoute {
    
    NSString* directionsURL = [NSString stringWithFormat:@"http://maps.apple.com/?daddr=San+Francisco,+CA&saddr=cupertino"];
    
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(openURL:options:completionHandler:)]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString: directionsURL] options:@{} completionHandler:^(BOOL success) {}];
    } else {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString: directionsURL]];
    }
}


-(void)MoveToGoogleMap {
    
    NSString* directionsURL = [NSString stringWithFormat:@"comgooglemaps://?center=40.765819,-73.975866&zoom=14&views=traffic"];
    //    NSString* directionsURL2 = [NSString stringWithFormat:@"comgooglemaps://?q=cupertino"];
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(openURL:options:completionHandler:)]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString: directionsURL] options:@{} completionHandler:^(BOOL success) {}];
    } else {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString: directionsURL]];
    }
}

-(void)callPhone {
    
    NSURL *phoneNumber = [[NSURL alloc] initWithString: @"tel:119"];
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(openURL:options:completionHandler:)]) {
        [[UIApplication sharedApplication] openURL:phoneNumber options:@{} completionHandler:^(BOOL success) {}];
    } else {
        [[UIApplication sharedApplication] openURL:phoneNumber];
    }
}

-(void)sendSMSMessage {
    
    if ([MFMessageComposeViewController canSendText]) {
        MFMessageComposeViewController *messageComposer =
        [[MFMessageComposeViewController alloc] init];
        NSString *message = @"Your Message here";
        [messageComposer setBody:message];
        messageComposer.messageComposeDelegate = self;
        [self presentViewController:messageComposer animated:YES completion:nil];
    }
}

-(void)sendEmailMessage {
    
    
    // From within your active view controller
    if([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mailCont = [[MFMailComposeViewController alloc] init];
        mailCont.mailComposeDelegate = self;
        
        [mailCont setSubject:@"yo!"];
        [mailCont setToRecipients:[NSArray arrayWithObject:@"joel@stackoverflow.com"]];
        [mailCont setMessageBody:@"Don't ever want to give you up" isHTML:NO];
        [self presentViewController:mailCont animated:YES completion:nil];
        
    }
    
}

-(void)playMediafile {
    
    
    NSString *soundFilePath = [NSString stringWithFormat:@"%@/ab.mp3",[[NSBundle mainBundle] resourcePath]];
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    
    AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];
    player.numberOfLoops = -1; //Infinite
    
    [player play];
    
}

@end
