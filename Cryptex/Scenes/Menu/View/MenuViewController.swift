//
//  MenuViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/3/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        setupUI()
    }
    
    private var safeAreaLayoutGuide:UILayoutGuide{
        view.safeAreaLayoutGuide
    }
    private let viewModel = MenuViewModel()
    
    private lazy var logoStack:UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            {
                let image = UIImageView(image: UIImage(named: "launch"))
                image.translatesAutoresizingMaskIntoConstraints = false
                image.contentMode = .scaleAspectFit
                NSLayoutConstraint.activate([
                    image.widthAnchor.constraint(equalToConstant: 44),
                    image.heightAnchor.constraint(equalToConstant: 42)
                            ])
                return image
            }(),
            {
                let label = UILabel()
                label.numberOfLines = 1
                label.textAlignment = .left
                label.font = UIFont(name: "Geist-bold", size: 20)
                label.textColor = .foreground
                label.text = "Cryptex"
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()
        ])
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 4
        stack.distribution = .fill
        stack.alignment = .center
        
        return stack
    }()
    
    private lazy var protocolInfoContainer: UIView = {
        let container = UIView()
        container.layer.borderWidth = 1.2
        container.layer.borderColor = UIColor.border.cgColor
        container.layer.cornerRadius = 10
        container.translatesAutoresizingMaskIntoConstraints = false
        container.layoutMargins = UIEdgeInsets(top: 6, left: 8, bottom: 6, right: 8)
        
        container.addSubview(protocolInfoStack)
        NSLayoutConstraint.activate([
            protocolInfoStack.leadingAnchor.constraint(equalTo: container.layoutMarginsGuide.leadingAnchor),
            protocolInfoStack.trailingAnchor.constraint(equalTo: container.layoutMarginsGuide.trailingAnchor),
            protocolInfoStack.topAnchor.constraint(equalTo: container.layoutMarginsGuide.topAnchor),
            protocolInfoStack.bottomAnchor.constraint(equalTo: container.layoutMarginsGuide.bottomAnchor)
        ])
        
        return container
    }()

    private lazy var protocolInfoStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            {
                let image = UIImageView(image: UIImage(named: "aaveLogo"))
                image.translatesAutoresizingMaskIntoConstraints = false
                image.contentMode = .scaleAspectFit
                NSLayoutConstraint.activate([
                    image.widthAnchor.constraint(equalToConstant: 28),
                    image.heightAnchor.constraint(equalToConstant: 28)
                ])
                return image
            }(),
            {
                let label = UILabel()
                label.numberOfLines = 1
                label.textAlignment = .left
                label.font = UIFont(name: "Geist-bold", size: 16)
                label.textColor = .foreground
                label.text = "Cryptex"
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()
        ])
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 8
        stack.distribution = .fillProportionally
        stack.alignment = .center
        
        return stack
    }()

    private lazy var linkStack:UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 6
        stack.distribution = .fillProportionally
        stack.alignment = .top
        return stack
    }()
    
    private lazy var horizontalLine: UIView = {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = .border
        return line
    }()
    
    private lazy var socialStack:UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 6
        stack.distribution = .fillEqually
        stack.alignment = .center
        return stack
    }()
    
    private lazy var secondHorizontalLine: UIView = {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = .border
        return line
    }()
    
    private lazy var logOut:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.foreground, for: .normal)
        button.setTitleColor(.muted, for: .disabled)
        button.backgroundColor = .background
        button.layer.cornerRadius = 10
        button.contentHorizontalAlignment = .leading
        button.tintColor = .foreground
        var config = UIButton.Configuration.plain()
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 12, bottom: 10, trailing: 12)
        config.image = UIImage(named: "change")?.resizedImage(Size: .init(width: 16, height: 16))?.withRenderingMode(.alwaysTemplate)
        config.imagePlacement = .leading
        config.imagePadding = 8
        config.attributedTitle = AttributedString("Change DeFi", attributes: AttributeContainer([
            .font: UIFont(name: "Geist-semibold", size: 14)!,
            .foregroundColor: UIColor.foreground
          ]))
        button.configuration = config
        
        button.addTarget(self, action: #selector(logOutAction), for: .touchUpInside)
        return button
    }()
    
    @objc private func logOutAction(_ sender:UIButton){
        let presentationController = presentationController as? SlideRightPresenter
        presentationController?.dismissMenu()
        
        AppState.shared.resetProtocolID()
        AppState.shared.setPage(to: .defi)
    }
    
    @objc private func linkOpener (_ sender:UIButton) {
        guard let url = sender.layer.name, let url = URL(string: url) else {return}
        UIApplication.shared.open(url)
    }
    
    @objc private func navigateToPage (_ sender:UIButton){
        let index = sender.tag
        let selected = viewModel.menuData[index].name
        
//        guard let page = PageName(rawValue: selected) else { return }
        
//        AppState.shared.navigateToPage(page: page)
        
//        if AppState.shared.currentPage != page {
//            let presentationController = presentationController as? SlideRightPresenter
//            presentationController?.dismissMenu()
//        }
    
        
    }
    
    private func setupUI(){
        view.backgroundColor = .cardBackground
        view.addSubview(logoStack)
        view.addSubview(protocolInfoContainer)
        view.addSubview(linkStack)
        view.addSubview(horizontalLine)
        view.addSubview(socialStack)
        view.addSubview(secondHorizontalLine)
        view.addSubview(logOut)
        
        viewModel.menuData.enumerated().forEach { index, item in
            let button = UIButton()
            button.tag = index
            button.translatesAutoresizingMaskIntoConstraints = false
            button.layer.cornerRadius = 10
            button.contentHorizontalAlignment = .leading
            button.tintColor = .foreground
            button.backgroundColor = .background
            button.setTitleColor(.foreground, for: .normal)
            button.setTitleColor(.muted, for: .disabled)
            var config = UIButton.Configuration.plain()
            config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 12, bottom: 10, trailing: 12)
            config.image = UIImage(named: item.image)?.resizedImage(Size: .init(width: 16, height: 16))?.withRenderingMode(.alwaysTemplate)
            
            config.imagePlacement = .leading
            config.imagePadding = 8
            config.attributedTitle = AttributedString(item.name, attributes: AttributeContainer([
                .font: UIFont(name: "Geist-medium", size: 14)!,
              ]))
            button.configuration = config

            button.addTarget(self, action: #selector(navigateToPage(_:)), for: .touchUpInside)
            
//            if let currentPage = AppState.shared.currentPage, currentPage.rawValue == item.name {
//                button.backgroundColor = .brandForeground
//            }
                  
            
            linkStack.addArrangedSubview(button)
            
            NSLayoutConstraint.activate([
                button.trailingAnchor.constraint(equalTo: linkStack.trailingAnchor),
                button.leadingAnchor.constraint(equalTo: linkStack.leadingAnchor),
            ])
        }
        
        viewModel.socialData.forEach { item in
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            var config = UIButton.Configuration.plain()
            
            config.image = UIImage(named: item.image)?.resizedImage(Size: .init(width: 24, height: 24 ))?.withRenderingMode(.alwaysTemplate)
            button.configuration = config
            button.layer.name = item.link
            button.tintColor = .foreground
            button.addTarget(self, action: #selector(linkOpener), for: .touchUpInside)
            socialStack.addArrangedSubview(button)
        }
        
        NSLayoutConstraint.activate([
            logoStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 12),
            logoStack.bottomAnchor.constraint(equalTo: protocolInfoStack.topAnchor, constant: -32),
            logoStack.widthAnchor.constraint(lessThanOrEqualToConstant: 200),
            logoStack.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
           
            protocolInfoContainer.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -12),
            protocolInfoContainer.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 12),
            protocolInfoContainer.bottomAnchor.constraint(equalTo: linkStack.topAnchor, constant: -32),
            protocolInfoContainer.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            linkStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -12),
            linkStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 12),
            linkStack.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            linkStack.bottomAnchor.constraint(equalTo: horizontalLine.topAnchor, constant: -32),
            
            horizontalLine.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            horizontalLine.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            horizontalLine.heightAnchor.constraint(equalToConstant: 1),
            horizontalLine.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            horizontalLine.bottomAnchor.constraint(equalTo: socialStack.topAnchor, constant: -12),
            
            socialStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            socialStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            socialStack.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            socialStack.bottomAnchor.constraint(equalTo: secondHorizontalLine.topAnchor,constant: -12),
            
            secondHorizontalLine.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            secondHorizontalLine.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            secondHorizontalLine.heightAnchor.constraint(equalToConstant: 1),
            secondHorizontalLine.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            logOut.topAnchor.constraint(equalTo: secondHorizontalLine.bottomAnchor, constant: 12),
            logOut.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -12),
            logOut.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 12),
            logOut.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
        ])
        
        
    }
}
