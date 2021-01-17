//
//  ProductListViewController.swift
//  Listing
//
//  Created by Mohammad on 16/01/2021.
//

import UIKit

class ProductListViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private(set) var tableView: UITableView!
    
    // MARK: - Initialization
    init(_ viewModel: ProductListViewModel) {
        super.init(nibName: "ProductListViewController", bundle: .main)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View's Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewModel?.fetchProducts()
        self.tableView.registerCell(ProductListTableViewCell.self)
    }
}

extension ProductListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel?.numberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ProductListTableViewCell = tableView.dequeueReusableCell()
        cell.viewModel = self.viewModel?.productViewModel(at: indexPath.row)
        return cell
    }
}

extension ProductListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let productViewModel = self.viewModel?.productViewModel(at: indexPath.row) else { return }
        let detailViewModel = ProductDetailViewModel(productViewModel)
        let viewController = ProductDetailViewController(detailViewModel)
        self.present(viewController, animated: true, completion: nil)
    }
}

extension ProductListViewController: Bindable {
    
    func bind(_ viewModel: ProductListViewModel) {
        viewModel.didLoadProduct.bind { [weak self] _ in
            self?.tableView.reloadData()
        }
    }
}
