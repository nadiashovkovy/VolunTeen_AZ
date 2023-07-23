//
//  MapView.swift
//  VolunTeen AZ
//
//  Created by Nadia Shovkovy on 7/20/23.
//

import MapKit
import SwiftUI


struct MapView: View {
    @StateObject private var viewModel = MapView_Model()
    
    var body: some View {
        VStack {
                VStack {
                        Text("Events Map")
                            .font(.largeTitle)
                            .bold()
                        Image("LeafBlob")
                            .resizable()
                            .frame(width:100, height: 100)
                            .padding(-20)
                    }
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
                .padding(.top)
                .ignoresSafeArea()
                .accentColor(Color(UIColor(named: "MyPink")!))
                .onAppear {
                    viewModel.checkIfLocationServicesIsEnabled()
                }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

final class MapView_Model: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var region = MKCoordinateRegion(center:
                            CLLocationCoordinate2D(latitude: 33.34708, longitude: -111.8154),
                                                   span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))

    var locationManager: CLLocationManager?
    
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        } else {
            print("Show alert letting user know this is off and to go to settings.")
        }
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {

        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location is restricted due to parental control")
        case .denied:
            print("You have denied location permissoion. Go into settings to change it")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
