//
//  ClassifiedListCell.swift
//  Classifieds
//
//  Created by Sateesh on 15/01/2021.
//

import UIKit

class ClassifiedListCell: UITableViewCell {

    static let identifier = "ClassifiedListCell"
    
    @IBOutlet weak private var  nameLbel: UILabel!
    @IBOutlet weak private var  priceLabel: UILabel!
    @IBOutlet weak private var  productImage: UIImageView!

    var classifiedItem: Classified? {
        
        didSet{
            
            self.nameLbel.text = classifiedItem?.name
            self.priceLabel.text = classifiedItem?.price
            
            if let imageUrl = self.classifiedItem?.images?[0].thumbnailUrl {
                self.productImage.setImageFrom(imageURLString: imageUrl, placeHolderImage: UIImage(named:"placeholder"), completionHandler: nil)
            }else{
                self.productImage.image = UIImage(named:"placeholder")
            }

        }
    }
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
