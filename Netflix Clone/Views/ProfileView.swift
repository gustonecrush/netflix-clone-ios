//
//  ProfileView.swift
//  Netflix Clone
//
//  Created by A Farhan Agustiansyah on 13/05/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Image("user")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 130, height: 130)
                        .padding(22)
                        .padding(.top, 50)
                        .cornerRadius(25)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                
                VStack {
                    Text("Gustonecrush")
                        .font(.title)
                        .fontWeight(.bold)
                        .offset(x: 35, y: -40)
                    
                    Text("")
                }
            }
            .navigationBarHidden(true)
            .preferredColorScheme(.dark)
            .edgesIgnoringSafeArea([.top, .bottom])
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
