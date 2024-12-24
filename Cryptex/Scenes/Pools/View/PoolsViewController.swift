//
//  PoolsViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/4/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit

class PoolsViewController: BaseSidePageViewController {

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
    
    private var poolsUIData:[PoolsUIModels] = [.dexUIModel(.init(id: "273", symbol: "Weth", chain: "Ethereum", apyMean30D: 2323.23, overalRisk: "B", poolLogo: [""], poolPrice: 23, protocolChainLogo: "", protocolFullName: "", protocolLogo: "", protocolType: "", totalBorrowedTokenUSD: 2332, totalLiqiudityUSD: 23, tvlUSD: 23, utilizationRate: "")),.lendingUIModel(.init(id: "93je", symbol: "", chain: "", apyMean30D: 2323, overalRisk: "", poolLogo: [""], poolPrice: 2323, protocolChainLogo: "", protocolFullName: "", protocolLogo: "", protocolType: "", totalBorrowedTokenUSD: 233, totalLiqiudityUSD: 23, tvlUSD: 23, utilizationRate: "")),.lendingUIModel(.init(id: "dj203", symbol: "", chain: "", apyMean30D: 2323, overalRisk: "", poolLogo: [""], poolPrice: 2323, protocolChainLogo: "", protocolFullName: "", protocolLogo: "", protocolType: "", totalBorrowedTokenUSD: 233, totalLiqiudityUSD: 23, tvlUSD: 23, utilizationRate: ""))]
    
    
    private lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewCompositionalLayout.createVerticalListLayout(
            sectionSpacing: 16,
            height: 312
        )
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout:layout)
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var dataSource:UICollectionViewDiffableDataSource<Int, PoolsUIModels> = {
        let cell = UICollectionView.CellRegistration<PoolCell, PoolsUIModels> { [unowned self]  cell, indexPath, itemIdentifier in
            let pool = poolsUIData[indexPath.row]
            cell.configure(with: pool)
        }
        
        let dataSource = UICollectionViewDiffableDataSource<Int, PoolsUIModels>(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cell, for: indexPath, item: itemIdentifier)
            return cell
        }
        
        return dataSource
    }()
    
    private func reloadData(){
        var snapshoot = NSDiffableDataSourceSnapshot<Int, PoolsUIModels>()
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
