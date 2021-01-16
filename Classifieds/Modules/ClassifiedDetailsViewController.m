//
//  ClassifiedDetailsViewController.m
//  Classifieds
//
//  Created by Sateesh on 16/01/2021.
//

#import "ClassifiedDetailsViewController.h"
#import "Classifieds-Swift.h"

@interface ClassifiedDetailsViewController ()
@end

@implementation ClassifiedDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self populateData];
}

-(void)populateData{
    
    self.title = [self.viewModel.classifiedName uppercaseString];
    self.nameLabel.text = self.viewModel.classifiedName.capitalizedString;
    self.priceLabel.text = self.viewModel.price;
    self.dateLabel.text = self.viewModel.createdDate;
    
    NSString *imageUrl = self.viewModel.imageUrl;
    
  //  [self.productImageView setImageFromImageURLString:imageUrl placeHolderImage:[UIImage imageNamed:@"placeholder"] completionHandler:nil];
    
    [self.productImageView setImageFromImageURLString:imageUrl placeHolderImage:[UIImage imageNamed:@""] progressHandler:^(int64_t expected ,int64_t downloaded, NSError *error) {
        
        NSLog(@"Expected %lld, downloaded %lld", expected, downloaded);
        float downloadPercentage = downloaded/expected;
        [self.progressView setProgress:downloadPercentage];
        
        if (downloadPercentage == 1) {
            self.progressView.hidden = YES;
        }
        
    } completionHandler:^(UIImage * image, NSError * error) {
        
    }];
    
}


@end
