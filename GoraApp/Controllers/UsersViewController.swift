//
//  UsersViewController.swift
//  GoraApp
//
//  Created by Surgeont on 16.12.2021.
//

import UIKit

final class UsersViewController: UIViewController, ChooseUserProtocol {
    
    private let usersTableView = UsersTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
        loadUsers()
    }
    
    private func setupView() {
        title = "Users"
        view.addSubview(usersTableView)
    }
    
    // MARK: - Load Users
    private func loadUsers() {
        let urlString = URLs.users.rawValue
        GetDataManager.shared.getUsers(urlString: urlString) { [weak self] users, error in
            if error == nil {
                guard let users = users else {return}
                self?.usersTableView.users = users
                self?.usersTableView.chooseUserDelegate = self
                self?.usersTableView.reloadData()
            } else {
                print(error!)
            }
        }
    }
    
    func chooseUser(user: User) {
        let destinationVC = PhotosViewController()
        destinationVC.choosenUser = user
        navigationController?.pushViewController(destinationVC, animated: true)
    }
}

// MARK: - Constraints
extension UsersViewController {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            usersTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            usersTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            usersTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            usersTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}
