//
//  ContentView.swift
//  WeatherApp
//
//  Created by Lahiru Amarasooriya on 2023-10-06.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()
    var weatherManger = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                if let weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherManger.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Error getting weather: \(error.localizedDescription)")
                            }
                        }
                }
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
