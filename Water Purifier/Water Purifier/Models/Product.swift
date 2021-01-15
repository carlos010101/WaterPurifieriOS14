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
    public var productType : ProductType 
    
    public var timeToFill : Int {
        
        switch productName {
        case "Garrafón completo":
            return 60
            
        case  "Medio garrafón":
            return 30
            
        case "Botella":
            return 15
        
        default:
            return 0
        }
        
    }
    
    
    
}
