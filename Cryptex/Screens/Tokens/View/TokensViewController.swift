//
//  TokensViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/4/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit

class TokensViewController: BaseMenuViewController {

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
    
    private var tokensUIData:[TokensUIModel] = [.init(chainLogo: "ethereum", chain: "Ethereum", currentMCap: 23443, overalRisk: "C", tokenType: "Stablecoin", tokenPrice: 2344, totalVolume: 239483, tokenPriceChanges: .init(daily: 23, weekly: 12, monthly: 23))]
    
    private lazy var collectionView:UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: Helpers.layout(sectionSpacing: 20, height: 290))
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private lazy var dataSource:UICollectionViewDiffableDataSource<Int, TokensUIModel> = {
        let cell = UICollectionView.CellRegistration<TokenCell, TokensUIModel> { [unowned self]  cell, indexPath, itemIdentifier in
            let token = tokensUIData[indexPath.row]
            cell.configure(with: token)
        }
        
        let dataSource = UICollectionViewDiffableDataSource<Int, TokensUIModel>(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cell, for: indexPath, item: itemIdentifier)
            return cell
        }
        
        return dataSource
    }()
    
    private func reloadData(){
        var snapshoot = NSDiffableDataSourceSnapshot<Int, TokensUIModel>()
        snapshoot.appendSections([0])
        snapshoot.appendItems(tokensUIData, toSection: 0)
        dataSource.apply(snapshoot)
    }
    
    
    private func setupUI(){
        navigationItem.title = "Tokens"
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,constant: -8),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,constant: -12),
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 12)
        ])
        
    }
}

extension TokensViewController:UICollectionViewDelegate{
    
}
