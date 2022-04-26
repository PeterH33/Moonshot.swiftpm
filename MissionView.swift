import SwiftUI



struct MissionView: View {
    let mission: Mission
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let crew: [CrewMember]
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
    
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image("\(mission.image)@2x")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6, maxHeight: geometry.size.height * 0.3)
                        .padding(.top)
                    
                    Text(mission.formattedLaunchDate)
                        .font(.title2.bold())
                    
                    CrewScrollView(mission: mission, astronauts: astronauts)
                    DividerView() //Just a challenge question to put this into its own view
                    
                    VStack(alignment: .leading) {
                        
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                    }//end mission description VStack
                    .padding(.horizontal)
                    
                }//end vStack
                .padding(.bottom)
            }//end scroll view
        }//end geometry reader
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}



struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts)
    }
}
