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
    @IBOutlet weak var okButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        roundButtons()
        
    }
    
    //MARK: - Actions
    
    @IBAction func garrafonCompletoButtonWasPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func medioGarrafonButtonWasPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func botellaButtonWasPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func okButtonWasPressed(_ sender: UIButton) {
        
    }
    
    //MARK: - Functions
    
    private func roundButtons(){
        
        garrafonCompletoButton.round()
        medioGarrafonButton.round()
        botellaButton.round()
        
    }
    
    
    


}

