//
//  ImageScrollView.swift
//  Listing
//
//  Created by Mohammad on 16/01/2021.
//

import UIKit

class ImageScrollView: UIView {
    
    // MARK: - View Properties
    private lazy var collectionView: UICollectionView = { [unowned self] in
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        let collection = UICollectionView(frame: self.bounds, collectionViewLayout: flowLayout)
        collection.dataSource = self
        collection.delegate = self
        
        collection.backgroundColor = .white
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    
    var viewModel: ImageScrollViewModel? {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    // MARK: - View's Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.registerCell(ImageCollectionViewCell.self)
        self.addSubview(collectionView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.collectionView.frame = self.bounds
    }
}

// MARK: - View UICollectionViewDataSource
extension ImageScrollView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.viewModel?.numberOfRows ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ImageCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.imageUrl = self.viewModel?.imageUrl(at: indexPath.row)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ImageScrollView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        collectionView.frame.size
    }
}
