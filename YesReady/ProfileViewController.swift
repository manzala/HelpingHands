//
//  ProfileViewController.swift
//  YesReady
//
//  Created by Manzala Kazmi on 10/7/17.
//  Copyright © 2017 HealthCare. All rights reserved.
//

import UIKit


class ProfileViewController: UIViewController {
    
    
    let gender = ["Female","Male"]
    
    
   @IBOutlet weak var genderField: IQDropDownTextField!
    
    
    @IBOutlet weak var ageField: IQDropDownTextField!
    
    @IBOutlet weak var phoneField: UITextField!
    
  
   
   

//if genderField.label

    

    
    
    
    
    
       override func viewDidLoad() {
        super.viewDidLoad()
        
        genderField.isOptionalDropDown = true
        genderField.itemList = ["Male", "Female"]
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }
    

  

}
