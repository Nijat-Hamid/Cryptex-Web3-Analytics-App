//
//  PickerButton.swift
//  Cryptex
//
//  Created by Nijat Hamid on 1/16/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

import UIKit
import SnapKit

enum SheetType {
    case chain
    case protocolVersion
    case unknown
    
    var title: String {
        switch self {
        case .chain:
            return "Select Chain"
        case .protocolVersion:
            return "Select Protocol Version"
        case .unknown:
            return ""
        }
    }
}

class PickerButton: UIView {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    var sheetType: SheetType = .unknown
    
    private lazy var stack:UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .fill
        stack.alignment = .center
        return stack
    }()
    
    private lazy var image:UIImageView = {
        let image = UIImageView(image: UIImage(named: "chainDemo"))
        image.backgroundColor = .cardBackgroundDark
        image.layer.cornerRadius = 30
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 60, height: 60))
        }
        return image
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .backgroundAlpha
        button.layer.cornerRadius = 10
        var config = UIButton.Configuration.plain()
        config.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 4)
        config.image = UIImage(named: "changeArrow")?
            .resizedImage(Size: .init(width: 18, height: 18))
        config.imagePlacement = .trailing
        config.titleAlignment = .center
        config.attributedTitle = AttributedString("Ethereum", attributes: AttributeContainer([
            .font: UIFont(name: "Geist-semibold", size: 14)!,
            .foregroundColor: UIColor.foreground
        ]))
        
        button.configuration = config
        button.tintColor = .foreground
        
        button.addTarget(self, action: #selector(openPickerSheet), for: .touchUpInside)
        return button
    }()
    
    @objc private func openPickerSheet(){
        let pickerSheetVC = PickerSheetVC()
        pickerSheetVC.navigationItem.title = sheetType.title
        let vc = AppNavigationController(rootViewController: pickerSheetVC)
        vc.modalPresentationStyle = .custom
        vc.transitioningDelegate = self
        findViewController()?.present(vc, animated: true)
    }
    
    private func setupUI(){
        stack.addArrangedSubview(image)
        stack.addArrangedSubview(button)
        addSubview(stack)
        translatesAutoresizingMaskIntoConstraints = false
        
        stack.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
}

extension PickerButton:UIViewControllerTransitioningDelegate{
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return SlideUpPresenter(presentedViewController: presented, presenting: presenting)
    }
}
