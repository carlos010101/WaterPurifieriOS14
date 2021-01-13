//
//  CleanVC.swift
//  Water Purifier
//
//  Created by mac on 11/01/21.
//

import UIKit

class CleanVC: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var productImage: UIImageView!
    
    
    //MARK: - Properties
    private var product : Product?

    //MARK: - Lyfe Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        flipImage(product: product)

    }
    
    
    @IBAction func okButtonWasPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: K.Segues.toFillFromCleanSegue, sender: self)
        
    }
    
    
    //MARK: - Methods
    
    public func initProduct(product : Product?) {
        
        guard let selectedProduct = product else { return }
        
        self.product = selectedProduct
        
    }
    
    public func flipImage (product : Product?) {
        
        guard let selectedProduct = product else { return }
        
        self.productImage.image = selectedProduct.productImage
        self.productImage.transform = CGAffineTransform(rotationAngle: (180.0 * .pi) / 180.0)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let prepareVC = segue.destination as? PrepareVC else { return }
        
        prepareVC.initProduct(product: self.product)
        
    }
    
}
