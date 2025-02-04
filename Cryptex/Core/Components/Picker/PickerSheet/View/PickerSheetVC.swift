//
//  CustomPickerViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 1/16/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

import UIKit

class PickerSheetVC: BaseVC {
    
    var pickerType: SheetType = .unknown
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        observeAppState()
    }
    
    override func loadView() {
        super.loadView()
        setupUI()
    }
    
    private var safeAreaLayoutGuide:UILayoutGuide{
        view.safeAreaLayoutGuide
    }
    
    private lazy var uiPicker:UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.dataSource = self
        picker.delegate = self
        return picker
    }()
    
    private var data: [PickerTypes] = []
   
    func configure(with selectData:[PickerTypes]){
        data = selectData
    }
    
    private func observeAppState() {
        AppState.shared.selectedProtocolPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] protocolType in
                guard let self else { return }
                updatePickerData(value: protocolType.cleanSubID)
            }
            .store(in: &cancellables)
        
        AppState.shared.selectedChain
            .receive(on: DispatchQueue.main)
            .sink { [weak self] chain in
                guard let self else { return }
                updatePickerData(value: chain)
            }
            .store(in: &cancellables)
    }
    
    private func updatePickerData(value:String) {
        guard let index = data.firstIndex(where: { $0.value == value }) else { return }
        uiPicker.selectRow(index, inComponent: 0, animated: true)
    }
    
    private func setupNav() {
        let leftButton = UIBarButtonItem(
            title: "Cancel",
            style: .done,
            target: self,
            action: #selector(leftButtonTapped)
        )
        navigationItem.leftBarButtonItem = leftButton
        
        let rightButton = UIBarButtonItem(
            title: "Done",
            style: .done,
            target: self,
            action: #selector(rightButtonTapped)
        )
        navigationItem.rightBarButtonItem = rightButton
        
    }
    
    @objc private func leftButtonTapped() {
        if let presentationController = navigationController?.presentationController as? SlideUpPresenter {
            presentationController.dismissMenu()
        } else {
            dismiss(animated: true)
        }
    }
    
    @objc private func rightButtonTapped() {
        let selectedRow = uiPicker.selectedRow(inComponent: 0)
        let selectedData = data[selectedRow]
        
        switch pickerType {
        case .protocolVersion:
            if let protocolType = ProtocolTypes.allCases.first(where: { $0.cleanSubID == selectedData.value }) {
                AppState.shared.setProtocolID(with: protocolType)
                AppState.shared.resetChain()
            }
        case .chain:
            if let chain = ProtocolChains(rawValue: selectedData.value) {
                AppState.shared.setChain(with: chain)
            }
        case .unknown: break
        }
        
        
        if let presentationController = navigationController?.presentationController as? SlideUpPresenter {
            presentationController.dismissMenu()
        } else {
            dismiss(animated: true)
        }
    }
    
    private func setupUI(){
        view.addSubview(uiPicker)
        NSLayoutConstraint.activate([
            uiPicker.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 10),
            uiPicker.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            uiPicker.heightAnchor.constraint(lessThanOrEqualToConstant: 250),
            uiPicker.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor)
        ])
    }
    
}

extension PickerSheetVC:UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 140
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        if let view = view as? PickerRow{
            view.configure(with: data[row])
            return view
        } else {
            let pickerRow = PickerRow()
            pickerRow.configure(with: data[row])
            return pickerRow
        }
        
        
    }
}
