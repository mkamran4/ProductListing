//
//  ImageCollectionViewCell.swift
//  Listing
//
//  Created by Mohammad on 16/01/2021.
//

import UIKit
import ImageCache

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet private var productImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.productImageView.layer.cornerRadius = 8
    }

    var imageUrl: URL? {
        didSet {
            guard let url = self.imageUrl else { return }
            ImageCache.shared.load(url: url as NSURL) { [weak self] image in
                self?.productImageView.image = image
            }
        }
    }
}
