//
//  UserDetailsViewController.swift
//  TestApp
//
//  Created by Admin on 10/9/23.
//

import UIKit

class UserDetailsViewController: UIViewController {
    
    public var user: User?
    @IBOutlet var idLabel: UILabel!
    @IBOutlet var firstNameLabel: UILabel!
    @IBOutlet var lastNameLabel: UILabel!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var birthdayLabel: UILabel!
    @IBOutlet var twitterHandleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewContent()
        
    }
    
    private func setupViewContent() {
        idLabel.text = "\(user?.id ?? 0)"
        firstNameLabel.text = user?.firstName ?? ""
        lastNameLabel.text = user?.lastName ?? ""
        userNameLabel.text = user?.username ?? ""
        emailLabel.text = user?.email ?? ""
        genderLabel.text = user?.gender ?? ""
        birthdayLabel.text = user?.birthday ?? ""
        twitterHandleLabel.text = user?.twitterHandle ?? ""
    }

}
