//
//  BlockchainsViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/4/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit
import Combine

class BlockchainsViewController: BaseSidePageViewController {
    
    private let viewModel = BlockchainViewModel()
    private var cancellables = Set<AnyCancellable>()
    private var blockchainsUIData:[BlockchainsUIModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }
    
    override func loadView() {
        super.loadView()
        setupUI()
    }
    
    private func setupBindings(){
        progress.startAnimating()
        viewModel.fetchBlockchain()
        viewModel.data
            .receive(on: DispatchQueue.main)
            .sink {[weak self] response in
                guard let self else {return}
                blockchainsUIData = response
                reloadData()
                progress.stopAnimating()
            }.store(in: &cancellables)
}

    
    private var safeAreaLayoutGuide:UILayoutGuide{
        view.safeAreaLayoutGuide
    }
    
    private lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewCompositionalLayout.createVerticalListLayout(
            sectionSpacing: 6,
            height: 290
        )
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var dataSource:UICollectionViewDiffableDataSource<Int, BlockchainsUIModel> = {
        let cell = UICollectionView.CellRegistration<BlockchainCell, BlockchainsUIModel> { [unowned self]  cell, indexPath, itemIdentifier in
            let blockchain = blockchainsUIData[indexPath.row]
            cell.configure(with: blockchain)
        }
        
        let dataSource = UICollectionViewDiffableDataSource<Int, BlockchainsUIModel>(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cell, for: indexPath, item: itemIdentifier)
            return cell
        }
        
        return dataSource
    }()
    
    private func reloadData(){
        var snapshoot = NSDiffableDataSourceSnapshot<Int, BlockchainsUIModel>()
        snapshoot.appendSections([0])
        snapshoot.appendItems(blockchainsUIData, toSection: 0)
        dataSource.apply(snapshoot)
    }
    
    private func setupUI(){
        navigationItem.title = "Blockchains"
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,constant: -8),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,constant: -12),
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 12)
        ])
    }
    
}

extension BlockchainsViewController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = BlockchainDetailViewController()
        vc.navigationItem.title = "Details"
        navigationController?.pushViewController(vc, animated: true)
    }
}

