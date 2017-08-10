//
//  Registration.swift
//  FritterApp
//
//  Created by Pierluigi De Stasio on 2017-07-07.
//  Copyright © 2017 Peter. All rights reserved.
//

import UIKit

class Registration: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var creditCardNumberTextField: UITextField!
    @IBOutlet weak var ccvTextField: UITextField!
    
    //link to service insert to insert a new user
    let URL_INSERT = "http://localhost/fritter/serviceinsert.php"
    
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
        
        //getting value from text field
        let userName = userNameTextField.text!
        let userEmail = userEmailTextField.text!
        let userPassword = userPasswordTextField.text!
        let firstName = firstNameTextField.text!
        let lastName = lastNameTextField.text!
        let birthday = birthdayTextField.text!
        let city = cityTextField.text!
        let creditCardNumber = creditCardNumberTextField.text!
        let ccv = ccvTextField.text!
        
        
        //Create a NSURL
        let requestURL = NSURL(string: URL_INSERT)
        
        // creating NSmutableURLRequest
        let request = NSMutableURLRequest(url: requestURL! as URL)
        
        //SETTING THE METHOD TO POST
        request.httpMethod = "POST"
        
        //create the POST parameter by concatenating the keys and values from TET-field
        let postParameter = "user_name=\(userName)&user_email=\(userEmail)&user_pass=\(userPassword)&first_name=\(firstName)&last_name=\(lastName)&birthday=\(birthday)&city=\(city)&credit_card=\(creditCardNumber)&ccv=\(ccv)"
        request.httpBody = postParameter.data(using: String.Encoding.utf8)
        
            // Create a TASK to send the POST request
            let task = URLSession.shared.dataTask(with: request as URLRequest){
                data, response, error in
                if error != nil{
                    print("error is \(String(describing: error))")
                    return
                }
                
                do{
                    // Read the response FROM Server which is in the JSON Format -- We have to Convert it to SWIFT String -- Decode it
                    let myJSON = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as?
                    NSDictionary
                    print("serializzazione")
                    //Parsing the json
                    if let parseJSON = myJSON{
                        
                        // Creating the sring in order to store the response form a Server
                        var msg: String!
                        
                        msg = parseJSON["message"] as! String?
                        //Print the response from SERVER (php & MySQL)
                        print(msg)
                    }
                }catch{
                    print(error)
                }
                
                
                
            }
            // Executing the TASK and keep the session Alive btw IOS APP and Server
            task.resume()
        }
    
    
        //check for empty field
        /*
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
    */
        
        
        
    
    
    
    func displayMyAlertMessage(userMessage: String){
        
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil);
        
        myAlert.addAction(okAction)
        
        
        self.present(myAlert, animated: true, completion: nil)
        
        }



}

