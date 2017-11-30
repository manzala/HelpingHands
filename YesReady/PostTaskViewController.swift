//
//  PostTaskViewController.swift
//  YesReady
//
//  Created by xin liu on 11/1/17.
//  Copyright © 2017 HealthCare. All rights reserved.
//

import UIKit

protocol PostTaskViewControllerDelegate{
    
    func addNew(todo:PostGrocery)
    
}

class PostTaskViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var delegate: PostTaskViewControllerDelegate!
    
    @IBOutlet var tittle: UITextField!
    
    @IBOutlet var detail: UITextView!
    
    @IBOutlet var price: UITextField!
    
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
       
        let todo = PostGrocery(tittle:tittle.text!, price:price.text!)
        delegate.addNew(todo: todo)
        //go back to previous view once button clicked
        navigationController?.popViewController(animated: true)
    }
   
    
    
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var label: UILabel!
    
    let type = ["Groceries", "Petcare", "Laundry", "Hospital", "Special Request"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return type[row]
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return type.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        label.text = type[row]
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attributedString = NSAttributedString(string: type[row], attributes: [NSForegroundColorAttributeName : UIColor.white])
        return attributedString
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
