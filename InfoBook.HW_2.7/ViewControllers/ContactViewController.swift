//
//  ContactViewController.swift
//  InfoBook.HW_2.7
//
//  Created by User on 28.07.2021.
//

import UIKit

class ContactViewController: UIViewController {
    
    @IBOutlet weak var phoneOutletString: UILabel!
    @IBOutlet weak var emailOutletString: UILabel!
    
    var info: Persone!

    override func viewDidLoad() {
        super.viewDidLoad()
        phoneOutletString.text = "Phone number: \(info.phoneNumber)"
        emailOutletString.text = "Email: \(info.email)"
        }
    
}
