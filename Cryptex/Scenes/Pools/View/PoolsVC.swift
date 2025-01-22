//
//  PoolsViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/4/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit
import Combine

class PoolsVC: BaseSidePageVC {

    private let vm = PoolsVM()
    private var cancellables = Set<AnyCancellable>()
    private var poolsUIData:PoolsCombinedUIModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        setupUI()
    }
    
    override func fetch(){
        vm.fetchPools()
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
                case .loaded(let data):
                    hideError()
                    hideLoading()
                    
                    switch data {
                    case .lendingUIModel(let lending):
                        poolsUIData = .lendingUIModel(lending)
                    case .dexUIModel(let dex):
                        poolsUIData = .dexUIModel(dex)
                    }
                    
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
            height: 294
        )
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout:layout)
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom:8, right: 0)
        return collectionView
    }()
    
    private lazy var dataSource:UICollectionViewDiffableDataSource<Int, PoolsCombinedUIModel> = {
        let cell = UICollectionView.CellRegistration<PoolCell, PoolsCombinedUIModel> { [unowned self]  cell, indexPath, itemIdentifier in
            
            switch poolsUIData {
            case .lendingUIModel(let lending):
                let pool = lending[indexPath.row]
                let combinedModel = PoolsCombinedSingleUIModel.lendingUIModel(pool)
                cell.configure(with: combinedModel)
            case .dexUIModel(let dex):
                let pool = dex[indexPath.row]
                let combinedModel = PoolsCombinedSingleUIModel.dexUIModel(pool)
                cell.configure(with: combinedModel)
            default:
                break
            }
        }
        
        let dataSource = UICollectionViewDiffableDataSource<Int, PoolsCombinedUIModel>(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cell, for: indexPath, item: itemIdentifier)
            return cell
        }
        
        return dataSource
    }()
    
    private func reloadData(){
        var snapshoot = NSDiffableDataSourceSnapshot<Int, PoolsCombinedUIModel>()
        snapshoot.appendSections([0])
        
        switch poolsUIData {
        case .lendingUIModel(let lending):
            let items = lending.map { PoolsCombinedUIModel.lendingUIModel([$0]) }
            snapshoot.appendItems(items, toSection: 0)
        case .dexUIModel(let dex):
            let items = dex.map { PoolsCombinedUIModel.dexUIModel([$0]) }
            snapshoot.appendItems(items, toSection: 0)
        default:
            break
        }
        
        dataSource.apply(snapshoot)
    }
    
    private func setupUI (){
        navigationItem.title = "Pools"
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,constant: -12),
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 12)
        ])
        
    }
}

extension PoolsVC:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = PoolsDetailVC()
        
        switch poolsUIData {
        case .lendingUIModel(let lending):
            let lendingModel = lending[indexPath.row]
            vc.navigationItem.title = lendingModel.symbol
            vc.protocolName = lendingModel.project
            vc.poolChain = lendingModel.chain
            vc.poolContract = lendingModel.poolContract
        case .dexUIModel(let dex):
            let dexModel = dex[indexPath.row]
            vc.navigationItem.title = dexModel.poolName
            vc.protocolName = dexModel.project
            vc.poolChain = dexModel.chain
            vc.poolContract = dexModel.poolContract
        default:
            break
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
