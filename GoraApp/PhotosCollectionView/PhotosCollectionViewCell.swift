//
//  PhotosCollectionViewCell.swift
//  GoraApp
//
//  Created by Surgeont on 16.12.2021.
//

import UIKit

final class PhotosCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "PhotosCollectionViewCell"
    
    private let photoImage: UIImageView = {
       let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let photoTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.hidesWhenStopped = true
        spinner.color = .blue
        spinner.style = .large
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(photoImage)
        self.addSubview(photoTitle)
        self.addSubview(spinner)
        spinner.startAnimating()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoTitle.text = nil
        photoImage.image = nil
    }
    
    // MARK: - SetupCell
    func setupCell(photo: Photo) {
        self.photoTitle.text = photo.title
        let urlForLoading = URL(string: photo.url)!
        LoadAndCashImages.shared.itemloadImage(url: urlForLoading) { image in
            self.photoImage.image = image
            self.spinner.stopAnimating()
        }
        self.backgroundColor = .systemGray6
        self.layer.cornerRadius = 10        // add some shadows
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 10, height: 10)
        self.layer.shadowRadius = 20
        self.layer.shadowOpacity = 0.8
    }
}

// MARK: - Constraints
extension PhotosCollectionViewCell {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            photoImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            photoImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            photoImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            photoImage.heightAnchor.constraint(equalToConstant: self.frame.width)
        ])
        
        NSLayoutConstraint.activate([
            photoTitle.topAnchor.constraint(equalTo: photoImage.bottomAnchor, constant: 5),
            photoTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            photoTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            photoTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
