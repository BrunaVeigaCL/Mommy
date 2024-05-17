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
    
    var body: some View {
        
        HStack (alignment: .center, spacing: 20){
            
            ZStack {
                Circle()
                    .scaledToFit()
                    .frame(width: 80)
                    .foregroundColor(.activity1)
                    .opacity(activity.opacidade)
                
                Text("\(String(activity.nota))")
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
                Text("\(activity.duracao) min")
                    .font(.activitySecondSubtitle)
                    .foregroundStyle(.tertiaryText)
                
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
        .padding(25.0)
        
    }
}

#Preview {
    ActivitysView(activity: .constant(Atividade(nome: "TESTE", frequencia: 10, ultimaVez: 10, duracao: 10, gosto: 20)), didTapRemove: {print("removeu")})
}
