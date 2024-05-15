//
//  PopUpView.swift
//  Mommy
//
//  Created by Bruna Veiga Chalegre de Lira on 14/05/24.
//

import SwiftUI

struct PopUpView: View {
    
    @State var name: String = ""
    @State var frequencia: Int = 1
    @State var ultimaVez: Int = 1
    @State var time = Date()
    @State var star1: Bool = false
    @State var star2: Bool = false
    @State var star3: Bool = false
    @State var star4: Bool = false
    @State var star5: Bool = false
    @Binding var isActive: Bool
    
    var body: some View {

        
        if isActive {
            ZStack {
                Color.black.opacity(0.3)
                
                VStack (alignment: .leading, spacing: 0.0) {
                    
                    Spacer()
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {isActive = false}) {
                            Text("SAIR")
                                .font(.exitText)
                                .foregroundStyle(.exitButton)
                        }
                        
                    }
                    .padding()
                    
                    VStack(alignment: .leading, spacing: 0.0) {
                        
                        Text("NOME DA ATIVIDADE:")
                            .font(.header)
                            .foregroundStyle(.mainText)
                        
                        ZStack {
                            Rectangle()
                                .foregroundColor(.activityTemplate)
                                .cornerRadius(6.0)
                                .frame(height: 35)
                            TextField("ex. varrer casa",
                                      text: $name)
                            .padding()
                            
                        }
                        .font(.activitySubtitle)
                        
                    }
                    .padding()
                    
                    VStack(alignment: .leading, spacing: 0.0) {
                        
                        Text("FREQUÊNCIA:")
                            .font(.header)
                            .foregroundStyle(.mainText)
                        
                        HStack {
                            
                            Text("A CADA")
                            
                            ZStack {
                                Rectangle()
                                    .frame(width: 60)
                                    .frame(height: 30)
                                    .foregroundColor(.activityTemplate)
                                    .cornerRadius(6.0)
                                
                                Picker("Picker de frequencia", selection:
                                    $frequencia) {
                                    
                                    ForEach(1 ... 365, id: \.self) { number in
                                        Text(String(number)).tag(number)
                                    }
                                    
                                }
                                .pickerStyle(.menu)
                            .frame(minWidth: 80)
                            }
                            
                            
                            Text("DIAS")
                            
                        }
                        .font(.popupText)
                        .foregroundStyle(.mainText)
                        
                    }
                    .padding()
                    
                    VStack(alignment: .leading, spacing: 0.0) {
                        
                        Text("ÚLTIMA VEZ QUE FIZ:")
                            .font(.header)
                            .foregroundStyle(.mainText)
                        
                        HStack {
                            
                            Text("HÁ")
                            
                            ZStack {
                                Rectangle()
                                    .frame(width: 60)
                                    .frame(height: 30)
                                    .foregroundColor(.activityTemplate)
                                    .cornerRadius(6.0)
                                
                                Picker("Picker de frequencia", selection:
                                    $ultimaVez) {
                                    
                                    ForEach(1 ... 365, id: \.self) { number in
                                        Text(String(number)).tag(number)
                                    }
                                    
                                }
                                .pickerStyle(.menu)
                            .frame(minWidth: 80)
                            }
                            
                            Text("DIAS")
                            
                        }
                        .font(.popupText)
                        .foregroundStyle(.mainText)
                        
                    }
                    .padding()

                    VStack(alignment: .leading, spacing: 0.0) {
                        
                        Text("DURAÇÃO:")
                            .font(.header)
                            .foregroundStyle(.mainText)
                        
                        DatePicker("", selection: $time, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                        
                    }
                    .padding()
                        
                    VStack(alignment: .leading, spacing: 10.0) {
                        Text("O QUANTO GOSTO:")
                            .font(.header)
                            .foregroundStyle(.mainText)
                        
                        HStack {
                            Button(action: {
                                if star1 == true {
                                    star1 = false
                                    star2 = false
                                    star3 = false
                                    star4 = false
                                    star5 = false
                                } else {
                                    star1 = true
                                }
                            }) { 
                                
                                if star1 == true {
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 30)
                                } else {
                                    Image(systemName: "star")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 30)
                                }
                    
                            }
                            
                            Button(action: {
                                if star2 == true {
                                    star2 = false
                                    star3 = false
                                    star4 = false
                                    star5 = false
                                } else {
                                    star1 = true
                                    star2 = true
                                }
                            }) {
                                if star2 == true {
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxHeight: 30)
                                } else {
                                    Image(systemName: "star")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxHeight: 30)
                                }
                            }
                            
                            Button(action: {
                                if star3 == true {
                                    star3 = false
                                    star4 = false
                                    star5 = false
                                } else {
                                    star1 = true
                                    star2 = true
                                    star3 = true
                                }
                            }) {
                                if star3 == true {
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxHeight: 30)
                                } else {
                                    Image(systemName: "star")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxHeight: 30)
                                }
                            }
                            
                            Button(action: {
                                if star4 == true {
                                    star4 = false
                                    star5 = false
                                } else {
                                    star1 = true
                                    star2 = true
                                    star3 = true
                                    star4 = true
                                }
                            }) {
                                if star4 == true {
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxHeight: 30)
                                } else {
                                    Image(systemName: "star")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxHeight: 30)
                                }
                            }
                            
                            Button(action: {
                                if star5 == true {
                                    star5 = false

                                } else {
                                    star1 = true
                                    star2 = true
                                    star3 = true
                                    star4 = true
                                    star5 = true
                                }
                            }) {
                                if star5 == true {
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxHeight: 30)
                                } else {
                                    Image(systemName: "star")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxHeight: 30)
                                }
                                
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.main)
                        
                    }
                    .padding()
                    
                    
                    Button(action: {}) {
                        ZStack {
                            Color.main
                            Text("COMPUTAR")
                                .foregroundStyle(.fundo)
                                .font(.buttonText)
                        }
                    }
                    .frame(height: 40)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(6.0)
                    .padding()
                    
                    Spacer()
                    
                }
                .frame(width: 350.0, height: 570.0)
                .background(.fundo)
                .textFieldStyle(.plain)
                .keyboardType(.default)
                .cornerRadius(10.0)
                
            }
            .ignoresSafeArea()
            
        } else {
            EmptyView()
        }
            
        
            
    }
    
}

#Preview {
    PopUpView(isActive: .constant(true))
}
