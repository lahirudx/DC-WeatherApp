//
//  ContentView.swift
//  WeatherApp
//
//  Created by Lahiru Amarasooriya on 2023-10-06.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var locationManager = LocationManager() 
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                Text("Your coordinates are: \(location.longitude) \(location.latitude)")
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
            
           
        }
        .background(Color(hue: 0.69, saturation: 0.586, brightness: 0.332))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
