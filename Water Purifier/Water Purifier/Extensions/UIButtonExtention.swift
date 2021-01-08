//
//  UIButtonExtention.swift
//  Water Purifier
//
//  Created by Carlos Hernández
//

import UIKit

extension UIButton {
    
    func round() {
        
        layer.cornerRadius = bounds.height / 2.4
        clipsToBounds = true
        
    }
    
    func shine() {
        
        UIView.animate(withDuration: 0.1) {
            self.alpha = 0.5
        } completion: { (completion) in
            UIView.animate(withDuration: 0.1) {
                self.alpha = 1
            }
        }

        
    }
    
    
    func roundButtons(for buttons : [UIButton?]) {
        
        for button in buttons {
            
            button?.round()
            
        }
        
        
    }
    
    func shineButtons(for buttons : [UIButton?]) {
        
        for button in buttons {
            
            button?.shine()
            
        }
        
    }
    
    
}
