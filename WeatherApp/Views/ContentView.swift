//
//  ContentView.swift
//  WeatherApp
//
//  Created by Dev Patel on 05/05/24.
//

import SwiftUI
import CoreLocation
struct ContentView: View {
    var body: some View {
        @StateObject var locationManager = LocationManager()
        var weatherManager = WeatherManager()
        @State var weather:ResponseBody?
        
        VStack {
            
            if let location = locationManager.location{
                if let weather = weather{
                    WeatherView(weather: weather)
                }else{
                    LoadingView()
                        .task {
                            do{
                                 weather=try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            }catch{
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            }else{
                if locationManager.isLoading{
                    LoadingView()
                }else{
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
            
        }
        .background(Color(hue: 0.702, saturation: 0.909, brightness: 0.686))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
