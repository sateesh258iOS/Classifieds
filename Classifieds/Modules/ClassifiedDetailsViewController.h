//
//  ClassifiedDetailsViewController.h
//  Classifieds
//
//  Created by Sateesh on 16/01/2021.
//

#import <UIKit/UIKit.h>

@class ClassifiedDetailsViewModel;

NS_ASSUME_NONNULL_BEGIN

@interface ClassifiedDetailsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (nonatomic, retain) ClassifiedDetailsViewModel *viewModel;

@end

NS_ASSUME_NONNULL_END
