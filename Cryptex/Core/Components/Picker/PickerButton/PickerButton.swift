//
//  PickerButton.swift
//  Cryptex
//
//  Created by Nijat Hamid on 1/16/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

import UIKit
import SnapKit
import SDWebImage
import Combine

enum SheetType {
    case chain
    case protocolVersion
    case unknown
    
    var title: String {
        switch self {
        case .chain:
            return "Select Chain"
        case .protocolVersion:
            return "Select Protocol"
        case .unknown:
            return ""
        }
    }
}

protocol PickerButtonDelegate:AnyObject{
    func openPicker(for type:SheetType)
}

class PickerButton: UIStackView {
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    weak var delegate:PickerButtonDelegate?
    
    private var cancellables = Set<AnyCancellable>()
    private var currentChain: ProtocolChains.RawValue = ""
    private var currentProtocol: ProtocolTypes = .unknown
    
    var sheetType: SheetType = .unknown
    
    var pickerData: [Select] = []
    
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
    
    
    private var buttonConfig: UIButton.Configuration = {
        var config = UIButton.Configuration.plain()
        config.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 4)
        config.image = UIImage(named: "changeArrow")?
            .resizedImage(Size: .init(width: 18, height: 18))
        config.imagePlacement = .trailing
        config.titleAlignment = .center
        config.title = "N/A"
        config.baseForegroundColor = .foreground
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont(name: "Geist-semibold", size: 14)
            return outgoing
        }
        return config
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .backgroundAlpha
        button.layer.cornerRadius = 10
        
        button.configuration = buttonConfig
        button.tintColor = .foreground
        
        button.addTarget(self, action: #selector(openPickerSheet), for: .touchUpInside)
        return button
    }()
    
    @objc private func openPickerSheet(){
        delegate?.openPicker(for: sheetType)
    }
    
    private func observeAppState() {
        AppState.shared.selectedProtocolPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] protocolType in
                guard let self else {return}
                currentProtocol = protocolType
                updatePickerData(sheetType)
            }
            .store(in: &cancellables)
        
        AppState.shared.selectedChain
            .receive(on: DispatchQueue.main)
            .sink { [weak self] chain in
                guard let self else {return}
                currentChain = chain
                updatePickerData(sheetType)
            }
            .store(in: &cancellables)
    }
    
    
    func configurePicker(data:[Select]){
        pickerData = data
        updatePickerData(sheetType)
    }
    
    private func updatePickerData(_ type:SheetType) {
        switch type {
        case .chain:
            guard let index = pickerData.firstIndex(where: { $0.value == currentChain }) else { return }
            updatePickerButton(data: pickerData[index])
        case .protocolVersion:
            guard let index = pickerData.firstIndex(where: { $0.value == currentProtocol.cleanSubID }) else { return }
            updatePickerButton(data: pickerData[index])
        case .unknown:
            break
        }
    }
    
    private func updatePickerButton(data:Select){
        image.sd_setImage(with: URL.fromBase(data.img))
        
        buttonConfig.title = data.label
        button.configuration = buttonConfig
    }
    
    private func setupUI(){
        observeAppState()
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        spacing = 8
        distribution = .fill
        alignment = .center
        addArrangedSubview(image)
        addArrangedSubview(button)
    }
}

