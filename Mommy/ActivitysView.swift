//
//  activitysVView.swift
//  Mommy
//
//  Created by Bruna Veiga Chalegre de Lira on 16/05/24.
//

import SwiftUI

struct ActivitysView: View {
    
    @Binding var activity: Atividade
    var didTapRemove: () -> Void
    var opacidade: Double
    
    var body: some View {
        
        HStack (alignment: .center, spacing: 20){
            
            ZStack {
                Circle()
                    .scaledToFit()
                    .frame(width: 80)
                    .foregroundColor(.activity1)
                    .opacity(opacidade)
                
                    let notaCom1CasaDec = String(format: "%.1f", activity.nota)
                
                
                Text("\(notaCom1CasaDec)")
                    .font(.activityNote)
                    .foregroundStyle(.fundo)
            }
            
            VStack (alignment: .leading) {
                
                Text(activity.nome)
                    .font(.activityTitle)
                    .foregroundStyle(.mainText)
                Text("REALIZADA A \(activity.ultimaVez) DIAS")
                    .font(.activitySubtitle)
                    .foregroundStyle(.main)
                if activity.duracao == 60 {
                    Text("+1 h")
                        .font(.activitySecondSubtitle)
                        .foregroundStyle(.tertiaryText)
                } else {
                    Text("\(activity.duracao) min")
                        .font(.activitySecondSubtitle)
                        .foregroundStyle(.tertiaryText)
                }
                
            }
            Spacer()
            
            Button(action: {
                didTapRemove()
            }) {
                Image(systemName: "trash")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
                    .foregroundColor(.mainText)
            }
                
            
            
        }
        .padding(.horizontal, 25.0)
        
    }
}

#Preview {
    ActivitysView(activity: .constant(Atividade(nome: "TESTE", frequencia: 1, ultimaVez:365, duracao: 10, gosto: 5)), didTapRemove: {print("removeu")}, opacidade: 1.0)
}
