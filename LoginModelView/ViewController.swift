//
//  ViewController.swift
//  LoginModelView
//
//  Created by Habib Durodola on 2020-08-03.
//  Copyright © 2020 DOH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var passWordTxt: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    var userVM : UserVM?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        userVM = UserVM(userNameTxt.text ?? ""  , password: passWordTxt.text ?? "")
    }

    @IBAction func login(_ sender: UIButton) {

        guard let modelView = userVM else {
            print("Model can not be nill")
            return
        }

        modelView.validateInput(userName: modelView.userName, password: modelView.password)
        modelView.loginCompletionHandler { (status, message) in
            if status {
                print("this is success \(message)")
            }else {
                print("Not successful \(message)")
            }
        }
        
    }

}

