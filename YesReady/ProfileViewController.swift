//
//  ProfileViewController.swift
//  YesReady
//
//  Created by Manzala Kazmi on 10/7/17.
//  Copyright © 2017 HealthCare. All rights reserved.
//

import UIKit


class ProfileViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate,UITextFieldDelegate {

    @IBOutlet weak var help: UIImageView!
    @IBAction func ChangePic(_ sender: Any) {
    
        
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        image.allowsEditing = false
        
        self.present(image, animated: true)
        {
            //After it's completed
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            
            help.image = image
        }
        else{
            //Error message
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    let gender = ["Female","Male"]
    
    
   @IBOutlet weak var genderField: IQDropDownTextField!
    
    
       @IBOutlet weak var phoneField: UITextField!
    
  
   
   

//if genderField.label

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        genderField.isOptionalDropDown = true
        genderField.itemList = ["Male", "Female"]
        
        help.layer.cornerRadius = help.frame.size.width/2
        help.clipsToBounds = true
        self.phoneField.delegate = self
       
        
    }
    //Hide keyboard when user touches outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //Presses return key, hide the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        phoneField.resignFirstResponder()
        return(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }
    

  

}
