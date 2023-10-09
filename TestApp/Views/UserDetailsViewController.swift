//
//  UserDetailsViewController.swift
//  TestApp
//
//  Created by Admin on 10/9/23.
//

import UIKit

class UserDetailsViewController: UIViewController {
    
    public var user: User?
    public var userLoader: UserLoader!
    
    @IBOutlet var idLabel: UILabel!
    @IBOutlet var firstNameLabel: UILabel!
    @IBOutlet var lastNameLabel: UILabel!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var birthdayLabel: UILabel!
    @IBOutlet var twitterHandleLabel: UILabel!
    
    @IBOutlet var userPicture: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewContent()
        loadUserPicture()
        title = user?.getFullname() ?? "User Details"
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
    
    private func loadUserPicture() {
        userLoader.loadUsersPicture(from: user?.pictureURL ?? "") { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.decodeUserPicture(from: data)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    private func decodeUserPicture(from data: Data) {
        let image = UIImage(data: data)
        DispatchQueue.main.async {
            self.userPicture.image = image
        }
    }

}
