//
//  SearchFriend.swift
//  FritterApp
//
//  Created by Pierluigi De Stasio on 2017-07-07.
//  Copyright © 2017 Peter. All rights reserved.
//

import UIKit

class SearchFriend: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    //let animals = ["panda", "lion", "elephant"]
    
    var emails = [String]()
    var passwords = [String]()
    var userIDs = [String]()
    var userNames = [String]()
    var lastNames = [String]()
    
    
    //id user current session
    var idUser = 0
    
    //index of the row clicked
    var myIndex = 0
    
    //for insert following data
    let URL_INSERT = "http://localhost/fritter/servicefollow.php"
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return userNames.count
    }
    
    
   
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FriendTableViewCell
        
        cell.labelName.text = userNames[indexPath.row]
        cell.labelSur.text = lastNames[indexPath.row]
    
        
        return (cell)
        
    }
    
    //function used to track the table clicked
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        myIndex = indexPath.row
        print(userIDs[myIndex])
        
        //Create a NSURL
        let requestURL = NSURL(string: URL_INSERT)
        
        // creating NSmutableURLRequest
        let request = NSMutableURLRequest(url: requestURL! as URL)
        
        //SETTING THE METHOD TO POST
        request.httpMethod = "POST"
        
        //create the POST parameter by concatenating the keys and values from TET-field
        let postParameter = "followerID=\(idUser)&followedID=\(userIDs[myIndex])"
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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("USER ID: ")
        print(idUser)
            
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

}
