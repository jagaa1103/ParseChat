//
//  ViewController.swift
//  ParseChat
//
//  Created by Enkhjargal Gansukh on 8/9/15.
//  Copyright (c) 2015 Enkhjargal Gansukh. All rights reserved.
//

import UIKit
import Parse

class MainView: UIViewController {
    
    
    @IBOutlet weak var insertField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var requestParams = ["fields": "id, email, first_name, last_name"]
        let userDetails = FBSDKGraphRequest(graphPath: "me", parameters: requestParams)
        userDetails.startWithCompletionHandler{
            (connection, result, error) ->
            Void in
            if(error != nil){
                println(error.localizedDescription)
                return
            }
            if(result != nil){
                println(result)
                let id = result["id"] as! String
                let email = result["email"] as! String
                let first_name = result["first_name"] as! String
                let last_name = result["last_name"] as! String
                
                let userObj: PFUser = PFUser.currentUser()!
                if(first_name != ""){
                    userObj.setObject(first_name, forKey: "first_name")
                }
                if(last_name != ""){
                    userObj.setObject(last_name, forKey: "last_name")
                }
                if(email != ""){
                    userObj.setObject(email, forKey: "email")
                }
                
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)){
                    let profileImgUrl = NSURL(string: "http://graph.facebook.com/\(id)/picture?type=large")
                    let profileImg = NSData(contentsOfURL: profileImgUrl!)
                    if(profileImg != nil){
                        let profileImgObj = PFFile(data: profileImg!)
                        userObj.setObject(profileImgObj, forKey: "profile_img")
                    }
                    userObj.saveInBackground()
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    @IBAction func signOutClicked(sender: AnyObject) {
        PFUser.logOutInBackgroundWithBlock{(error:NSError?) ->
            Void in
            if(error == nil){
                let loginView:LoginView = self.storyboard!.instantiateViewControllerWithIdentifier("LoginView") as! LoginView
                self.presentViewController(loginView, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func insertBtnClicked(sender: AnyObject) {
        if(insertField.text != ""){
            var parseObj = PFObject(className:"chats")
            parseObj["name"] = insertField.text
            parseObj.saveInBackgroundWithBlock {
                (success: Bool, error: NSError?) -> Void in
                if (success) {
                    // The object has been saved.
                    self.insertField.text = ""
                    println("Object is saved")
                } else {
                    // There was a problem, check error.description
                    println("Object is not saved")
                }
            }
        }else{
            println("Please insert text")
        }
    }
    

}

