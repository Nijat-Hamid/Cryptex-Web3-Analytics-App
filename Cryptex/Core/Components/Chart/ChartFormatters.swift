//
//  ChartFormatters.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/30/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit
import DGCharts


class YAxisValueFormatter: AxisValueFormatter {
    private let formatType: FormatType
    private let absolute: Bool
    
    init(formatType: FormatType = .currency, absolute: Bool = false) {
        self.formatType = formatType
        self.absolute = absolute
    }
    
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return Formatter.number(value, as: formatType, absolute: absolute)
    }
}


class XAxisDateFormatter: AxisValueFormatter {
    private let formatType: DateFormatType
    private let includeTime: Bool
    
    init(formatType: DateFormatType = .medium, includeTime: Bool = false) {
        self.formatType = formatType
        self.includeTime = includeTime
    }
    
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return Formatter.date(value, as: formatType, includeTime: includeTime)
    }
}


extension LineChart {
    func configureYAxisFormatter(type: FormatType, absolute: Bool = false) {
        let formatter = YAxisValueFormatter(formatType: type, absolute: absolute)
        chart.leftAxis.valueFormatter = formatter
    }
    
    func configureXAxisDateFormatter(type: DateFormatType = .medium, includeTime: Bool = false) {
        let formatter = XAxisDateFormatter(formatType: type, includeTime: includeTime)
        chart.xAxis.valueFormatter = formatter
    }
    
}
