//
//  Registration.swift
//  FritterApp
//
//  Created by Pierluigi De Stasio on 2017-07-07.
//  Copyright © 2017 Peter. All rights reserved.
//

import UIKit

class Registration: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var creditCardNumberTextField: UITextField!
    @IBOutlet weak var ccvTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func signUp(_ sender: Any) {
        
        let userEmail = userEmailTextField.text
        let userPassword = userPasswordTextField.text
        //let firstName = firstNameTextField.text
        //let lastName = lastNameTextField.text
        //let birthday = birthdayTextField.text
        //let city = cityTextField.text
        //let creditCardNumber = creditCardNumberTextField.text
        //let ccv = ccvTextField.text
        
        //check for empty field
        
        if((userEmail?.isEmpty)! || (userPassword?.isEmpty)!){
            
            //display alert message
            
           displayMyAlertMessage(userMessage: "You should insert at least user and password")
            return;
            
        }
        
        //store data
        UserDefaults.standard.set(userEmail, forKey: value(forKey: "userEmail") as! String)
        UserDefaults.standard.set(userPassword, forKey: value(forKey: "userPassword") as! String)
        UserDefaults.standard.synchronize();
        
        
        //display alert message with confirmation
         let myAlert = UIAlertController(title: "Alert", message: "Registration Successful", preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil);
        
        myAlert.addAction(okAction)
        
    }
    
    
    func displayMyAlertMessage(userMessage: String){
        
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil);
        
        myAlert.addAction(okAction)
        
        
        self.present(myAlert, animated: true, completion: nil)
        
    }

}
