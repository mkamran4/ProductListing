//
//  DetailImageTableViewCell.swift
//  Listing
//
//  Created by Mohammad on 16/01/2021.
//

import UIKit
import ImageCache

class DetailImageTableViewCell: UITableViewCell {

    @IBOutlet private var imageScrollView: ImageScrollView!
    
    var viewModel: ImageScrollViewModel? {
        didSet {
            self.imageScrollView.viewModel = self.viewModel
        }
    }
}
