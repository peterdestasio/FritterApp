//
//  SearchFriend.swift
//  FritterApp
//
//  Created by Pierluigi De Stasio on 2017-07-07.
//  Copyright © 2017 Peter. All rights reserved.
//

import UIKit

class SearchFriend: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    let animals = ["panda", "lion", "elephant"]
    
    var emails = [String]()
    var passwords = [String]()
    var userIDs = [String]()
    var userNames = [String]()
    var lastNames = [String]()
    
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

    override func viewDidLoad() {
        super.viewDidLoad()

            
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
