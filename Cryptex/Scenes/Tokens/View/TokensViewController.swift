//
//  TokensViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/4/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit
import Combine

class TokensViewController: BaseSidePageViewController {

    private let viewModel = TokensViewModel()
    private var cancellables = Set<AnyCancellable>()
    private var tokensUIData:[TokensUIModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }
    
    override func loadView() {
        super.loadView()
        setupUI()
    }

    private func setupBindings(){
        showLoading()
        viewModel.fetchTokens()
        viewModel.data
            .receive(on: DispatchQueue.main)
            .sink {[weak self] response in
                guard let self else {return}
                tokensUIData = response
                reloadData()
                hideLoading()
            }.store(in: &cancellables)
    }
    
    private var safeAreaLayoutGuide:UILayoutGuide{
        view.safeAreaLayoutGuide
    }
    
    
    private lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewCompositionalLayout.createVerticalListLayout(
            sectionSpacing: 6,
            height: 294
        )
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom:8, right: 0)
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
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,constant: -12),
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 12)
        ])
        
    }
}

extension TokensViewController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = TokensDetailViewController()
        vc.navigationItem.title = tokensUIData[indexPath.row].tokenName
        vc.protocolName = tokensUIData[indexPath.row].protocolName
        vc.tokenChain = tokensUIData[indexPath.row].chain.lowercased()
        vc.tokenContract = tokensUIData[indexPath.row].tokenContract
        navigationController?.pushViewController(vc, animated: true)
    }
}
