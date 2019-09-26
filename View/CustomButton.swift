
import UIKit
@IBDesignable
public class CustomButton:UIButton {
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
            layer.borderWidth = 0.8
            layer.cornerRadius = 25
        }
    }
    
    @IBInspectable var addShadow: Bool = false {
        didSet {
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
            self.layer.masksToBounds = false
            self.layer.shadowRadius = 1.0
            self.layer.shadowOpacity = 0.5
            self.layer.cornerRadius = self.frame.height / 2
        }
    }
    
}
