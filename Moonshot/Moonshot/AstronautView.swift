//
//  AstronautView.swift
//  Moonshot
//
//  Created by Andrew Holt on 6/12/21.
//  Copyright © 2021 Andrew Holt. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    let missions: [Mission]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                    .resizable()
                    .scaledToFit()
                        .frame(width: geometry.size.width)
                    
                    Text(self.astronaut.description)
                    .padding()
                    .layoutPriority(1)
                    
                    Text("Missions")
                    List {
                        ForEach(self.missions, id: \.self.id) { mission in
                            Text(mission.displayName)
                        }
                    }
                    
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
    
    init(astronaut: Astronaut) {
        self.astronaut = astronaut
        
        var matches = [Mission]()
        
        for mission in missions {
            if mission.crew.first(where: {$0.name == astronaut.id}) != nil {
                matches.append(mission)
            }
        }
    }
    
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronauts[0], missions: missions)
    }
}
