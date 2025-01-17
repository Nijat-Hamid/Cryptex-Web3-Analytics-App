//
//  PickerRow.swift
//  Cryptex
//
//  Created by Nijat Hamid on 1/16/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

import UIKit
import SnapKit

class PickerRow: UIView {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private lazy var stack:UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.alignment = .center
        stack.distribution = .fill
        stack.clipsToBounds = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var label:UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-semibold", size: 16)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var image:UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .cardBackgroundDark
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 30, height: 30))
        }
        return image
    }()
    
    func configure(with row:PickerTypes){
        label.text = row.label
        image.sd_setImage(with: URL.fromBase(row.imageUrl))
    }
    
    private func setupUI(){
        stack.addArrangedSubview(image)
        stack.addArrangedSubview(label)
        addSubview(stack)
        translatesAutoresizingMaskIntoConstraints = false
        
        stack.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
}
