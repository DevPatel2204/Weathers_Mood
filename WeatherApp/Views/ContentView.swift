//
//  ContentView.swift
//  WeatherApp
//
//  Created by Dev Patel on 05/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        @StateObject var locationManager = LocationManager()
        
        VStack {
            
            if let location = locationManager.location{
                Text("Your coordinates are: \(location.longitude),\(location.latitude)")
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
