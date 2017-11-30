//
//  GroceryViewController.swift
//  YesReady
//
//  Created by xin liu on 11/1/17.
//  Copyright © 2017 HealthCare. All rights reserved.
//

import UIKit

class GroceryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, PostTaskViewControllerDelegate {
    
    var grocery = [PostGrocery]()
    
    @IBOutlet weak var tableView: UITableView!
    //Add todo PostTaskDelegete
    
    
    
    
    func addNew(todo: PostGrocery) {
        grocery.append(todo)
        tableView.reloadData()
    }
    
    // Table view Delegate Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return grocery.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groceryCell") as! UITableViewCell
        
        let post = grocery[indexPath.row]
            cell.textLabel?.text = post.tittle
            cell.detailTextLabel?.text = post.price
        
                return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
                grocery.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.left)
            
    }
    }
    
    // Navigation methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PostGrocerySegue"{
            let destVC = segue.destination as! PostTaskViewController
            destVC.delegate = self
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        grocery.append(PostGrocery(tittle:"Task1", price:"$11"))
        grocery.append(PostGrocery(tittle:"Task2", price:"$20"))
        grocery.append(PostGrocery(tittle:"Task3", price:"$30"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
