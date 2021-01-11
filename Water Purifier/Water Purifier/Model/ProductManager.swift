//
//  ProductManager.swift
//  Water Purifier
//
//  Created by Carlos Hernández Vázquez
//

import Foundation

struct ProductManager {
    
    //MARK: - Properties
    
    public var productPrice : Double = 0.00
    public var credits : Double = 0.00
    private var change : Double = 0.00
    public var isPaid : Bool = false
    
    //MARK: - Methods
    
    mutating func addCreditsAndCalculateChange(_ amount : Double) -> Double {
        
        credits += amount
        calculateChange()
        
        if change >= 0 {
            
            return change
            
        } else {
            
            return 0.0
            
        }
        
    }
    
    mutating func changeProductStatus() -> Bool {
        
        isPaid = credits >= productPrice
        
        return isPaid
        
    }
    
    mutating func calculateChange() {
        
        change = credits - productPrice
        
    }
    
    
    
}
