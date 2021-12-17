//
//  PhotosCollectionView.swift
//  GoraApp
//
//  Created by Surgeont on 16.12.2021.
//

import UIKit

final class PhotosCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var photoList: [Photo] = []
    
    init() {
        let layout = UICollectionViewFlowLayout()
        super.init(frame: .zero, collectionViewLayout: layout)
        delegate = self
        dataSource = self
        register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.reuseIdentifier)
        showsHorizontalScrollIndicator = false
        layout.minimumLineSpacing = 20
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - CollectionView Setups
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.reuseIdentifier, for: indexPath) as! PhotosCollectionViewCell
        let photo = photoList[indexPath.row]
        cell.setupCell(photo: photo)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.width+50)
    }
}
