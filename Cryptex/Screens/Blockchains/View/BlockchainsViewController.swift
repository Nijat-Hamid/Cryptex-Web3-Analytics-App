//
//  BlockchainsViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/4/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit

class BlockchainsViewController: BaseMenuViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadData()
    }
    
    override func loadView() {
        super.loadView()
        setupUI()
    }
    
    private var safeAreaLayoutGuide:UILayoutGuide{
        view.safeAreaLayoutGuide
    }
    
    private var blockchainsUIData:[BlockchainsUIModel] = [.init(id: "2323", blockchainName: "Ethereum", chainTvl: 238232, marketShare: 273273, overalRisk: "A", tvlChanges: .init(daily: 12, weekly: 83, monthly: 283))]
    
    
    private lazy var collectionView:UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: Helpers.layout(sectionSpacing: 20, height: 276))
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
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
    
}
