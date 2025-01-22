//
//  CustomPickerViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 1/16/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

import UIKit

class PickerSheetVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
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
    
    let data: [PickerTypes] = [
        PickerTypes(
            id: 0,
            label: "Ethereum",
            value: "Ethereum",
            isDefault: true,
            imageUrl: "/chainlogo/ethereum.svg"
        ),
        PickerTypes(
            id: 1,
            label: "Polygon",
            value: "Polygon",
            isDefault: false,
            imageUrl: "/chainlogo/poly.svg"
        ),
        PickerTypes(
            id: 2,
            label: "Avalanche",
            value: "Avalanche",
            isDefault: false,
            imageUrl: "/chainlogo/avax.svg"
        ),
        PickerTypes(
            id: 3,
            label: "Fantom",
            value: "Fantom",
            isDefault: false,
            imageUrl: "/chainlogo/fantom.svg"
        ),
        PickerTypes(
            id: 4,
            label: "Optimism",
            value: "Optimism",
            isDefault: false,
            imageUrl: "/chainlogo/optimism.svg"
        ),
        PickerTypes(
            id: 5,
            label: "Harmony",
            value: "Harmony",
            isDefault: false,
            imageUrl: "/chainlogo/harmony.svg"
        ),
        PickerTypes(
            id: 6,
            label: "Base",
            value: "Base",
            isDefault: false,
            imageUrl: "/chainlogo/base.svg"
        ),
        PickerTypes(
            id: 7,
            label: "Arbitrum",
            value: "Arbitrum",
            isDefault: false,
            imageUrl: "/chainlogo/arbitrum.svg"
        ),
        PickerTypes(
            id: 8,
            label: "Metis",
            value: "Metis",
            isDefault: false,
            imageUrl: "/chainlogo/metis.svg"
        )
    ]

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
        if let presentationController = navigationController?.presentationController as? SlideUpPresenter {
            presentationController.dismissMenu()
            print("Right button tapped")
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
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerRow = PickerRow()
        pickerRow.configure(with: data[row])

        NSLayoutConstraint.activate([
            pickerRow.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        return pickerRow
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(row)
    }
}
