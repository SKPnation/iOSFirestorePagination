//
//  ContentView.swift
//  FirestorePagination
//
//  Created by Ayomide Ajayi on 08/01/2021.
//  Copyright © 2021 Skiplab Innovation. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    
    @State var data : [User] = []
    
    var body: some View{
        
        VStack(spacing: 0){
            
            HStack(spacing: 22){
                
                Button(action: {
                    //..
                }) {
                    Image(systemName: "line.horizontal.3.decrease")
                        .font(.system(size: 23))
                        .foregroundColor(.white)
                }
                Text("Firebase")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer(minLength: 0)
            }
            .padding(EdgeInsets.init(top: 40, leading: 16, bottom: 16, trailing: 16))
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .background(Color.red)
            
            if !self.data.isEmpty{
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 15){
                        
                        ForEach(self.data){i in
                            
                            ZStack{
                                
                                //Showing Only When Data is Loading
                                if i.show && i.name == ""{
                                    // Shimmer Card..
                                                                        
                                    HStack(spacing: 15){
                                                                            
                                    //Circle()
                                    //    .fill(Color.black.opacity(0.09))
                                    //    .frame(width: 75, height: 75)
                                                                            
                                        VStack(alignment: .leading, spacing: 12) {
                                                                                
                                            Rectangle()
                                                .fill(Color.black.opacity(0.09))
                                                .frame(width: 250, height: 15)
                                                                                
                                            Rectangle()
                                                .fill(Color.black.opacity(0.09))
                                                .frame(width: 100, height: 15)
                                        }
                                                                            
                                        Spacer(minLength: 0)
                                    }
                                                                        
                                    // Shimmer Animation...
                                                                        
                                    HStack(spacing: 15){
                                                                            
                                    //Circle()
                                    //  .fill(Color.white.opacity(0.6))
                                    //  .frame(width: 75, height: 75)
                                                                            
                                        VStack(alignment: .leading, spacing: 12) {
                                                                                
                                            Rectangle()
                                                .fill(Color.white.opacity(0.6))
                                                .frame(width: 250, height: 15)
                                                                                
                                            Rectangle()
                                                .fill(Color.white.opacity(0.6))
                                                .frame(width: 100, height: 15)
                                        }
                                                                            
                                        Spacer(minLength: 0)
                                    }
                                    //Masking View
                                    .mask(
                                                                        
                                        Rectangle()
                                            .fill(Color.white.opacity(0.6))
                                            .rotationEffect(.init(degrees: 70))
                                        // Moving View....
                                            .offset(x: i.show ? 1000 : -350)
                                    )
                                }
                                else{
                                    
                                    //Show Original Data...
                                }
                            }
                        .padding()
                        }
                    }
                }
            }
            
            Spacer(minLength: 0)
        }
        .background(Color.black.opacity(0.05)).edgesIgnoringSafeArea(.all)
        .edgesIgnoringSafeArea(.top)
        .onAppear{
            
            self.loadTempData()
        }
    }
    
    //Initial Shimmer User data
    //Showing Until Data Is Loading...
    
    func loadTempData(){
        
        for i in 0...19 {
            
            let temp = User(id: "\(i)", name: "", email: "", show: false)
            
            self.data.append(temp)
            
            //Enabling Animation
            
            withAnimation(Animation.linear(duration: 1.5).repeatForever(
                autoreverses: false)){
                
                self.data[i].show.toggle()
            }
        }
    }
    
    
}

//Data Model

struct User : Identifiable {
    var id : String
    var name : String
    var email : String
    var show: Bool
}
