//
//  NewsFeed.swift
//  FritterApp
//
//  Created by Pierluigi De Stasio on 2017-07-07.
//  Copyright © 2017 Peter. All rights reserved.
//

import UIKit

class NewsFeed: UIViewController {

    @IBOutlet weak var labelUser: UILabel!
 
    @IBOutlet weak var labelID: UILabel!
    
    @IBOutlet weak var labelSurname: UILabel!
    
    var name: String = ""
    var id: String = ""
    var surname: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelUser.text = name
        labelID.text = id
        labelSurname.text = surname
        

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
    @IBAction func searchFriends(_ sender: Any) {
        
        let searchFriendController = storyboard?.instantiateViewController(withIdentifier: "searchFriendID") as! SearchFriend
        
        searchFriendController.idUser = Int(id)!
        
        
        navigationController?.pushViewController(searchFriendController, animated: true)
    }

    
    @IBAction func checkGov(_ sender: Any) {
        
        let checkGovController = storyboard?.instantiateViewController(withIdentifier: "checkGovViewControllerID") as! CheckGovViewController
        
        checkGovController.nameToCheck = name
        checkGovController.surnameToCheck = surname
       
        navigationController?.pushViewController(checkGovController, animated: true)
    }
}
