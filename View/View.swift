//
//  View.swift
//  DoctorApp
//
//  Created by Abed Nayef Qasim on 9/1/19.
//  Copyright © 2019 Abed Nayef Qasim. All rights reserved.
//

import UIKit
public extension UIView {
    class func loadFromXib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    
    func setRounded() {
        let radius = self.frame.height / 2
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    func setRounded(_ radius:CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    func setBorder(size:CGFloat,color:UIColor) {
        self.layer.borderWidth = size
        self.layer.borderColor = color.cgColor
    }
    
    
    func addShadowView(color:CGColor,width:Int,height:Int,Opacidade:Float,radius:CGFloat) {
        self.layer.shadowColor = color
        self.layer.shadowOffset = CGSize(width: width, height: height)
        self.layer.shadowOpacity = Opacidade
        self.layer.shadowRadius = radius
        self.layer.masksToBounds = false
        self.layer.cornerRadius = radius
    }
}
