//
//  LoaderView.swift
//  Smart Office - Digital X
//
//  Created by Sateesh on 21/12/2020.
//

import UIKit

public class CommonLoader: NSObject {
    static var spinnerView: UIView? = nil
    
    public class func showSpinner() {
        DispatchQueue.main.async {
            guard let window = UIApplication.shared.keyWindow else {
                return
            }
            if spinnerView == nil {
                spinnerView = UIView.init(frame: window.bounds)
                spinnerView!.backgroundColor = .clear
                let activityContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
                activityContainerView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
                activityContainerView.layer.cornerRadius = 10
                let activityIndicator = UIActivityIndicatorView.init(style: .white)
                activityIndicator.startAnimating()
                activityIndicator.center = spinnerView!.center
                window.addSubview(spinnerView!)
                window.constrainToEdges(spinnerView!)
                spinnerView?.addSubview(activityContainerView)
                spinnerView?.constrainCentered(activityContainerView)
                activityContainerView.addSubview(activityIndicator)
                activityContainerView.constrainCentered(activityIndicator)
                
            }
        }
    }
    public class func hideSpinner() {
        guard spinnerView != nil else {
            return
        }
        DispatchQueue.main.async {
            if spinnerView != nil {
                spinnerView!.removeFromSuperview()
            }
            spinnerView = nil
        }
    }
    
}

// MARK: - Autolayout
extension UIView {
    func constrainToEdges(_ subview: UIView, constant: CGFloat = 0) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        let topContraint = NSLayoutConstraint(
            item: subview,
            attribute: .top,
            relatedBy: .equal,
            toItem: self,
            attribute: .top,
            multiplier: 1.0,
            constant: constant)
        
        let bottomConstraint = NSLayoutConstraint(
            item: subview,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: self,
            attribute: .bottom,
            multiplier: 1.0,
            constant: constant)
        
        let leadingContraint = NSLayoutConstraint(
            item: subview,
            attribute: .leading,
            relatedBy: .equal,
            toItem: self,
            attribute: .leading,
            multiplier: 1.0,
            constant: constant)
        
        let trailingContraint = NSLayoutConstraint(
            item: subview,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: self,
            attribute: .trailing,
            multiplier: 1.0,
            constant: constant)
        
        addConstraints([
            topContraint,
            bottomConstraint,
            leadingContraint,
            trailingContraint])
    }
    
    func constrainCentered(_ subview: UIView) {
        
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        let verticalContraint = NSLayoutConstraint(
            item: subview,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: self,
            attribute: .centerY,
            multiplier: 1.0,
            constant: 0)
        
        let horizontalContraint = NSLayoutConstraint(
            item: subview,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: self,
            attribute: .centerX,
            multiplier: 1.0,
            constant: 0)
        
        let heightContraint = NSLayoutConstraint(
            item: subview,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1.0,
            constant: subview.frame.height)
        
        let widthContraint = NSLayoutConstraint(
            item: subview,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1.0,
            constant: subview.frame.width)
        
        addConstraints([
            horizontalContraint,
            verticalContraint,
            heightContraint,
            widthContraint])
        
    }
}
