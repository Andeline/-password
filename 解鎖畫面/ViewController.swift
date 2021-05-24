//
//  ViewController.swift
//  解鎖畫面
//
//  Created by 蔡佳穎 on 2021/5/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var msgLabel: UILabel!
    @IBOutlet weak var msg2Label: UILabel!
    
    @IBOutlet weak var password1ImageView: UIImageView!
    @IBOutlet weak var password2ImageView: UIImageView!
    @IBOutlet weak var password3ImageView: UIImageView!
    @IBOutlet weak var password4ImageView: UIImageView!
    
    var password = ""
    let correctPassword = "0926"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func changeImage() {
        switch password.count {
        case 0:
            password1ImageView.image = UIImage(named: "0")
            password2ImageView.image = UIImage(named: "0")
            password3ImageView.image = UIImage(named: "0")
            password4ImageView.image = UIImage(named: "0")
            msgLabel.text = "Enter passcode"
            msgLabel.center = CGPoint(x: view.center.x, y: 113)
            msg2Label.text = "Enter your passcode below."
            msg2Label.center = CGPoint(x: view.center.x, y: 151)
        case 1:
            password1ImageView.image = UIImage(named: "1")
            password2ImageView.image = UIImage(named: "0")
            password3ImageView.image = UIImage(named: "0")
            password4ImageView.image = UIImage(named: "0")
        case 2:
            password1ImageView.image = UIImage(named: "1")
            password2ImageView.image = UIImage(named: "2")
            password3ImageView.image = UIImage(named: "0")
            password4ImageView.image = UIImage(named: "0")
        case 3:
            password1ImageView.image = UIImage(named: "1")
            password2ImageView.image = UIImage(named: "2")
            password3ImageView.image = UIImage(named: "3")
            password4ImageView.image = UIImage(named: "0")
        case 4:
            password1ImageView.image = UIImage(named: "1")
            password2ImageView.image = UIImage(named: "2")
            password3ImageView.image = UIImage(named: "3")
            password4ImageView.image = UIImage(named: "4")
        default:
            break
        }
    }
    
    @IBAction func enterPassword(_ sender: UIButton) {
        
        let title = sender.currentTitle
        if let title = title {
            password += sender.currentTitle!
            changeImage()
            if password == correctPassword {
                msgLabel.text = "Welcome"
                msg2Label.text = ""
            } else if password.count == 4 && password != correctPassword {
                msgLabel.text = "Incorrect passcode"
                msgLabel.center = CGPoint(x: view.center.x, y: 113)
                msgLabel.sizeToFit()
                msg2Label.text = "The passcode you entered is incorrect."
                msg2Label.center = CGPoint(x: view.center.x, y: 151)
                msg2Label.sizeToFit()
            }
        } else if sender.tag == 10 {
            password.removeLast()
            changeImage()
        }
    }
}

