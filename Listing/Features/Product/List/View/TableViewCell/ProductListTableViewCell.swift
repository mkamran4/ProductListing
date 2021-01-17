//
//  ProductListTableViewCell.swift
//  Listing
//
//  Created by Mohammad on 16/01/2021.
//

import UIKit

class ProductListTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet private var imageScrollView: ImageScrollView!
    @IBOutlet private var priceLabel: UILabel!
    @IBOutlet private var nameLabel: UILabel!
    
    var viewModel: ProductViewModel? {
        didSet {
            self.priceLabel.text = self.viewModel?.price
            self.nameLabel.text = self.viewModel?.name
            self.imageScrollView.viewModel = self.viewModel?.thumbnailScrollViewModel
        }
    }
}
