//
//  SegmentedControl.swift
//  ArkCovid
//
//  Created by irem TOSUN on 18.06.2022.
//

import UIKit

class SegmentedControl: UIStackView {
    var controls: [String]! {
        didSet {
            setup()
        }
    }

    var selectedSegmentIndex: Int = 0

    private var selected: ((Int) -> Void?)?

    override func awakeFromNib() {
        super.awakeFromNib()

        clipsToBounds = false
        axis = .horizontal
        distribution = .fillEqually
        alignment = .fill
        spacing = 3
        backgroundColor = .systemBackground
    }

    func didChangeValue(_ selected: @escaping (Int) -> Void) {
        self.selected = selected
    }

    private func setup() {
        for index in 0 ..< controls.count {
            let button = UIButton()
            if index == 0{
                button.setTitleColor(Colors.aSelectedTabTitle, for: [.normal])
                button.backgroundColor = Colors.aBackgroundTabSelected
            }else{
                button.setTitleColor(Colors.aTabTitle, for: [.normal])
                button.backgroundColor = Colors.aBackgroundTab
            }
            button.cornerRadius = 20
            button.addTarget(self, action: #selector(didTap(_:)), for: .touchUpInside)
            button.tag = index
            button.layer.borderColor = UIColor.clear.cgColor
            button.layer.borderWidth = 0.8
            button.setTitle(controls[index], for: [])
            button.titleLabel?.font = UIFont(name: "Helvetica", size: 14)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 40).isActive = true
            addArrangedSubview(button)
        }
    }

    @objc private func didTap(_ sender: UIButton) {
        guard sender.tag < controls.count else { return }

        UIView.animate(withDuration: 0.2) {
            for index in 0 ..< self.controls.count {
                (self.arrangedSubviews[index] as! UIButton).setTitleColor(Colors.aTabTitle, for: [])
                self.arrangedSubviews[index].backgroundColor = Colors.aBackgroundTab
            }

            (self.arrangedSubviews[sender.tag] as! UIButton).setTitleColor(Colors.aSelectedTabTitle, for: [])
            self.arrangedSubviews[sender.tag].backgroundColor = Colors.aBackgroundTabSelected
        }
        selectedSegmentIndex = sender.tag
        selected?(sender.tag)
    }
}
