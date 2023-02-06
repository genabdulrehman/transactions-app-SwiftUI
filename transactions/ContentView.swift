//
//  ContentView.swift
//  transactions
//
//  Created by Abdul Rehman on 04/02/2023.
//

import SwiftUI



struct ContentView: View {
    @State var selectedTransaction = false
  
    var body: some View {
        ZStack {
            
            VStack{
                VStack{
                    
                }
                
                // AppBar
                HStack{
                    // Icon one
                    Image(systemName: "star.fill" ).foregroundColor(.black)
                        .frame(width: 40, height: 40)
                        .font(.largeTitle)
                    // Container of add to card
                    Spacer()
                    ZStack{
                        // add to card text
                        Text("Add Card")
                            .foregroundColor(.white)
                            .font(.headline)
                            .bold()
                            .padding()
                    }
                    .background(.black)
                    .cornerRadius(20)
                    .padding()
                }
                .padding(.leading, 20)
              
                
                // card
                CardView()
                
                
                
                ZStack{
                    VStack{
                        // text and Icon
                        HStack{
                            Text("Refer a friend and get \n $15 on your account")
                                .fontWeight(.bold)
                                .font(.title3)
                            
                            // text refer
                            // add icon button
                            Spacer()
                            HStack{
                            Image(systemName: "plus")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                            }
                            .frame(width: 40, height: 40)
                            .background(.black)
                            .cornerRadius(50)
                            
                        }
                        .padding(.top, 20)
                        .padding(.horizontal, 30)
                        Spacer()
                        HStack{
                            ForEach(0..<5){
                                i in
                                HStack{
                                   
                                Image("robert-oppenheimer")
                                        .resizable()
                                        
                                }
                                .frame(width: 50, height: 50)
        //                        .background(.black)
                                .cornerRadius(100)
                                
                            }
                        }
                        .padding(.bottom, 20)
                       
                        
                        
                       
                    }
                   
                }
                .frame(width: 350, height: 160)
                .background(.white)
                .cornerRadius(30)
                .padding(.top, 15)
                .padding(.bottom, 10)
                
                // Transaction and view all title
                
                HStack{
                    Text("Transaction")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    Spacer()
                    Text("Vew all")
                        .foregroundColor(.black.opacity(0.5))
                        .font(.body)
                    
                }
                .padding(.horizontal, 25)
                
                .padding(.bottom, 10)
                
                ScrollView{
                    ForEach(0..<10){
                        i in
                        TransactionView()
                            .onTapGesture {
                                withAnimation(.spring(response: 0.9, dampingFraction: 0.4, blendDuration: 1)){
                                    selectedTransaction.toggle()
                                  
                                }
                               
                            }
                    }
                  
                    
                }
       
                
         
               
    //            List of all transactions
                
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        .background(.brown.opacity(0.6))
    }
}

struct ContentView_Previews: PreviewProvider {
 
    static var previews: some View {
        ContentView()
    }
}

struct ExtractedView: View {
    @State var icon : String
    @State var title : String
    var body: some View {
        VStack{
            HStack{
                // add / send / more
                
                Image(systemName: icon)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                
            }
            .frame(width: 80, height: 45)
            .background(.white)
            .cornerRadius(30)
            .padding(.bottom, 0)
            
            Text(title)
                .foregroundColor(.white.opacity(0.5))
                .padding(.bottom, 5)
            
        }
    }
}

struct CardView: View {
    @State private var isView = false
    var body: some View {
        ZStack{
            
            VStack(alignment: .leading){
                HStack{
                    // available balance
                    Text("Available Balance")
                        .foregroundColor(.white.opacity(0.5))
                    //                        HStack{
                    //
                    //                        }
                    //                        .frame(width: 30, height: 30)
                    //                        .background(.white.opacity(0.5))
                    //                        .cornerRadius(50)
                    //                        .border(.black)
                    Spacer()
                    
                    Circle()
                    
                        .strokeBorder(Color.black,lineWidth: 1)
                        .background(Circle().foregroundColor(Color.white.opacity(0.5)))
                        .frame(width: 40, height: 40)
                    Circle()
                    
                        .strokeBorder(Color.black,lineWidth: 1)
                        .background(Circle().foregroundColor(Color.white.opacity(0.5)))
                        .frame(width: 40, height: 40)
                        .offset(x:-30)
                    // circular Images
                    
                }      .padding(.leading, 20)
                    .onTapGesture {
                        withAnimation(.spring(response: 0.9, dampingFraction: 0.4, blendDuration: 1)){
                            isView.toggle()
                            print("Tab")
                        }
                    }
                
    
                Text("$20,000")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .scaleEffect(isView ? 1.5 : 1)
                    .padding(.horizontal, isView ? 40 : 20)
                // amouut text
                
                HStack(alignment: .center){
                    if(isView){
                        HStack{
                           
                        Image("robert-oppenheimer")
                                .resizable()
                                
                        }
                        .frame(width: 50, height: 50)
//                        .background(.black)
                        .cornerRadius(100)
                        
                 
                        
                        
                }
           

                    ExtractedView(icon: "plus", title:"Add")
                        .offset(x : isView ? 40 : 0)
                    Spacer()
                    ExtractedView(icon: "arrow.up.forward", title:"Send")
                        .offset(x :isView ? 90 : 0 ,y : isView ? -80 : 0)
                    Spacer()
                    ExtractedView(icon: "tablecells.fill.badge.ellipsis", title:"More")
                }
                .padding([.top, .horizontal], 20 )
                
                
                
                
            }
            
        }
        .frame(width: 350, height: 250)
        .background(isView ? .black : .black.opacity(0.9))
        .cornerRadius(20)
        .rotation3DEffect(.degrees( isView ? 10 : 0), axis: (x: 0, y: 1, z: 0))
    }
}

struct TransactionView: View {
    @State  var isZoom = false
  
    var body: some View {
        HStack{
            HStack{
                Image("eth")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 25)
                //                            .foregroundColor(.white)
                //                            .fontWeight(.bold)
            }
            .frame(width: 40, height: 40)
            .background(.white)
            .cornerRadius(50)
            
            VStack(alignment: .leading){
                Text("Abdul Rehman")
                    .font(.title3)
                    .fontWeight(.bold)
                Text("04 Feb, 2023")
                    .foregroundColor(.black.opacity(0.5))
                    .font(.footnote)
            }
            Spacer()
            
            Text("+ $542,40")
                .font(.title3)
                .fontWeight(.bold)
        }
        .padding(.horizontal,isZoom ?40 : 30)
        .frame(height: 50)
        .padding(.vertical, 10)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius:20, style: .continuous))
        .rotation3DEffect(.degrees(isZoom ? 10 : 0), axis: (x: 0, y: 1, z: 0))
      
        .scaleEffect(isZoom ? 1 : 1)
        .onTapGesture {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.3, blendDuration: 1)){
                isZoom.toggle()
            }
        }
       
    }
}
