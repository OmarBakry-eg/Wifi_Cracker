//
//  ContentView.swift
//  Wifi Animation
//
//  Created by Omar Bakry on 20/12/2021.
//

import SwiftUI

struct ContentView: View {
    @State var isOn = false
    @State var showingForm = false
    @State var showingPopup = false
    @State var index : String = "" ;
    @State var color = Color.black
    @State var doneNumber : Double = 0
    let wifiList : [String] = ["Home","Office","NNewUpdate","SwiftUI","Bakry's Home"]
    var body: some View {
        NavigationView {
        VStack{
            ZStack{
                Rectangle()
                    .fill(
                        isOn ? Color(hex:MyColors.green.getColor()) : Color(hex: MyColors.black.getColor())
                ).frame(width :300, height:200)
                    .cornerRadius(15)
                    .animation(.easeInOut, value: isOn)
                    
                VStack{
                    Image(systemName: isOn ? "wifi" : "wifi.slash")
                        .resizable()
                        .scaledToFill()
                        .frame(width:50,height: 50)
                        .foregroundColor(.white)
                        .animation(.linear, value: isOn)
                    
                    Text(isOn ? "Wifi Enabled" : "Wifi Disabled")
                        .font(.title2)
                        .foregroundColor(.white)
                        .animation(.easeInOut, value: isOn)
                    
                    Spacer().frame(height: 20)
                    
                    Toggle(isOn: $isOn, label: {
                       
                    }).labelsHidden()
                        .onChange(of: isOn, perform: {
                            i in
                            withAnimation(Animation.easeInOut)
                            {
                                isOn = i
                            }
                            withAnimation(Animation.easeOut.delay(0.5))
                            {
                                showingForm = i
                            }
                            
                        })
                }
            }
                        
            if showingForm {
                Form{
                ForEach(wifiList,id: \.self) {
                    i in
                    
                    HStack {
                       
                        hStackLeadingView(isConnecting:  index == i, doneNumber: doneNumber)
                        
                        Button(i){
                            if(index == i){
                                doneNumber = 0
                                withAnimation{
                                    color = .black
                                }
                                Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) {_ in
                                    withAnimation
                                    {
                                        doneNumber = 11
                                    }
                                }

                           
                            }
                            else {
                            index = i
                            doneNumber = 0
                            color = .black
                            Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) {_ in
                                withAnimation
                                {
                                doneNumber = 1.5
                                color = .blue
                                showingPopup = true
                                }
                            }
                            
                            }
                        }
                        .alert("Now you're connecting to \(index)'s wifi perfectly", isPresented: $showingPopup, actions: {
                            Button("Back"){}
                        })
                        .foregroundColor(index == i ? color : .black)
                        
                    }
                }
                }

                .frame(height: 400)
                .transition(.scale)
                .background(Color(hex: MyColors.white.getColor()))
                .onAppear {
                    UITableView.appearance().backgroundColor = .clear
                    // to submit our background
                }
                .onDisappear {

                    UITableView.appearance().backgroundColor = .systemGroupedBackground
                    //to reset UITableView background color .
                }
            }
        }

        .frame(maxWidth: .infinity, maxHeight: .infinity) // 1
        .background(Color(hex: MyColors.white.getColor()))
        .navigationBarTitle("Wifi Cracker")

        
    }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
