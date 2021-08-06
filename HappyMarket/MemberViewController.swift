//
//  LoginViewController.swift
//  HappyMarket
//
//  Created by Pratchaya Yordming on 30/7/2564 BE.
//

import UIKit
#if canImport(WidgetKit)
import WidgetKit
#endif

class MemberViewController: UIViewController {

    @IBOutlet private weak var status: UILabel!
    @IBOutlet private weak var loginButton: UIButton!
    
    private let userDefault = UserDefaults(suiteName: "group.com.hpnz.HappyMarket")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if userDefault.bool(forKey: "logedIn") {
            loginButton.setTitle("Log Out", for: .normal)
            status.text = "Status: Loged In"
            status.textColor = .green
        }else {
            loginButton.setTitle("Log In", for: .normal)
            status.text = "Status: Loged Out"
            status.textColor = .red
        }
    }

    @IBAction func loginStatus(_ sender: Any) {
        
        if userDefault.bool(forKey: "logedIn") {
            userDefault.set(false, forKey: "logedIn")
            loginButton.setTitle("Log In", for: .normal)
            status.text = "Status: Loged Out"
            status.textColor = .red
        }else {
            userDefault.set(true, forKey: "logedIn")
            loginButton.setTitle("Log Out", for: .normal)
            status.text = "Status: Loged In"
            status.textColor = .green
        }
        if #available(iOS 14.0, *) {
            WidgetCenter.shared.reloadAllTimelines()
        } else {
            // Fallback on earlier versions
        }
        navigationController?.popViewController(animated: true)
    }

}
