//
//  RootItemViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 11/28/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit

protocol DeFiItemViewDelegate:AnyObject {
    func didSelectProtocol (withProtocol id:ProtocolTypes)
}

class DeFiItem: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        applyCornerRadiusWithShadow()
    }
    
    var selectedProtocol:ProtocolTypes?
    
    weak var delegate: DeFiItemViewDelegate?
    
    private lazy var image:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var text:UILabel = {
        let text = UILabel()
        text.numberOfLines = .zero
        text.textAlignment = .center
        text.font = UIFont(name: "Geist-medium", size: 12)
        text.textColor = .cardForeground
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private func setupUI(){
        addSubview(image)
        addSubview(text)
        backgroundColor = .cardBackground
        isUserInteractionEnabled = true
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: leadingAnchor),
            image.trailingAnchor.constraint(equalTo: trailingAnchor),
            image.topAnchor.constraint(equalTo: topAnchor,constant: 15),
            image.bottomAnchor.constraint(equalTo: text.topAnchor,constant: -20),
            image.heightAnchor.constraint(equalToConstant: 80),
            
            
            text.trailingAnchor.constraint(equalTo: trailingAnchor),
            text.leadingAnchor.constraint(equalTo: leadingAnchor),
            text.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -15)
        ])
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTap))
        self.addGestureRecognizer(gesture)
    }
    
    func configure(with data:DeFiUIModel){
        image.image = UIImage(named: data.imageName)
        text.text = data.description
        selectedProtocol = data.id
    }
    
    @objc private func didTap (_ sender:UITapGestureRecognizer){
        guard let id = selectedProtocol else { return }
        delegate?.didSelectProtocol(withProtocol: id)
    }
    
    func setSelected(_ isSelected: Bool) {
        UIView.transition(with: self, duration: 0.4, options: .transitionCrossDissolve) { [weak self] in
            guard let self else {return}
            backgroundColor = isSelected ? .cardBackgroundDark : .cardBackground
            
        }
    }
}
