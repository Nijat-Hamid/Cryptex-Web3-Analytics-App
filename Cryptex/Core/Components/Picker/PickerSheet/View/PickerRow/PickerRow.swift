//
//  PickerRow.swift
//  Cryptex
//
//  Created by Nijat Hamid on 1/16/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

import UIKit
import SnapKit
class PickerRow: UIStackView {

    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private lazy var label:UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .left
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
        image.translatesAutoresizingMaskIntoConstraints = false
        
        image.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 30, height: 30))
        }
        return image
    }()
    
    func configure(with row:PickerTypes){
        label.text = row.label
        image.sd_setImage(with: URL.fromBase(row.img))
       
    }
    
    private func setupUI(){
        axis = .horizontal
        spacing = 8
        alignment = .center
        distribution = .fill
        clipsToBounds = true
        
        addArrangedSubview(image)
        addArrangedSubview(label)
    }
}
