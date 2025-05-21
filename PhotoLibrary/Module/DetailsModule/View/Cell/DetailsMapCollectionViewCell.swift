//
//  DetailsMapCollectionViewCell.swift
//  PhotoLibrary
//
//  Created by Saadet Şimşek on 21/05/2025.
//

import UIKit
import MapKit

class DetailsMapCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DetailsMapCollectionViewCell"
    
    lazy var mapView: MKMapView = {
        $0.layer.cornerRadius = 30
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(MKMapView())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(mapView)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(coordinate: CLLocationCoordinate2D?){
        guard let coordinate = coordinate else { return }
        mapView.setRegion(MKCoordinateRegion(center: coordinate,
                                             span: MKCoordinateSpan(latitudeDelta: 0.01,
                                                                    longitudeDelta: 0.01)),
                          animated: true)
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        mapView.addAnnotation(pin)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: topAnchor),
            mapView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
