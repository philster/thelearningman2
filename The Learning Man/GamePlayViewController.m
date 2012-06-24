//
//  GamePlayViewController.m
//  The Learning Man
//
//  Created by Dinesh Garg on 6/9/12.
//  Copyright (c) 2012 _dNESH_04028g_. All rights reserved.
//

#import "GamePlayViewController.h"
#import "HintPopOverController.h"
#import "TrashPopOverController.h"

@interface GamePlayViewController ()

@end

@implementation GamePlayViewController

@synthesize levelLabel;
@synthesize avatarImage;
@synthesize trashBinButton;
@synthesize hintButton;
@synthesize wordBackgroundLabel;
@synthesize popoverController;
@synthesize scoreLabel;
@synthesize trashPopoverController;
@synthesize wordTextField;
@synthesize checkString;
@synthesize guess;
@synthesize wordsArray;
@synthesize keyboardStack;
@synthesize wordLabel;
@synthesize wordString;


-(void)dealloc{
    [levelLabel release];
    [avatarImage release];
    [trashBinButton release];
    [hintButton release];
    [wordBackgroundLabel release];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)createViewForWord
{
    UIView *wordView = [[UIView alloc] initWithFrame:CGRectMake(275, 200, 510, 85)];
    wordView.backgroundColor = [UIColor blueColor];
    NSString *wordString = @"WORDSTR";
    
    float labelHeight = 60.0;
    float labelWidth = ((500)/([wordString length]))-10;
    float gapSize = 10.0;
    float x = 10;
    //float y = 0;
    
    UILabel *characterLabel;
    for(int i=0; i<[wordString length]; i++){
        characterLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, 12.5, labelWidth, labelHeight)];
        [wordView addSubview:characterLabel];
        characterLabel.backgroundColor = [UIColor whiteColor];
        characterLabel.tag = 1000+i;
        //characterLabel.text = [wordString substringWithRange:NSMakeRange(i, 1)];
        x = x+labelWidth+gapSize;
    }
    
    [self.view addSubview:wordView];
}

+ (NSString *) stringWithUnichar:(unichar) value {
    NSString *str = [NSString stringWithFormat: @"%C", value];
    return str;
}



-(void) createButtons
{
    
    //float p=120;
    float x = 0.0;
    float y = 0.0;
    //float y = 
    NSMutableString *name;
    NSArray *alphabets= [[NSArray alloc] initWithObjects:@"A", @"B", @"C",@"D",@"E", @"F",@"G", @"H", @"I", @"J", @"K", @"L",@"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z", @"?", nil];
    for(int i=0;i<27;i++){       
        UIButton *textButton = [UIButton buttonWithType:UIButtonTypeCustom];  
        
        name = [alphabets objectAtIndex:i];
        [textButton setTitle:name forState:UIControlStateNormal];
        textButton.frame = CGRectMake(85+x, 500+y, 75, 60);
        //[textButton setFrame:CGRectMake(500.00f, 600.0f, 50.0f, 40.0f)];
        //[textButton setCenter:CGPointMake(50.0f,p)];
        [textButton setBackgroundColor:[UIColor grayColor]];
        [textButton addTarget:self action:@selector(fullscreen:)   forControlEvents:UIControlEventTouchUpInside];   
        [self.view addSubview:textButton];
        x = x + 100.0;
        if((i%9)==8){
            y = y + 80;
            x = 0.0;
        }
       // p=p+50;     
    }
    
}

-(IBAction)fullscreen:(id)sender
{
    
    NSString *buttonText = [(UIButton *)sender currentTitle];
    //NSLog(@"Button pressed: %@", buttonText);
    UIButton* myButton = (UIButton*)sender;
    myButton.enabled = NO;
    BOOL matchFound = FALSE;

    int i = 0;
    //NSLog( @"Text: %@", labelText);
    
    
    for (i=0; i<[wordString length]; i++){
        
        if ([buttonText isEqual:[wordString substringWithRange:NSMakeRange(i, 1)]]){
            NSLog(@"There is a match");
            UILabel *label = (UILabel *)[self.view viewWithTag:1000+i];
            label.text = buttonText ;
            answerCheck--;
            NSLog(@"answerCheck: %d", answerCheck);
            matchFound = TRUE;
        }
    }
        
    if ( i == ([wordString length])){
        
        if (!matchFound){
            [self checkIncorrectWords];
            NSLog(@"Count :%d", i);

        }
    }
    
    [self wordAnsweredCorrectly];

}

// Checks If the words entered are incorrect. Implement Game Over part
// Once game over, Show a view to with options.
// Once user clicks to continue, refresh all the values ( keyboard buttons, int values and all other data except score) 

-(void)checkIncorrectWords
{
    count++;
    if ((count >=0) && (count <5)){
        // Remove different clotes, one by one. See Avatar Images for reference.
        self.avatarImage.image = [UIImage imageNamed:@"HangManClip2.png"];
        NSLog(@"Wrong Guess");
    }else{
        // if 5 guesses are over, Create a a new view controller (Try gain View : options in this page are next word and main menu ( takes you to landing page)
        // If next word, refresh all the data (except score).
        // Add the word in the incorrectly answered list ( with the asociated definition).
        
        NSLog(@"Game Over");
    }
    
}

-(void)wordAnsweredCorrectly
{

    if (answerCheck == 0){
        
        score = score + 100; // save the score. 
        scoreLabel.text = [NSString stringWithFormat:@"%d",score];
        HintPopOverController *hintPopOver = [[HintPopOverController alloc] init];
        delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [delegate.navController pushViewController:hintPopOver animated:YES];
    }

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   // wordTextField.editing = YES;
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"landingPageBackGround1.png"]]];
    [self createButtons];

    [self createViewForWord];
    //[self registerForTextFieldNotifications];
    //[wordTextField becomeFirstResponder];
    score = 100;
    count = 0;
    scoreLabel.text = [NSString stringWithFormat:@"%d",score];
    
    wordsArray = [[NSMutableArray alloc] initWithObjects:@"Agog",@"Love", @"Home", @"Lean", @"Hack", nil];
    guess = [[NSMutableArray alloc] initWithObjects:@"*GOG",@"****",@"****",@"****",@"****", nil];
    //keyboardStack = [[NSMutableArray alloc] initWithObjects:@"", nil];
    
    //wordLabel.text = @"_  G  O  G";
    
    // Replace this string with the Word from the dictionary.
    // Show the hint in the label, Hint is definition from the Pearson API.
    wordString = @"WORDSTR";
    
    // Bool to check if answer is correct.
    answerCheck = 0;
    answerCheck = [wordString length];

        
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

-(IBAction)hintButtonPressed:(id)sender
{
    // Load PopOver View
    NSLog(@" hint Button Pressed");
        
    if([self.popoverController isPopoverVisible])
    {
        [self.popoverController dismissPopoverAnimated:YES];
        return;
    }
    
    HintPopOverController *hintPopOver = [[HintPopOverController alloc] init];
    /*
    CGRect rect = CGRectMake(285, 68, 50, 50);
    UIView *hintView = [[UIView alloc] initWithFrame:rect];
    [hintView addSubview:hintButton];
    [self.view addSubview:hintView];
    */
    
    self.popoverController = [[UIPopoverController alloc]
                              initWithContentViewController:hintPopOver];
    [self.popoverController setPopoverContentSize:CGSizeMake(800, 150) animated:NO];
    
    [self.popoverController presentPopoverFromRect:hintButton.frame
                                            inView:self.view
                          permittedArrowDirections:UIPopoverArrowDirectionRight
                                          animated:YES];

    [hintPopOver release];
    //[hintView release];
    [popoverController release];
    
}

-(IBAction)trashBinButtonPressed:(id)sender
{
    
    // Loads a pop over controller
    // This pop over controller should have Tab Bar implementation with " Favorite, Flash Cards, Incorrect" word lists.
    // 

    if([self.trashPopoverController isPopoverVisible])
    {
        [self.trashPopoverController dismissPopoverAnimated:YES];
        return;
    }
    
    TrashPopOverController *trashPopOver = [[TrashPopOverController alloc] init];
    
     CGRect rect = CGRectMake(285, 68, 50, 50);
     UIView *hintView = [[UIView alloc] initWithFrame:rect];
     [hintView addSubview:hintButton];
     [self.view addSubview:hintView];
     
    
    self.trashPopoverController = [[UIPopoverController alloc]
                              initWithContentViewController:trashPopOver];
    [self.trashPopoverController setPopoverContentSize:CGSizeMake(800, 600) animated:NO];
    
    [self.trashPopoverController presentPopoverFromRect:trashBinButton.frame
                                            inView:self.view
                          permittedArrowDirections:UIPopoverArrowDirectionRight
                                          animated:YES];
    
    [trashPopOver release];
    //[hintView release];
    [trashPopoverController release];

    NSLog(@" trash Button pressed");
    
}

/*
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    checkString = [textField text];
    NSLog(@" text is %@", checkString);
}
 
-(void)registerForTextFieldNotifications {
    
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    
    [notificationCenter addObserver:self
                           selector:@selector (handle_TextFieldTextChanged:)
                               name:UITextFieldTextDidChangeNotification
                             object:self.wordTextField];
}

- (void) removeTextFieldNotifications {
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter removeObserver:self];
}


- (void) handle_TextFieldTextChanged:(id)notification {
    
//    checkString = wordTextField.text;
//    
//    if ([keyboardStack count] == 0){
//        
//        if (wordTextField.text != 
//        [keyboardStack addObject:wordTextField.text]; 
//    }
    
//    if ([wordTextField.text length] >0){
//        NSLog(@" called ");
//        if (wordTextField.text != @"a"){
//            wordLabel.text = @"AGOG";
//        }else{
//            //wordTextField.text = wordTextField.text;
//        wordLabel.text = @"*GOG";
//        }
//    }
    
    // If the word is guessed correctly, move to next screen.
    NSLog(@"Text entered : %@", wordTextField.text);
    if (![wordTextField.text compare:@"a"]) {
        [self.view setNeedsDisplay];
        wordLabel.text = @"A  G  O  G";
        
        
        self.avatarImage.image = [UIImage imageNamed:@"HangManShirt.png"];

        HintPopOverController *hintPopOver = [[HintPopOverController alloc] init];
    
        delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [delegate.navController pushViewController:hintPopOver animated:YES];

        
//        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Guessed correctly!"
//                                                            message:@"Good job!" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
//        [alertView show];
    } else {
        // Change the image.
        self.avatarImage.image = [UIImage imageNamed:@"HangManClip2.png"];
        wordLabel.text = @"*  G  O  G";
        //wordTextField.text = @"";

    }
    [self removeTextFieldNotifications];
    wordTextField.text = @"";
    [self registerForTextFieldNotifications];

}



-(void)processLetter:(NSString*)keyboardKey
{
        
    
    
}

-(BOOL)letterAlreadyGuessed:(NSString *)inputCharacter{
    
    for (int i = 0; i<[keyboardStack count]; i++){
        
        if (inputCharacter == [keyboardStack objectAtIndex:i]){
            return YES;
        }
    }
    return NO;
    
}

-(BOOL)isLetterInWord:(NSString*)inputCharacter{
    
    for (int i = 0; i<[wordsArray count]; i++){
        
        if (inputCharacter == [wordsArray objectAtIndex:i]){
            return YES;
        }
    }
    return NO;
    
}

-(void)fillGuessArrayValue{
    
    NSString *wordArrayIndexValue = [wordsArray objectAtIndex:count];
    
    for ( int i=0; i<[wordArrayIndexValue length]; i++){
            
        }
    
   // if (checkString == 
    
}
*/

@end
