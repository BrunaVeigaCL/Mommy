//
//  InformationView.swift
//  Mommy
//
//  Created by Bruna Veiga Chalegre de Lira on 18/05/24.
//

import SwiftUI

struct InformationView: View {
    
    @Binding var isInformationActive: Bool
    
    var body: some View {
        
        if isInformationActive == true {
            ZStack {
                Color.black.opacity(0.3)
                    .onTapGesture {
                        isInformationActive = false
                    }
                
                VStack (spacing: 2.0) {
                    HStack {
                        Spacer()
                        
                        Button (action: {
                            isInformationActive = false
                        }) {
                            Text("Sair")
                                .foregroundStyle(.exitButton)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    
                    Spacer()
                    
                    Text("TEM TANTAS ATIVIDADES QUE NÃO SABE POR ONDE COMEÇAR?")
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.bottom, 30)
                        .font(.informationTitle)
                        .foregroundColor(.mainText)
                        
                    
                    Text("O MOMMY É UMA FERRAMENTA PARA TE AJUDAR A ORGANIZAR SUAS ATIVIDADES EM ORDEM DE PRIORIDADE")
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 25)
                        .padding(.bottom, 15)
                        .font(.informationSubtitle)
                        .foregroundColor(.main)
                    
                    Text("AS ATIVIDADES SERÃO ORDENADAS COM BASE EM UMA NOTA CALCULADA A PARTIR DAS INFORMAÇÕES QUE VOCÊ FORNECER")
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 25)
                        .padding(.bottom, 15)
                        .font(.informationSubtitle)
                        .foregroundColor(.main)
                        
                    
                    Spacer()
                }
                .frame(height: 350)
                .frame(width: 300)
                .background(.fundo)
                .cornerRadius(10.0)
                .animation(.easeInOut(duration: 0.5), value: isInformationActive)
                
            }
            .ignoresSafeArea()
        }
        else {
            EmptyView()
        }
    }
}

#Preview {
    InformationView(isInformationActive: .constant(true))
}
