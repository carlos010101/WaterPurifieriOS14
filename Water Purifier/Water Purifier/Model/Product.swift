//
//  Product.swift
//  Water Purifier
//
//  Created by Carlos Hernández Vázquez
//

import UIKit

struct Product {
    
    //MARK: - Properties
    
    public var productName : String = ""
    public var productImage : UIImage = UIImage(named: "botella")!
    public var productCost : Double = 0.00
    
    public var timeToFill : Double {
        
        switch productName {
        case "Garrafón completo":
            return 60.00
            
        case  "Medio garrafón":
            return 30.0
            
        case "Botella":
            return 15.0
        
        default:
            return 0.0
        }
        
    }
    
}
