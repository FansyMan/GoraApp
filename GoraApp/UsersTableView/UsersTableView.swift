//
//  UsersTableView.swift
//  GoraApp
//
//  Created by Surgeont on 16.12.2021.
//

import UIKit

final class UsersTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var users: [User] = []
    weak var chooseUserDelegate: ChooseUserProtocol? //для передачи выбранного юзера на UsersVC
    
    init() {
        super.init(frame: .zero, style: .plain)
        delegate = self
        dataSource = self
        bounces = false
        backgroundColor = .white
        register(UsersTableViewCell.self, forCellReuseIdentifier: UsersTableViewCell.reuseIdentifier)
        translatesAutoresizingMaskIntoConstraints = false
        self.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - TableView Setups
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UsersTableViewCell.reuseIdentifier, for: indexPath) as! UsersTableViewCell
        let user = users[indexPath.row]
        cell.setupCell(user: user)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    // MARK: - Ты классный
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        chooseUserDelegate?.chooseUser(user: user)
    }
}
