//
//  MapView.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 안치욱 on 11/23/25.
//

import UIKit

import MapKit
import SnapKit
import Then

final class MapView: UIView {

    // MARK: - Properties
    private let latitude: Double
    private let longitude: Double

    // MARK: - UI
    private let mapView = MKMapView()

    // MARK: - Init
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
        super.init(frame: .zero)
        setupView()
        setupLayout()
        configureMap()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup
    private func setupView() {
        addSubview(mapView)
        mapView.do {
            $0.isZoomEnabled = true
            $0.isScrollEnabled = true
            $0.isRotateEnabled = true
            $0.showsCompass = false
            $0.showsScale = false
        }
    }

    private func setupLayout() {
        mapView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    // MARK: - Configure
    private func configureMap() {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)

        let region = MKCoordinateRegion(
            center: coordinate,
            latitudinalMeters: 500,
            longitudinalMeters: 500
        )
        mapView.setRegion(region, animated: false)

        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
    }
}
