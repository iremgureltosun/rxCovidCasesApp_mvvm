//
//  CountryDetailsViewController.swift
//  ArkCovid
//
//  Created by irem TOSUN on 7.06.2022.
//

import MapKit
import UIKit

class CountryDetailsViewController: BaseViewController {
    @IBOutlet var titleUpdatedOn: UILabel!
    @IBOutlet var bottomView: UIView!
    @IBOutlet var chartDetailsView: ChartView!
    @IBOutlet var updatedLabel: UILabel!
    @IBOutlet var populationLabel: UILabel!
    @IBOutlet var lifeExpectancyLabel: UILabel!
    @IBOutlet var capitalCityLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var continentLabel: UILabel!
    @IBOutlet weak var updatedStackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()

        setMapConstraints()
    }

    var viewModel: CountryCellViewModel?
    let mapView: MKMapView = {
        let map = MKMapView()
        map.overrideUserInterfaceStyle = .light
        return map
    }()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if viewModel?.updated == "" {
            updatedStackView.isHidden = true
        } else {
            updatedStackView.isHidden = false
        }
        populationLabel.text = String(viewModel?.population ?? 0)
        updatedLabel.text = viewModel?.updated ?? ""
        lifeExpectancyLabel.text = viewModel?.lifeExpectancy ?? ""
        capitalCityLabel.text = viewModel?.capitalCity ?? ""
        locationLabel.text = viewModel?.location ?? ""
        continentLabel.text = viewModel?.continent
        title = viewModel?.countryName ?? ""
        chartDetailsView.model = viewModel
        var unstableWidth = chartDetailsView.frame.width
        if unstableWidth > CGFloat(135) {
            unstableWidth = unstableWidth - 45 - 90
        }
        chartDetailsView.setConstraints(unstableWidth: unstableWidth)
    }

    func setMapConstraints() {
        view.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor).isActive = true
        let lat = Double(viewModel?.lat ?? "0.0")
        let long = Double(viewModel?.long ?? "0.0")
        mapView.centerCoordinate.latitude = lat ?? 0.0
        mapView.centerCoordinate.longitude = long ?? 0.0
    }
}

extension CountryDetailsViewController: MKMapViewDelegate {
}
