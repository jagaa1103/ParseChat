//
//  ViewController.swift
//  ParseChat
//
//  Created by Enkhjargal Gansukh on 8/9/15.
//  Copyright (c) 2015 Enkhjargal Gansukh. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {
    
    let loginService = LoginService()
    
    @IBOutlet weak var insertField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if(loginService.checkLogin() == true){
            
        }else{
            let loginView:LoginView = self.storyboard!.instantiateViewControllerWithIdentifier("LoginView") as! LoginView
            self.presentViewController(loginView, animated: true, completion: nil)
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

