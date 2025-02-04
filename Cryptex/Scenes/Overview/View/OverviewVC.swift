//
//  OverviewViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 11/29/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit

class OverviewVC: BaseSidePageVC {
    
    private let vm = OverviewVM()
    
    override func loadView() {
        super.loadView()
        setupUI()
    }
    
    override func fetch() {
        vm.fetchProtocol()
    }
    
    override func setBindings() {
        vm.state
            .sink {[weak self] state in
                guard let self else {return}
                
                switch state {
                case .idle, .loading:
                    hideError()
                    showLoading()
                case .loaded(let data):
                    hideError()
                    hideLoading()
                    switch data {
                    case .protocols(.lendingUIModel(let lending)):
                        protocolDetail.configure(with: .lendingModel(lending.detailData))
                        protocolChain.configure(with: .lendingModel(lending.statistics))
                        protocolChart.updateChart(with: .lendingModel(lending.charData))
                        protocolGeneral.configure(with: lending.statistics.type)
                        protocolChain.chainPicker.configurePicker(data: lending.statistics.selectChains)
                        protocolDetail.versionPicker.configurePicker(data: lending.statistics.selectProtocols)
                    case .protocols(.dexUIModel(let dex)):
                        protocolDetail.configure(with: .dexModel(dex.detailData))
                        protocolChain.configure(with: .dexModel(dex.statistics))
                        protocolChart.updateChart(with: .dexModel(dex.charData))
                        protocolGeneral.configure(with: dex.statistics.type)
                        protocolChain.chainPicker.configurePicker(data: dex.statistics.selectChains)
                        protocolDetail.versionPicker.configurePicker(data: dex.statistics.selectProtocols)
                    }
                    
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
    
    private lazy var protocolGeneral:ProtocolGeneral = {
        let view = ProtocolGeneral()
        return view
    }()
    
    private lazy var protocolDetail:ProtocolDetail = {
        let view = ProtocolDetail()
        view.delegate = self
        return view
    }()
    private lazy var protocolChain:ProtocolChainStatistics = {
        let view = ProtocolChainStatistics()
        view.delegate = self
        return view
    }()
    
    private lazy var protocolChart:ProtocolChart = {
        let view = ProtocolChart()
        return view
    }()

    private lazy var stack:UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 12
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var scrollView:UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alwaysBounceHorizontal = false
        view.alwaysBounceVertical = false
        return view
    }()
    
    private func setupUI(){
        navigationItem.title = "Overview"
        
        stack.addArrangedSubview(protocolGeneral)
        stack.addArrangedSubview(protocolDetail)
        stack.addArrangedSubview(protocolChain)
        stack.addArrangedSubview(protocolChart)
        
        scrollView.addSubview(stack)
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            scrollView.contentLayoutGuide.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            
            stack.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: 2),
            stack.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 14),
            stack.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -14),
            stack.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: -14)
        ])
    }
}

extension OverviewVC:PickerButtonDelegate,UIViewControllerTransitioningDelegate{
    func openPicker(for type: SheetType) {
        let pickerSheetVC = PickerSheetVC()
        pickerSheetVC.pickerType = type
        if let data = vm.getPickerData(for: type) {
            pickerSheetVC.configure(with: data)
        }
        pickerSheetVC.navigationItem.title = type.title
        let vc = AppNavigationController(rootViewController: pickerSheetVC)
        vc.modalPresentationStyle = .custom
        vc.transitioningDelegate = self
        present(vc, animated: true)
    }
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return SlideUpPresenter(presentedViewController: presented, presenting: presenting)
    }
}
