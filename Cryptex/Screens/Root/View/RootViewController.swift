//
//  ViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 11/27/24.
//

import UIKit
import Combine

class RootViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.delegate = self
        subsribeToProtocolID()
    }
    
    override func loadView() {
        super.loadView()
        setupUI()
    }
    
    private let viewModel = RootViewModel()
    private var itemViews: [RootItemView] = []
    private var safeAreaLayoutGuide:UILayoutGuide{
        view.safeAreaLayoutGuide
    }
    private var cancellables = Set<AnyCancellable>()
    private var selectedProtocolID: String? {
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
        if let navigationController = navigationController {
            let vc = OverviewViewController()
            navigationController.pushViewController(vc, animated: true)
        } else {
            print("NavigationController is nil")
        }
    }
    
    private func setupUI(){
        view.backgroundColor = .background
        view.addSubview(stackContainer)
        navigationItem.title = "Choose Protocol"
        
        viewModel.rootData.forEach { item in
            let view = RootItemView()
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
              let isSelected = itemView.protocolID == selectedProtocolID
              itemView.setSelected(isSelected)
          }
      }
    
    private func subsribeToProtocolID(){
        AppState.shared.protocolIDPublisher.sink { [weak self] value in
            guard let self else {return}
            if value.isEmpty {
                nextButton.isEnabled = false
            }else{
                nextButton.isEnabled = true
            }
            
        }.store(in: &cancellables)
    }
}

extension RootViewController:RootItemViewDelegate{
    func didSelectProtocol(withID id: String) {
        selectedProtocolID = id
        AppState.shared.setProtocolID(with: id)
    }
}

extension RootViewController:UINavigationControllerDelegate{
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if viewController == self {
            navigationController.interactivePopGestureRecognizer?.isEnabled = false
            navigationItem.hidesBackButton = true
        }
    }
}
