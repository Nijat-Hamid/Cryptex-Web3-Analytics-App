//
//  ListItemCell.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/1/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit
import DGCharts

class ChartMarker: MarkerView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    var yMarkerFormatter:FormatType = .decimal
    
    private lazy var xLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Geist-medium", size: 12)!
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = .foreground
        return label
    }()
    
    private lazy var yLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Geist-medium", size: 12)!
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = .foreground
        return label
    }()
    
    
    private lazy var stack:UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        stack.spacing = 4
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.backgroundColor = .brandSecondary
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layer.cornerRadius = 10
        stack.layoutMargins = UIEdgeInsets(top: 4, left: 10, bottom: 4, right: 5)
        return stack
    }()
    
    
    private func setupUI(){
        stack.addArrangedSubview(xLabel)
        stack.addArrangedSubview(yLabel)
        addSubview(stack)
    }
    
    override func refreshContent(entry: ChartDataEntry, highlight: Highlight) {
        xLabel.text = Formatter.date(entry.x, as: .medium)
        yLabel.text = Formatter.number(entry.y, as: yMarkerFormatter)
        super.refreshContent(entry: entry, highlight: highlight)
    }

    override func offsetForDrawing(atPoint point: CGPoint) -> CGPoint {
        let size = stack.frame.size
        let width = size.width
        let height = size.height
        let xPoint = point.x
        let yPoint = point.y
        
        var offset = CGPoint(x: -width/2, y: -(height + (height / 3)))
        
        if width + xPoint > UIScreen.main.bounds.width {
            offset.x -= width/2
        } else if xPoint - width / 2 < 10 {
            offset.x += width/2
        }
        
        if  height + xPoint > UIScreen.main.bounds.height {
            offset.y -= height
        } else if yPoint - height / 2 < 10 {
            offset.y += height
        }

        return offset
    }

}
