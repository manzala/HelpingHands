//
//  LoginViewController.swift
//  YesReady
//
//  Created by Manzala Kazmi on 10/5/17.
//  Copyright © 2017 HealthCare. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class LoginViewController: UIViewController, UITextFieldDelegate {
    
   
    @IBOutlet weak var passwordField: UITextField!
   
    @IBOutlet weak var emailField: UITextField!
    
    @IBAction func forgotPasswordButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "forgotPasswordID")
        self.present(vc!, animated: true, completion: nil)
        
    }
    
    @IBAction func signupButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "signupID")
        self.present(vc!, animated: true, completion: nil)
    }
    
    @IBAction func loginButton(_ sender: Any) {
        let emailValue = self.emailField.text;
        let passwordValue = self.passwordField.text;
    
        if self.emailField.text == "" || self.passwordField.text == "" {
            
            //Alert to tell the user that there was an error because they didn't fill anything in the textfields because they didn't fill anything in
            
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
        
        Auth.auth().signIn(withEmail: emailValue!, password: passwordValue!) { (user, error) in
            if error == nil {
                
                //Print into the console if successfully logged in
                print("You have successfully logged in")
                
                //Go to the HomeViewController if the login is sucessful
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "profileID")
                self.present(vc!, animated: true, completion: nil)
                
            } else {
                
                //Tells the user that there is an error and then gets firebase to tell them the error
                print("in error section");
               
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
                
            }
        }
        
    };
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // for hidden keyboard (only when user edit the password)
        self.passwordField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Hide keyboard when user touches outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //Presses return key, hide the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passwordField.resignFirstResponder()
        return(true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
