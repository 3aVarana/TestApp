//
//  ViewController.swift
//  TestApp
//
//  Created by Admin on 10/9/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    private let userLoader = UserLoader(url: "https://jserver-api.herokuapp.com/users")
    private var users = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
        loadUsers()
        title = "Users"
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func loadUsers() {
        userLoader.loadUsers { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let users):
                self.setUsers(users)
            case .failure(_):
                print("Failure")
            }
        }
    }
    
    private func setUsers(_ newUsers: [User]) {
        users = newUsers
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = users[indexPath.row].getFullname()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showUserDetailView(for: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] _, _, completion in
            guard let self = self else { return }
            self.deleteUser(for: indexPath)
            completion(true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
}

extension ViewController {
    private func showUserDetailView(for index: Int) {
        let vc = UserDetailsViewController()
        vc.user = users[index]
        vc.userLoader = userLoader
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func deleteUser(for indexPath: IndexPath) {
        users.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .left)
    }
}
