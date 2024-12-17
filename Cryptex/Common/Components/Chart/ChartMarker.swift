//
//  ListItemCell.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/1/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit
import DGCharts

class ChartMarkerView: MarkerView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private lazy var label:UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 10)!
        label.textColor = .foreground
        label.backgroundColor = .background
        return label
    }()
    
    private func setupUI(){
        addSubview(label)
    }
    
    override func refreshContent(entry: ChartDataEntry, highlight: Highlight) {
        label.text = "X: \(entry.x), Y: \(entry.y)"
        super.refreshContent(entry: entry, highlight: highlight)
    }
}
