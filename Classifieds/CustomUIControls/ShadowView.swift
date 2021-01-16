//
//  ShadowView.swift
//  ShadowView
//
//  Fiori
//
//  Created by Sateesh on 16/08/2020.
//

import UIKit

class ShadowView: UIView {

	/// The shadow color of the `ShadowView`, inspectable in Interface Builder
	@IBInspectable var shadowColor: UIColor = UIColor.black {
		didSet {
			self.updateProperties()
		}
	}
	/// The shadow offset of the `ShadowView`, inspectable in Interface Builder
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0.0, height: 0.0) {
		didSet {
			self.updateProperties()
		}
	}
	/// The shadow radius of the `ShadowView`, inspectable in Interface Builder
	@IBInspectable var shadowRadius: CGFloat = 2.0 {
		didSet {
			self.updateProperties()
		}
	}
	/// The shadow opacity of the `ShadowView`, inspectable in Interface Builder
	@IBInspectable var shadowOpacity: Float = 0.15 {
		didSet {
		}
	}

    /// The shadow radius of the `ShadowView`, inspectable in Interface Builder
    @IBInspectable var cornorRadius: CGFloat = 0.0 {
        didSet {
            self.updateProperties()
        }
    }
	/**
	Masks the layer to it's bounds and updates the layer properties and shadow path.
	*/
	override func awakeFromNib() {
		super.awakeFromNib()

		self.layer.masksToBounds = false
		self.updateProperties()
		self.updateShadowPath()
	}

	/**
	Updates all layer properties according to the public properties of the `ShadowView`.
	*/
	fileprivate func updateProperties() {
		self.layer.shadowColor = self.shadowColor.cgColor
		self.layer.shadowOffset = self.shadowOffset
		self.layer.shadowRadius = self.shadowRadius
		self.layer.shadowOpacity = self.shadowOpacity
        self.layer.cornerRadius = cornorRadius

	}

	/**
	Updates the bezier path of the shadow to be the same as the layer's bounds, taking the layer's corner radius into account.
	*/
	fileprivate func updateShadowPath() {
		self.layer.shadowPath = UIBezierPath(roundedRect: layer.bounds, cornerRadius: layer.cornerRadius).cgPath
	}

	/**
	Updates the shadow path everytime the views frame changes.
	*/
	override func layoutSubviews() {
		super.layoutSubviews()

		self.updateShadowPath()
	}
}


