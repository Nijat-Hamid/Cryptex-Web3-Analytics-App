//
//  PoolsViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/4/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit

class PoolsViewController: BaseMenuViewController {

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
    
    private var poolsUIData:[PoolsUIModel] = [.init(id: "6570174abe00fb8678eb5008", symbol: "WSTETH", chain: "ethereum", apyMean30D: 0.47477, overalRisk: "C", poolLogo: ["wsteth.svg"], poolPrice: 3639.64, protocolChainLogo: "ethereum", protocolFullName: "AAVE V3", protocolLogo: "aave", protocolType: "Lending", totalBorrowedTokenUSD: 20663069.520870883, totalLiqiudityUSD: 3500273612.6757236, tvlUSD: 3472178808, utilizationRate: "21.35")]
    
    
    private lazy var collectionView:UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: Helpers.layout(sectionSpacing: 20, height: 312))
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private lazy var dataSource:UICollectionViewDiffableDataSource<Int, PoolsUIModel> = {
        let cell = UICollectionView.CellRegistration<PoolCell, PoolsUIModel> { [unowned self]  cell, indexPath, itemIdentifier in
            let pool = poolsUIData[indexPath.row]
            cell.configure(with: pool)
        }
        
        let dataSource = UICollectionViewDiffableDataSource<Int, PoolsUIModel>(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cell, for: indexPath, item: itemIdentifier)
            return cell
        }
        
        return dataSource
    }()
    
    private func reloadData(){
        var snapshoot = NSDiffableDataSourceSnapshot<Int, PoolsUIModel>()
        snapshoot.appendSections([0])
        snapshoot.appendItems(poolsUIData, toSection: 0)
        dataSource.apply(snapshoot)
    }
    
    private func setupUI (){
        navigationItem.title = "Pools"
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,constant: -8),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,constant: -12),
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 12)
        ])
        
    }
}

extension PoolsViewController:UICollectionViewDelegate{
    
}
