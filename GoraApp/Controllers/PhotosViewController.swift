//
//  PhotosViewController.swift
//  GoraApp
//
//  Created by Surgeont on 16.12.2021.
//

import UIKit

final class PhotosViewController: UIViewController {
    
    private let photosCollectionView = PhotosCollectionView()
    var choosenUser: User!
    private var maxPhotoId: Int!
    private var minPhotoId: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(photosCollectionView)
        setConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getPhotoRanges(choosenUserId: choosenUser.id)
        title = choosenUser.name
        loadPhotos(min: minPhotoId, max: maxPhotoId)
    }
    
    private func getPhotoRanges(choosenUserId: Int) {
        let max = 500 * choosenUserId
        let min = max - 499
        self.maxPhotoId = max-1
        self.minPhotoId =  min-1
    }
    
    // MARK: - Load Photos
    private func loadPhotos(min: Int, max: Int) {
        let urlString = URLs.photos.rawValue
        GetDataManager.shared.getPhotos(urlString: urlString) { [weak self] photos, error in
            if error == nil {
                guard let photos = photos else {return}
                var filterredPhotos: [Photo] = []
                for i in min...max {
                    let photo = photos[i]
                    filterredPhotos.append(photo)
                }
                self?.photosCollectionView.photoList = filterredPhotos
                self?.photosCollectionView.reloadData()
            } else {
                print(error!)
            }
        }
    }
}

// MARK: - Constraints
extension PhotosViewController {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            photosCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            photosCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            photosCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            photosCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}
