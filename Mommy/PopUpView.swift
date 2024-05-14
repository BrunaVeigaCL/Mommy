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
    
    
    var body: some View {
    
        
        ZStack {
            
            Color.black
            
            VStack (alignment: .leading) {
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
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
                
                VStack(alignment: .leading) {
                    
                    Text("NOME DA ATIVIDADE:")
                        .font(.header)
                        .foregroundStyle(.mainText)
                    
                    HStack {
                        
                        Text("A CADA")
                        
                        Picker("Picker de frequencia", selection: $frequencia) {
                            
                            ForEach(1 ... 365, id: \.self) { number in
                                Text(String(number)).tag(number)
                            }
                            
                        }
                        .pickerStyle(.menu)
                        .compositingGroup()
                        .clipped()
                        
                        Text("DIAS")
                        
                    }
                    .font(.popupText)
                    
                }
                .padding()
                

                    
                
            }
            .frame(width: 350.0, height: 510.0)
            .background(.fundo)
            .textFieldStyle(.plain)
            .keyboardType(.default)
            
            
            
        }
        .ignoresSafeArea()
            
        
            
    }
    
}

#Preview {
    PopUpView()
}
