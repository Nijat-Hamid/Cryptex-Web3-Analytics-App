//
//  ViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 11/27/24.
//

import UIKit
import Combine

class DeFiViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButtonAccess()
    }
    
    override func loadView() {
        super.loadView()
        setupUI()
    }
    
    private let viewModel = DeFiViewModel()
    private var itemViews: [DeFiItemViewController] = []
    private var safeAreaLayoutGuide:UILayoutGuide{
        view.safeAreaLayoutGuide
    }
    private var cancellables = Set<AnyCancellable>()
    private var selectedProtocol: ProtocolTypes? {
           didSet { updateSelection() }
       }
    
    
    private lazy var stackContainer:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 20
        stackView.distribution = .fill
        stackView.alignment = .center
        return stackView
    }()
    
    
    private lazy var nextButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: .normal)
        button.setTitle("Choose First", for: .disabled)
        button.setTitleColor(.foreground, for: .normal)
        button.setTitleColor(.muted, for: .disabled)
        button.backgroundColor = .cardBackgroundDark
        button.titleLabel?.font = UIFont(name: "Geist-semibold", size: 14)
        button.layer.cornerRadius = 10
        
        button.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
        
        return button
    }()
    
    @objc private func nextButtonAction(_ sender: UIButton) {
            ContainerState.shared.setPage(to: .main)
    }
    
    private func setupUI(){
        view.addSubview(stackContainer)
        navigationItem.title = "Choose Protocol"
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        navigationItem.hidesBackButton = true
        viewModel.rootData.forEach { item in
            let view = DeFiItemViewController()
            view.configure(with: item)
            view.delegate = self
            itemViews.append(view)
            stackContainer.addArrangedSubview(view)
        }
        
        stackContainer.addArrangedSubview(nextButton)
        
        NSLayoutConstraint.activate([
            stackContainer.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -12),
            stackContainer.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 12),
            stackContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            nextButton.trailingAnchor.constraint(lessThanOrEqualTo: stackContainer.trailingAnchor,constant: -100),
            nextButton.leadingAnchor.constraint(lessThanOrEqualTo: stackContainer.leadingAnchor,constant: 100),
            nextButton.bottomAnchor.constraint(equalTo: stackContainer.bottomAnchor)
           
        ])
        
    }
    
    private func updateSelection() {
          itemViews.forEach { itemView in
              let isSelected = itemView.selectedProtocol == selectedProtocol
              itemView.setSelected(isSelected)
          }
      }
    
    private func nextButtonAccess(){
        AppState.shared.selectedProtocolPublisher.sink { [weak self] value in
            guard let self else {return}
            if value.id.isEmpty {
                nextButton.isEnabled = false
            }else{
                nextButton.isEnabled = true
            }
            
        }.store(in: &cancellables)
    }
}

extension DeFiViewController:DeFiItemViewDelegate{
    func didSelectProtocol(withProtocol protocolType: ProtocolTypes) {
        selectedProtocol = protocolType
        AppState.shared.setProtocolID(with: protocolType)
    }
}



