//
//  UIViewControllerExtensions.swift
//  Mahalkom
//
//  Created by Wafaa Alshahed on 9/11/18.
//  Copyright © 2018 Line. All rights reserved.
//


import UIKit
import UIKit

public extension UIViewController {
    
    func  showToastMessage(title:String, message:String){
        let messageVC = UIAlertController(title: title, message: message , preferredStyle: .actionSheet)
        definesPresentationContext = true
        if presentedViewController == nil {
            present(messageVC, animated: true) {
                Timer.scheduledTimer(withTimeInterval: 1.8 , repeats: false, block: { (_) in
                    messageVC.dismiss(animated: true, completion: nil)})}
        } else{
            self.dismiss(animated: false) { () -> Void in
                self.present(messageVC, animated: true) {
                    Timer.scheduledTimer(withTimeInterval: 1.8 , repeats: false, block: { (_) in
                        messageVC.dismiss(animated: true, completion: nil)})}
            }
        }

    }
    
    
    
    func displayAlert(withTitle title: String?, message: String?, actions: [UIAlertAction]? = [UIAlertAction(title: "OK", style: UIAlertAction.Style.default,handler: nil)]) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        if let strongActions = actions {
            for action in strongActions {
                alertController.addAction(action)
            }
        }
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    
    @available(*, deprecated, message: "use displayAlertMessage: instead")
    func displayAlertMessageWithCompletion(title:String, message:String, completion: (()->())? = nil) {
        guard !title.isEmpty && !message.isEmpty else {
            print("Will not show alert without title and message, aborting")
            return
        }
        let alertController = UIAlertController(title: title, message:
            message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default,handler: nil))
        self.present(alertController, animated: true, completion: completion)
    }
    
    @available(*, deprecated, message: "use displayAlertMessage: instead")
     func displayAlertMessageWithAction(title:String, message:String, action: @escaping (UIAlertAction)->()) {
        let alertController = UIAlertController(title: title, message:
            message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default,handler: action))
        self.present(alertController, animated: true)
    }
    
    @available(*, deprecated, message: "use displayAlertMessage: instead")
     func displayAlertMessageWithTitleForAction(title:String, message:String, actionTitle:String, action: @escaping (UIAlertAction)->()) {
        let alertController = UIAlertController(title: title, message:
            message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: actionTitle, style: UIAlertAction.Style.default,handler: action))
        self.present(alertController, animated: true)
    }
    
    @available(*, deprecated, message: "use displayAlertMessage: instead")
     func displayAlertMessageWithTitleForAction(title:String, message:String, actionTitle:String, action: @escaping (UIAlertAction)->(), cancelActionTitle: String, cancelAction: @escaping (UIAlertAction) -> ()) {
        let alertController = UIAlertController(title: title, message:
            message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: actionTitle, style: UIAlertAction.Style.default,handler: action))
        alertController.addAction(UIAlertAction.init(title: cancelActionTitle, style: .cancel, handler: cancelAction))
        self.present(alertController, animated: true)
    }
    
}

