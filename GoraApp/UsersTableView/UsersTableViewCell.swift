//
//  UsersTableViewCell.swift
//  GoraApp
//
//  Created by Surgeont on 16.12.2021.
//

import UIKit


final class UsersTableViewCell:  UITableViewCell {
    
    static let reuseIdentifier = "UsersTableViewCell"
    
    private let userName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let chevronImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init coder")
    }
    
    // MARK: - SetupCell
    func setupCell(user: User) {
        userName.text = user.name
    }
    
    // MARK: - SetupViews
    private func setupViews() {
        self.backgroundColor = .white
        self.selectionStyle = .none
        
        self.addSubview(userName)
        self.addSubview(chevronImage)
    }
}

// MARK: - Constraints
extension UsersTableViewCell {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            userName.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            userName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            chevronImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            chevronImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            chevronImage.widthAnchor.constraint(equalToConstant: 30),
            chevronImage.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
