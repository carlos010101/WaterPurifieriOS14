//
//  SelectProductVC.swift
//  Water Purifier
//
//  Created by Carlos Hernández
//

import UIKit

class SelectProductVC: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var selectProductLabel: UILabel!
    @IBOutlet weak var garrafonCompletoButton: UIButton!
    @IBOutlet weak var medioGarrafonButton: UIButton!
    @IBOutlet weak var botellaButton: UIButton!
    
    
    //MARK: - Variables
    
    private var product : Product?
    
    //MARK: - Lyfe Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textAnimated()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        roundButtons()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let paymentVC = segue.destination as? PaymentVC else { return }
            
            paymentVC.initProduct(with: product)
            
        
    }
    
    //MARK: - Actions
    
    @IBAction func garrafonCompletoButtonWasPressed(_ sender: UIButton) {

        self.product = buyProduct(name: "Garrafón completo", image: UIImage(named: "garrafon-completo")!, cost: 12.00, type: .garrafonCompleto)
        
    }
    
    @IBAction func medioGarrafonButtonWasPressed(_ sender: UIButton) {
        
        self.product = buyProduct(name: "Medio garrafón", image: UIImage(named: "medio-garrafon")!, cost: 6.00, type: .medioGarrafon)
    }
    
    @IBAction func botellaButtonWasPressed(_ sender: UIButton) {
        
        self.product = buyProduct(name: "Botella", image: UIImage(named: "botella")!, cost: 3.00, type: .botella)
        
    }
    
    
    //MARK: - Methods
    
    func buyProduct(name : String, image : UIImage, cost : Double, type : ProductType) -> Product{
        
        let product = Product(productName: name, productImage: image, productCost: cost, productType: type)
        
        return product
        
    }
    
    private func roundButtons(){
        
        garrafonCompletoButton.round()
        medioGarrafonButton.round()
        botellaButton.round()
        
    }
    
    private func textAnimated() {
        
        selectProductLabel.text = ""
        var charIndex = 0.0
        let titleText = "Seleccione un producto 💧"
        for letter in titleText {
            
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in
                
                self.selectProductLabel.text?.append(letter)
            }
            
            charIndex += 1
            
        }
        
    }
    
}

