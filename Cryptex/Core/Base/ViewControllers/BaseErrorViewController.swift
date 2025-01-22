//
//  BaseErrorViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 1/14/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

import UIKit

class BaseErrorViewController: BaseVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private lazy var tryAgainButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.backgroundColor = .brandGreen
        button.alpha = 0.7
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.clear.cgColor
        button.addTarget(self, action: #selector(tryAgainTapped), for: .touchUpInside)
        
        var config = UIButton.Configuration.plain()
        config.contentInsets = NSDirectionalEdgeInsets(top: 6, leading: 12, bottom: 6, trailing: 12)
        config.attributedTitle = AttributedString("Refresh Page", attributes: AttributeContainer([
            .font: UIFont(name: "Geist-semibold", size: 14)!,
            .foregroundColor: UIColor.muted
        ]))
        button.configuration = config
        return button
    }()
    
    @objc private func tryAgainTapped() {
        fetch()
    }
    
    private lazy var overlayView: UIView = {
        let overlay = UIView()
        overlay.translatesAutoresizingMaskIntoConstraints = false
        overlay.backgroundColor = .background
        overlay.isHidden = true
        return overlay
    }()
    
    private lazy var stack:UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.alignment = .center
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var errorImage:UIImageView = {
        let image = UIImageView(image: .error)
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var errorTitle:UILabel = {
        let label = UILabel()
        label.text = "OOPS! Something went wrong"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont(name: "Geist-bold", size: 18)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var errorDescription:UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .brandRed
        return label
    }()
    
    
    private func setupUI() {
        stack.addArrangedSubview(errorImage)
        stack.addArrangedSubview(errorTitle)
        stack.addArrangedSubview(errorDescription)
        stack.addArrangedSubview(tryAgainButton)
        overlayView.addSubview(stack)
        view.addSubview(overlayView)
        NSLayoutConstraint.activate([
            errorImage.heightAnchor.constraint(lessThanOrEqualToConstant: 200),
            stack.centerXAnchor.constraint(equalTo: overlayView.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: overlayView.centerYAnchor),
            stack.leadingAnchor.constraint(lessThanOrEqualTo: overlayView.leadingAnchor, constant: 100),
            stack.trailingAnchor.constraint(lessThanOrEqualTo: overlayView.trailingAnchor, constant: -100),
            
            
            overlayView.topAnchor.constraint(equalTo: view.topAnchor),
            overlayView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            overlayView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            overlayView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func showError(for error:NetworkError) {
        errorDescription.text = "Cause: \(error)"
        overlayView.isHidden = false
    }
    
    func hideError() {
        overlayView.isHidden = true

    }

}
