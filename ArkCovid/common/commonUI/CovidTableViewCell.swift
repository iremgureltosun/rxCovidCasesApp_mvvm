//
//  CovidTableViewCell.swift
//  ArkCovid
//
//  Created by irem TOSUN on 7.06.2022.
//

import UIKit

class CovidTableViewCell: UITableViewCell {
    @IBOutlet var countryNameLabel: UILabel!
    @IBOutlet var deathCasesCountLabel: UILabel!
    @IBOutlet var recoveredCasesCountLabel: UILabel!
    @IBOutlet var confirmedCasesCountLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    var viewModel: CountryCellViewModel? {
        didSet {
            countryNameLabel?.text = viewModel?.countryName ?? ""
            deathCasesCountLabel?.text = String(viewModel?.deathCount ?? 0)
            recoveredCasesCountLabel?.text = String(viewModel?.recoveredCaseCount ?? 0)
            confirmedCasesCountLabel?.text = String(viewModel?.confirmedCaseCount ?? 0)
        }
    }
}
