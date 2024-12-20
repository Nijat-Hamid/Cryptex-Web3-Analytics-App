//
//  CustomSegmentView.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/20/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit

protocol SegmentDelegate:AnyObject{
    func didSelect(index:Int)
}

class CustomSegmentView: UIView {
        
    required init?(coder: NSCoder) {
        self.segments = []
        super.init(coder: coder)
        setupUI()
    }
    
    init(segments:[String]) {
        self.segments = segments
        super.init(frame: .zero)
        setupUI() 
    }
    
    
    weak var delegate:SegmentDelegate? {
        didSet{
            delegate?.didSelect(index: selectedSegmentIndex)
        }
    }
    
    private var segments:[String] = []
    private var selectedSegmentIndex = 0
    private var labels: [UILabel] = []
    
    
    private lazy var bottomLine:UIView = {
        let view = UIView()
        view.backgroundColor = .chart
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var segmentBtnStack:UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.spacing = 12
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillProportionally
        return stack
    }()
    
    private func segmentLabelCreator(title: String, index: Int)->UILabel{
        let label = UILabel()
        label.text = title
        label.tag = index
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 12)
        label.textColor = index == selectedSegmentIndex ? .chart : .mutedForeground
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTap))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(gesture)
        return label
    }
    
    @objc private func didTap(_ sender:UITapGestureRecognizer){
        guard let view = sender.view as? UILabel else {return}
        if view.tag == selectedSegmentIndex { return }
        align(to: view)
    }
    
    private func align(to view:UILabel){
        self.constraints.forEach { constraint in
              if constraint.firstItem as? UIView == bottomLine &&
                 (constraint.firstAttribute == .width || constraint.firstAttribute == .centerX) {
                  self.removeConstraint(constraint)
              }
          }
        
        NSLayoutConstraint.activate([
               bottomLine.widthAnchor.constraint(equalTo: view.widthAnchor),
               bottomLine.centerXAnchor.constraint(equalTo: view.centerXAnchor)
           ])
        
        labels[selectedSegmentIndex].textColor = .mutedForeground
        view.textColor = .chart
        
        UIView.animate(withDuration: 0.3,delay: 0,options: .curveEaseInOut) { [weak self] in
            guard let self else {return}
              layoutIfNeeded()
        } completion: { [weak self] _ in
            guard let self else {return}
            selectedSegmentIndex = view.tag
            delegate?.didSelect(index: view.tag)
        }
    }
    
    private func setupUI(){
        
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(segmentBtnStack)
        addSubview(bottomLine)
        segments.enumerated().forEach { index,value in
            let label = segmentLabelCreator(title: value, index: index)
            labels.append(label)
            segmentBtnStack.addArrangedSubview(label)
        }
        
        NSLayoutConstraint.activate([
            segmentBtnStack.topAnchor.constraint(equalTo: topAnchor),
            segmentBtnStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            segmentBtnStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            segmentBtnStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            bottomLine.topAnchor.constraint(equalTo: segmentBtnStack.bottomAnchor, constant: 2),
            bottomLine.heightAnchor.constraint(equalToConstant: 2),
            bottomLine.widthAnchor.constraint(equalTo: labels[selectedSegmentIndex].widthAnchor),
            bottomLine.centerXAnchor.constraint(equalTo: labels[selectedSegmentIndex].centerXAnchor)
        ])
        
        
    }
    
}
