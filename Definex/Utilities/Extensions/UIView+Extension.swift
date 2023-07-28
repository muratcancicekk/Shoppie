//
//  UIView+Extension.swift
//  Definex
//
//  Created by Murat Çiçek on 27.07.2023.
//

import UIKit

extension UIView {
    //Load view nib file
    func ownFirstNib() {
        guard let view = loadNib() else { return }
        view.frame = bounds
        view.autoresizingMask = [
            UIView.AutoresizingMask.flexibleWidth,
            UIView.AutoresizingMask.flexibleHeight
        ]
        addSubview(view)
    }
    
    func loadNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    //Hide or show view
    func hide(){
        self.isHidden = true
    }
    
    func show(){
        self.isHidden = false
    }
    
    //Corner radius
    func makeCornerRadius(radius: Double) {
        self.layer.cornerRadius = radius
    }
    
    // Activity start animating
    func activityStartAnimating(activityColor: UIColor, backgroundColor: UIColor) {
        let backgroundView = UIView()
        backgroundView.frame = CGRect.init(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        backgroundView.backgroundColor = backgroundColor
        backgroundView.tag = 475647
        
        var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        activityIndicator = UIActivityIndicatorView(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        activityIndicator.center = self.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.medium
        activityIndicator.color = activityColor
        activityIndicator.startAnimating()
        self.isUserInteractionEnabled = false
        
        backgroundView.addSubview(activityIndicator)
        
        self.addSubview(backgroundView)
    }
    
    func activityStopAnimating() {
        if let background = viewWithTag(475647){
            background.removeFromSuperview()
        }
        self.isUserInteractionEnabled = true
    }
    
    // View Background Add Shadow
    func addShadow(color: UIColor = .black,
                      opacity: Float = 0.5,
                      offset: CGSize = CGSize(width: 0, height: 2),
                      radius: CGFloat = 4.0) {
           layer.shadowColor = color.cgColor
           layer.shadowOpacity = opacity
           layer.shadowOffset = offset
           layer.shadowRadius = radius
           layer.masksToBounds = false
       }
}
