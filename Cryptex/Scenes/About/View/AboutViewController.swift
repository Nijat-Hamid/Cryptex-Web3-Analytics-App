//
//  MenuViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/3/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit
import SnapKit
class AboutViewController: BaseHidesTabBarViewController {

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
    private let viewModel = AboutViewModel()
    
    private lazy var logoStack:UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            {
                let image = UIImageView(image: UIImage(named: "launch"))
                image.translatesAutoresizingMaskIntoConstraints = false
                image.contentMode = .scaleAspectFill
                image.snp.makeConstraints { make in
                    make.size.equalTo(CGSize(width: 110, height: 105))
                }
                return image
            }(),
            {
                let label = UILabel()
                label.numberOfLines = 1
                label.textAlignment = .left
                label.font = UIFont(name: "Geist-bold", size: 24)
                label.textColor = .foreground
                label.text = "Cryptex"
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()
        ])
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fill
        stack.alignment = .center
        
        return stack
    }()
    
    private lazy var protocolInfoStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            {
                let image = UIImageView(image: UIImage(named: "aaveLogo"))
                image.translatesAutoresizingMaskIntoConstraints = false
                image.contentMode = .scaleAspectFill
                image.snp.makeConstraints { make in
                    make.size.equalTo(CGSize(width: 28, height: 28))
                }
               
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
        stack.layer.borderWidth = 1.2
        stack.layer.borderColor = UIColor.border.cgColor
        stack.layer.cornerRadius = 10
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 6, left: 8, bottom: 6, right: 8)
        stack.spacing = 8
        stack.distribution = .fill
        stack.alignment = .center
        return stack
    }()

    
    private lazy var horizontalLine: UIView = {
        let line = UIView()
        line.backgroundColor = .border
        return line
    }()
    
    private lazy var socialStack:UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 6
        stack.distribution = .fillEqually
        stack.alignment = .center
        return stack
    }()
    
    
    private lazy var logOut:UIButton = {
        let button = UIButton()
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
        AppState.shared.resetProtocolID()
        AppState.shared.setPage(to: .defi)
//        tabBarController?.selectedIndex = 0
    }
    
    @objc private func linkOpener (_ sender:UIButton) {
        guard let url = sender.layer.name, let url = URL(string: url) else {return}
        UIApplication.shared.open(url)
    }
    
    private lazy var container:UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 14
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fill
        stack.alignment = .center
        return stack
    }()
    private func setupUI(){
        view.backgroundColor = .cardBackground
    
        container.addArrangedSubview(protocolInfoStack)
        container.addArrangedSubview(logOut)
        container.addArrangedSubview(horizontalLine)
        container.addArrangedSubview(socialStack)
        
        view.addSubview(logoStack)
        view.addSubview(container)
        
        
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
        
        logoStack.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(40)
            make.trailing.lessThanOrEqualTo(safeAreaLayoutGuide.snp.trailing).offset(-100)
            make.leading.lessThanOrEqualTo(safeAreaLayoutGuide.snp.leading).offset(100)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
        }
        
        horizontalLine.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.width.equalToSuperview()
        }
        
        protocolInfoStack.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
        logOut.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
        container.snp.makeConstraints { make in
            make.top.equalTo(logoStack.snp.bottom).offset(40)
            make.trailing.lessThanOrEqualTo(safeAreaLayoutGuide.snp.trailing).offset(-120)
            make.leading.lessThanOrEqualTo(safeAreaLayoutGuide.snp.leading).offset(120)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
        }
    }
}
