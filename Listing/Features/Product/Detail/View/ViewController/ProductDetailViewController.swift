//
//  ProductDetailViewController.swift
//  Listing
//
//  Created by Mohammad on 16/01/2021.
//

import UIKit

class ProductDetailViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private var tableView: UITableView!
    
    // MARK: - Initialization
    init(_ viewModel: ProductDetailViewModel) {
        super.init(nibName: "ProductDetailViewController", bundle: .main)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.registerCell(DetailImageTableViewCell.self)
        self.tableView.registerCell(LabelTableViewCell.self)
    }
}

extension ProductDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel?.numberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let type = self.viewModel?.detail(at: indexPath.row) {
            switch type {
            case .header(let viewModel):
                let cell: DetailImageTableViewCell = tableView.dequeueReusableCell()
                cell.viewModel = viewModel
                return cell
            case .text(let value):
                let cell: LabelTableViewCell = tableView.dequeueReusableCell()
                cell.detail = value
                return cell
            }
        }
        return .init()
    }
}

extension ProductDetailViewController: Bindable {
    
    func bind(_ viewModel: ProductDetailViewModel) {
        // Binding here
    }
}
