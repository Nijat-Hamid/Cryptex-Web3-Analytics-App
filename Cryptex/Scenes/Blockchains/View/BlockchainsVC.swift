//
//  BlockchainsViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/4/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit
import Combine

class BlockchainsVC: BaseSidePageVC {
    
   private let vm = BlockchainVM()
   
   override func loadView() {
        super.loadView()
        setupUI()
    }
    
    override func fetch(){
        vm.fetchBlockchain()
    }
    
    override func setBindings(){
        vm.state
            .receive(on: DispatchQueue.main)
            .sink {[weak self] state in
                guard let self else {return}
                
                switch state {
                case .idle:break
                case .loading:
                    hideError()
                    showLoading()
                case .loaded:
                    hideError()
                    hideLoading()
                    reloadData()
                case .error(let error):
                    hideLoading()
                    showError(for: error)
                }
            }
            .store(in: &cancellables)
    }

    
    private var safeAreaLayoutGuide:UILayoutGuide{
        view.safeAreaLayoutGuide
    }
    
    private lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewCompositionalLayout.createVerticalListLayout(
            sectionSpacing: 6,
            height: 276
        )
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom:8, right: 0)
        return collectionView
    }()
    
    private lazy var dataSource:UICollectionViewDiffableDataSource<Int, BlockchainsUIModel> = {
        let cell = UICollectionView.CellRegistration<BlockchainCell, BlockchainsUIModel> { [unowned self]  cell, indexPath, itemIdentifier in
            let blockchain = vm.blockchainData[indexPath.row]
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
        snapshoot.appendItems(vm.blockchainData, toSection: 0)
        dataSource.apply(snapshoot)
    }
    
    private func setupUI(){
        navigationItem.title = "Blockchains"
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,constant: -12),
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 12)
        ])
    }
    
}

extension BlockchainsVC:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedBlockchain = vm.blockchainData[indexPath.row]
        let vc = BlockchainDetailVC()
        vc.navigationItem.title = selectedBlockchain.blockchainName
        vc.blockchainName = selectedBlockchain.chain
        navigationController?.pushViewController(vc, animated: true)
    }
}

