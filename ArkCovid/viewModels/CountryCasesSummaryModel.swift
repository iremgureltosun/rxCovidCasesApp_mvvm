//
//  CountryCasesSummaryModel.swift
//  ArkCovid
//
//  Created by irem TOSUN on 18.06.2022.
//

import CoreLocation
import Foundation
import MapKit

// MARK: This class is for annotation on map

class CountryCasesSummaryModel: NSObject, MKAnnotation {
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
   
    
    init(_ countryCell: CountryCellViewModel) {
        title = countryCell.countryName
        subtitle = "\(countryCell.capitalCity)"
        coordinate = CLLocationCoordinate2D(latitude: Double(countryCell.lat) ?? 0.0, longitude: Double(countryCell.long) ?? 0.0)       
        super.init()
    }

    
}
