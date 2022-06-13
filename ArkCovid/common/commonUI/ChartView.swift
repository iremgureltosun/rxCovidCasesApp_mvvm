//
//  ChartView.swift
//  ArkCovid
//
//  Created by irem TOSUN on 8.06.2022.
//

import UIKit

extension CountryCellViewModel {
    var avgCase: Double {
        guard population != 0 else {
            return 0
        }
        let caseRatio = Double(confirmedCaseCount) / Double(population)
        return caseRatio.rounded(toPlaces: 4)
    }

    var avgDeath: Double {
        guard confirmedCaseCount != 0 else {
            return 0
        }
        let deadRatio = Double(deathCount) / Double(confirmedCaseCount)
        return deadRatio.rounded(toPlaces: 4)
    }
}

class ChartView: UIView {
    let nibName = "ChartView"
    /// - Covid cases
    var model: CountryCellViewModel?

    @IBOutlet var caseAvgLabel: UILabel!
    @IBOutlet var deadAvgLabel: UILabel!
    @IBOutlet var recoveryTrailing: NSLayoutConstraint!

    @IBOutlet var deathTrailing: NSLayoutConstraint!
    @IBOutlet var avgValueViews: [UIView]!
    @IBOutlet var avgValueSubviews: [UIView]!
    @IBOutlet var progressView: UIView!

    @IBOutlet var progressSubView: UIView!
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        _ = loadFromNib()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        _ = loadFromNib()
    }

    func loadFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.backgroundColor = .clear
        addSubview(view)
        return view
    }

    func setConstraints
    (unstableWidth: CGFloat) {
        guard let model = model else {
            return
        }
        let constraint1 = (unstableWidth * CGFloat(model.avgCase))
        recoveryTrailing.constant = unstableWidth - constraint1
        caseAvgLabel.text = String(model.confirmedCaseCount )

        let constraint2 = (unstableWidth * CGFloat(model.avgDeath))
        deathTrailing.constant = unstableWidth - constraint2
        deadAvgLabel.text = String(model.deathCount )
    }
}
