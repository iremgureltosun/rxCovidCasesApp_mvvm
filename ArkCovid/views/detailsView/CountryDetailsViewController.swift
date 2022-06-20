//
//  CountryDetailsViewController.swift
//  ArkCovid
//
//  Created by irem TOSUN on 7.06.2022.
//

import Charts
import Lottie
import MapKit
import UIKit

class CountryDetailsViewController: BaseViewController {
    @IBOutlet var segmentedControl: SegmentedControl!
    @IBOutlet var containerView: UIStackView!
    @IBOutlet var elevationLabel: UILabel!
    @IBOutlet var continentLabel: UILabel!
    @IBOutlet var capicalCityLabel: UILabel!
    @IBOutlet var lifeExpectancyLabel: UILabel!
    @IBOutlet var populationLabel: UILabel!

    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet var loadingView: AnimationView!
    let xAxisAnimationDuration = 2.0

    var model: CountryCellViewModel?
    var viewModel: CountryDetailsViewModel?
    var chartDictionary: [Int: LineChartView] = [:]
    var currentTab = CountryDetailTabs.totalCaseCount
    var mapView: MKMapView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK: Updating map

        loadingView.loopMode = .loop
        loadingView.play()
        mapView = {
            let map = MKMapView(frame: CGRect(x: 0, y: 0, width: containerView.frame.width, height: containerView.frame.height))
            map.overrideUserInterfaceStyle = .light
            return map
        }()

        setMapConstraints()
        mapView?.delegate = self
        guard let model = model else {
            return
        }
        let summary = CountryCasesSummaryModel(model)
        mapView?.addAnnotation(summary)
        mapView?.isHidden = true

        // MARK: Gathering historical data of the country

        viewModel = CountryDetailsViewModel(detailsModel: model, listener: self)
        // fetched historical data inside constructor.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = model?.countryName ?? ""
        elevationLabel.text = model?.elevationInMeters ?? ""
        populationLabel.text = String(model?.population ?? 0)
        capicalCityLabel.text = model?.capitalCity ?? ""
        continentLabel.text = model?.continent ?? ""
        lifeExpectancyLabel.text = model?.lifeExpectancy
        statusLabel.text = "Fetching historical data..."
    }

    private func setMapConstraints() {
        guard let mapView = mapView else { return }
        containerView.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: containerView.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            mapView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            mapView.rightAnchor.constraint(equalTo: containerView.rightAnchor),
        ])

        let lat = Double(model?.lat ?? "0.0") ?? 0.0
        let long = Double(model?.long ?? "0.0") ?? 0.0
        print("Lat long: \(lat)-\(long)")
        let initialLocation = CLLocation(latitude: lat, longitude: long)
        mapView.centerToLocation(initialLocation)
    }

    private func setupSegmentControl() {
        let controls = CountryDetailTabs.allCases.map({ (type) -> String in
            type.detail.title
        })

        segmentedControl.controls = controls
        for i in 0 ..< 3 {
            if let chartType = CountryDetailTabs(rawValue: i) {
                let chart = createChart(type: chartType)
                chartDictionary[i] = chart
                containerView.addSubview(chart)
                // chart.center = containerView.center
                chart.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    chart.topAnchor.constraint(equalTo: containerView.topAnchor),
                    chart.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
                    chart.leftAnchor.constraint(equalTo: containerView.leftAnchor),
                    chart.rightAnchor.constraint(equalTo: containerView.rightAnchor),
                ])
            }
        }
        chartDictionary[0]?.isHidden = false
    }

    private func createChart(type: CountryDetailTabs) -> LineChartView {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.locale = Locale.current
        
        // create barchart
        lazy var chart: LineChartView = {
            let chartView = LineChartView(frame: CGRect(x: 0, y: 0, width: containerView.frame.width, height: containerView.frame.height))
            chartView.backgroundColor = .gray
            
            chartView.tag = type.rawValue
            chartView.isHidden = true
            chartView.rightAxis.enabled = false
            let yAxis = chartView.leftAxis
            yAxis.labelFont = .boldSystemFont(ofSize: 12)
            yAxis.labelTextColor = .white
            yAxis.axisLineColor = .white
            yAxis.labelPosition = .insideChart
            
            let xValuesNumberFormatter = ChartXAxisFormatter()
             xValuesNumberFormatter.dateFormatter = dateFormatter
            chartView.xAxis.valueFormatter = xValuesNumberFormatter
            
            chartView.xAxis.labelPosition = .bottom
            chartView.xAxis.labelFont = .boldSystemFont(ofSize: 12)
            chartView.xAxis.labelTextColor = .white
            chartView.xAxis.axisLineColor = .white
            chartView.animate(xAxisDuration: xAxisAnimationDuration)
            chartView.xAxis.labelRotationAngle = 270
            //chartView.xAxis.valueFormatter =  dateFormatter.string(from:Date(timeIntervalSince1970: $1))
           
            return chartView
        }()

        // MARK: Supplying data for chart

        var lineChartEntry = [ChartDataEntry]()
        if let searchType = type.detail.historicalSearchType {
            if let data = viewModel?.historicalDictionary[searchType] {
                let orderedKeys = data.dates.compactMap { $0.key.toDate() }.sorted(by: <)
                for date in orderedKeys {
                    let item = data.dates[date.getFormattedDate(format: Constants.dateFormat)]
                    let epochTime = date.epochTime
                    let value = ChartDataEntry(x: Double(epochTime), y: Double(item ?? 0))
                    lineChartEntry.append(value)
                }
            }
        }
        let set1 = LineChartDataSet(entries: lineChartEntry, label: type.detail.title)
        set1.drawCirclesEnabled = false
        set1.setColor(type.detail.lineColor ?? .white)
        set1.lineWidth = 3
        set1.fill = ColorFill(color: type.detail.lineColor ?? .white)
        set1.fillAlpha = 0.2
        set1.drawFilledEnabled = true
        set1.drawHorizontalHighlightIndicatorEnabled = true
        set1.highlightColor = .systemBlue
        let data = LineChartData(dataSet: set1)
        chart.data = data

        return chart
    }

    private func updateTabVisibilities() {
        if currentTab.rawValue < 3 {
            mapView?.isHidden = true
            for chartPair in chartDictionary {
                if chartPair.key != currentTab.rawValue {
                    chartPair.value.isHidden = true
                } else {
                    chartPair.value.isHidden = false
                    chartPair.value.animate(xAxisDuration: xAxisAnimationDuration)
                }
            }
        } else {
            mapView?.isHidden = false
            for chartPair in chartDictionary {
                chartPair.value.isHidden = true
            }
        }
    }
}

extension CountryDetailsViewController: ChartViewDelegate {
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
}

extension CountryDetailsViewController: MKMapViewDelegate {
    func mapView(
        _ mapView: MKMapView,
        viewFor annotation: MKAnnotation
    ) -> MKAnnotationView? {
        // 2
        guard let annotation = annotation as? CountryCasesSummaryModel else {
            return nil
        }
        // 3
        let identifier = "covid cases"
        var view: MKMarkerAnnotationView
        // 4
        if let dequeuedView = mapView.dequeueReusableAnnotationView(
            withIdentifier: identifier) as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            // 5
            view = MKMarkerAnnotationView(
                annotation: annotation,
                reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
}

extension CountryDetailsViewController: CompletionListener {
    func statusChanged(text: String) {
        DispatchQueue.main.async {[weak self] in
            self?.statusLabel.text = text
        }
    }
    
    func didFinishFetching() {
        DispatchQueue.main.async { [weak self] in
            self?.loadingView.stop()
            self?.loadingView.isHidden = true
            self?.segmentedControl.isHidden = false
            self?.containerView.isHidden = false
            self?.setupSegmentControl()
            self?.statusLabel.isHidden = true
            guard let self = self else { return }
            self.segmentedControl.didChangeValue { [self] tag in
                if let tab = CountryDetailTabs(rawValue: tag) {
                    self.currentTab = tab
                    self.updateTabVisibilities()
                }
            }
        }
    }
    
}
