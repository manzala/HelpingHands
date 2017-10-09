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
        ageField.itemList = ["16","17","19","20","21","22","23","24","25","26","27","28","29","30"]
        ageField.isOptionalDropDown = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }
    

  

}
