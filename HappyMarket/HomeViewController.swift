//
//  ViewController.swift
//  HappyMarket
//
//  Created by Pratchaya Yordming on 30/7/2564 BE.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleDeeplink(notification:)),
                                               name: Notification.Name(rawValue: "performDeeplink"), object: nil)
    }

    @objc func handleDeeplink(notification: NSNotification)  {
        
        guard let page = notification.userInfo?["page"] as? String else {
            return
        }
        switch page {
        case "logIn":
            performSegue(withIdentifier: "member", sender: nil)
        case "member":
            performSegue(withIdentifier: "member", sender: nil)
        case "productDetail":
            performSegue(withIdentifier: "productDetail", sender: nil)
        case "deliveryStatus":
            performSegue(withIdentifier: "delivery", sender: nil)
        case "notifications":
            performSegue(withIdentifier: "notifications", sender: nil)
        case "promotions":
            performSegue(withIdentifier: "promotions", sender: nil)
        default:
            break
        }
    }
    
    @IBAction func openMember(_ sender: Any) {
        performSegue(withIdentifier: "member", sender: nil)
    }
    
    @IBAction func openProductDetail(_ sender: Any) {
        performSegue(withIdentifier: "productDetail", sender: nil)
    }
    
    @IBAction func openDelivery(_ sender: Any) {
        performSegue(withIdentifier: "delivery", sender: nil)
    }
    
    @IBAction func openNotifications(_ sender: Any) {
        performSegue(withIdentifier: "notifications", sender: nil)
    }
    
    @IBAction func openPromotions(_ sender: Any) {
        performSegue(withIdentifier: "promotions", sender: nil)
    }
}

