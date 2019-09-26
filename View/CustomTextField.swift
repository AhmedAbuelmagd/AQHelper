//
//  CustomTextField.swift
//  DoctorApp
//
//  Created by Abed Nayef Qasim on 9/1/19.
//  Copyright © 2019 Abed Nayef Qasim. All rights reserved.
//

import UIKit

@IBDesignable
public class CustomTextField: UITextField {
    
    enum ImageDirection{
        case left
        case right
    }
    
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    @IBInspectable var tintIconColor: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var rightImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var padding: CGFloat = 10 {
        didSet {
            updateView()
        }
    }
    @IBInspectable var hasRoundCorners: Bool = true {
        didSet {
            updateView()
        }
    }
    @IBInspectable var PlaceHolder: String = "" {
        didSet {
            updateView()
        }
    }
    @IBInspectable var AddBorder: Bool = false {
        didSet {
            self.layer.borderColor = tintIconColor.cgColor
            self.borderStyle = .none
            self.layer.cornerRadius = 20
            self.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.2789180871)
            self.layer.masksToBounds = true
          
        }
    }
   
    
    
    @IBInspectable var navigateToViewControll: String?
    
    
    @IBInspectable var isRequired: Bool = false {
        didSet {
            if isRequired {
                placeholder = PlaceHolder  + "*"
                let rangeOfSubString = (placeholder! as NSString).range(of: "*")
                let rangeOfFullString = NSRange(location: 0, length: placeholder!.count)
                let attributedString = NSMutableAttributedString(string: placeholder!)
                attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: tintIconColor, range: rangeOfFullString)
                attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: rangeOfSubString)
                attributedPlaceholder = attributedString
            }
        }
    }
    
    @IBInspectable var leftIconWidth: CGFloat = 20 {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var rightIconWidth: CGFloat = 20 {
        didSet {
            updateView()
        }
    }
    
    
    func updateView() {
        // layer.cornerRadius = hasRoundCorners ? frame.height / 2 : 10
        // Placeholder text color
        placeholder = PlaceHolder 

        if let placeholderString = placeholder {
            attributedPlaceholder = NSAttributedString(string: placeholderString, attributes:[NSAttributedString.Key.foregroundColor: tintIconColor])
        }
        
        textAlignment =  .left
        tintColor = tintIconColor
        textColor = tintIconColor
        addIconToTextFiled(image: leftImage, imageDirection: .left , tintColor: tintIconColor)
        addIconToTextFiled(image: rightImage, imageDirection: .right , tintColor: tintIconColor)
       
    }
    
    
    func addIconToTextFiled(image: UIImage?, imageDirection : ImageDirection , tintColor:UIColor ){
        if let image = image {
            let pad : CGFloat = 10
            let  iconWidth = imageDirection == .left ? leftIconWidth : rightIconWidth
            let imageView = UIImageView(frame: CGRect(x: pad , y: -2, width: iconWidth, height: iconWidth))
            if (image == leftImage) {
                imageView.image =  image.imageFlippedForRightToLeftLayoutDirection ()
            }else{
                imageView.image  = image
            }
            
            imageView.tintColor = tintColor
            imageView.contentMode = .scaleAspectFit
            
            var width = padding + iconWidth
            if borderStyle == .none || borderStyle == .line {
                width += 5
            }
            
            let view = UIView(frame: CGRect(x: pad, y: 0, width: width + pad , height: iconWidth))
            view.addSubview(imageView)
            
            switch imageDirection {
            case .left :
                leftViewMode = .always
                leftView = view
            case .right :
                rightViewMode = .always
                rightView = view
            }
            
        } else {
            
            switch imageDirection {
            case .left :
                leftViewMode = .always
                leftView = UIView(frame: CGRect(x: padding, y: 0, width: padding, height: frame.height))
                
            case .right :
                leftViewMode = .always
                rightView = UIView(frame: CGRect(x: padding , y: 0, width: padding, height: frame.height))
            }
        }
    }
}
extension UITextField {
    
    enum PaddingSide {
        case left(CGFloat)
        case right(CGFloat)
        case both(CGFloat)
    }
    
    func addPadding(_ padding: PaddingSide) {
        
        self.leftViewMode = .always
        self.layer.masksToBounds = true
        
        
        switch padding {
            
        case .left(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            self.leftView = paddingView
            self.rightViewMode = .always
            
        case .right(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            self.rightView = paddingView
            self.rightViewMode = .always
            
        case .both(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            // left
            self.leftView = paddingView
            self.leftViewMode = .always
            // right
            self.rightView = paddingView
            self.rightViewMode = .always
        }
    }
}
