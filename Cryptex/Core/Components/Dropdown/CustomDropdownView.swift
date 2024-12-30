//
//  CustomDropdownView.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/25/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit

class CustomDropdownView: UIView {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    var options: [String] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    private var selectedOption: String? {
        didSet {
            label.text = selectedOption ?? "Choose"
        }
    }
    
    private var isMenuOpen = false {
        didSet {
            tableView.isHidden = !isMenuOpen
        }
    }
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.backgroundColor = .red
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.isHidden = true
        table.layer.borderWidth = 1
        table.layer.borderColor = UIColor.lightGray.cgColor
        table.translatesAutoresizingMaskIntoConstraints = false
        table.layer.zPosition = 1000
        table.clipsToBounds = false
        return table
    }()
    
    private lazy var stack:UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = 6
        return stack
    }()
    
    
    private lazy var image:UIImageView = {
        let image = UIImageView(image: .chainDemo)
        image.layer.cornerRadius = 25
        image.layer.masksToBounds = true
        image.clipsToBounds = true
        image.backgroundColor = .cardBackgroundDark
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.border.cgColor
        image.contentMode = .scaleAspectFill
        image.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 50, height: 50))
        }
        return image
    }()
    
    private lazy var label:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        label.text = "Ethereum"
        return label
    }()
    
    private lazy var button:UIButton = {
        let button = UIButton()
        button.setTitleColor(.foreground, for: .normal)
        button.setTitleColor(.muted, for: .disabled)
        button.backgroundColor = .brandForeground
        button.layer.cornerRadius = 10
        button.tintColor = .foreground
        var config = UIButton.Configuration.plain()
        config.contentInsets = NSDirectionalEdgeInsets(top:6, leading: 10, bottom: 6, trailing: 10)
        config.attributedTitle = AttributedString("Change", attributes: AttributeContainer([
            .font: UIFont(name: "Geist-semibold", size: 14)!,
            .foregroundColor: UIColor.foreground
        ]))
        button.configuration = config
        button.addTarget(self, action: #selector(menuToggle), for: .touchUpInside)
        return button
    }()
    
    @objc private func menuToggle(){
        print("Open")
        isMenuOpen.toggle()
        if isMenuOpen {
            adjustTableViewHeight()
        }
    }
    
    private func adjustTableViewHeight() {
        let maxHeight = UIScreen.main.bounds.height / 3
        
        let contentHeight = tableView.contentSize.height
        let height = min(maxHeight, contentHeight)
        
        NSLayoutConstraint.deactivate(tableView.constraints.filter { $0.firstAttribute == .height })
        NSLayoutConstraint.activate([
            tableView.heightAnchor.constraint(equalToConstant: height)
        ])
    }

    private func setupUI(){
        translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(image)
        stack.addArrangedSubview(label)
        stack.addArrangedSubview(button)
        addSubview(stack)
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: stack.bottomAnchor,constant: 10),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
    
extension CustomDropdownView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = options[indexPath.row]
        cell.textLabel?.textAlignment = .center
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedOption = options[indexPath.row]
        isMenuOpen = false
        tableView.deselectRow(at: indexPath, animated: true)
    }
}



