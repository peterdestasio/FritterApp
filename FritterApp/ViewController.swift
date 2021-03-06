//
//  ViewController.swift
//  FritterApp
//
//  Created by Pierluigi De Stasio on 2017-06-29.
//  Copyright © 2017 Peter. All rights reserved.
//

import UIKit
import CryptoSwift


class ViewController: UIViewController {
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    
    
    //var data: NSArray = []
    
    var emails = [String]()
    var passwords = [String]()
    var userIDs = [String]()
    var userNames = [String]()
    var lastNames = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        userPasswordTextField.isSecureTextEntry = true
        
        
        
        
    let url = URL(string:"http://localhost/fritter/serviceselect.php")
        
        do {
            let data = try Data(contentsOf: url!) // received from a network request, for example
         
            
            
            let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! Array<AnyObject>
           
            //print(json[0]["user_email"])
            
            for item in json { // loop through data items
                let obj = item as! NSDictionary
                for (key, value) in obj {
                    if((key as! String) == "user_id")
                    {
                        userIDs.append(value as! String)
                    }
                    if((key as! String) == "first_name")
                    {
                            userNames.append(value as! String)
                    }
                    if((key as! String) == "last_name")
                    {
                            lastNames.append(value as! String)
                    }
                    if((key as! String) == "user_pass")
                    {
                        passwords.append(value as! String)
                    }
                    if((key as! String) == "user_email")
                    {
                        emails.append(value as! String)
                    }
                }
            }
            print(emails)
            print(passwords)
            
           
        }
        catch {
            print("Error deserialization")
        }
        
        }
        
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func login(_ sender: Any) {
        let userEmail = userEmailTextField.text
        let userPassword = userPasswordTextField.text
        let userPasswordHashed = userPassword?.md5()
        
        var i = 0
        var position: Int! //variable that store the position of the user email if it is founded
        
        while(i<emails.count){
            
            if(userEmail == emails[i]){
                position = i
            }
            
            
            i+=1
        }
        
        if(position != nil){
            if(userPasswordHashed==passwords[position]){
                
                let newsFeedController = storyboard?.instantiateViewController(withIdentifier: "newsFeedId") as! NewsFeed
                newsFeedController.name = userNames[position]
                newsFeedController.id = userIDs[position]
                newsFeedController.surname = lastNames[position]
                
                
                navigationController?.pushViewController(newsFeedController, animated: true)
                
                
                print("Logged")
            }else{
                // create the alert
                let alert = UIAlertController(title: "Error", message: "Wrong Input", preferredStyle: UIAlertControllerStyle.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
            }
        }else{
            // create the alert
            let alert = UIAlertController(title: "Error", message: "Wrong Input", preferredStyle: UIAlertControllerStyle.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
        
       
      
 
       
    }
    
    
   

}

