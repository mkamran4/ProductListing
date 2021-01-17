//
//  LabelTableViewCell.swift
//  Listing
//
//  Created by Mohammad on 16/01/2021.
//

import UIKit

class LabelTableViewCell: UITableViewCell {

    // MARK: - IBOutlet
    @IBOutlet private var detailLabel: UILabel!
    
    // MARK: - Detail
    var detail: String? {
        didSet {
            self.detailLabel.text = self.detail
        }
    }
}
