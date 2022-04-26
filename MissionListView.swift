import SwiftUI

struct MissionListView: View {
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    init(missions: [Mission], astronauts: [String: Astronaut]){
        self.missions = missions
        self.astronauts = astronauts
        
    }
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(missions) { mission in
                    
                    NavigationLink {
                        //Text("Detail view")
                        MissionView(mission: mission, astronauts: astronauts)
                    } label: {
                        HStack {
                            Image("\(mission.image)@2x")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .accessibilityHidden(true)
                            
                            HStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                Spacer()
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.5))
                            }
                            
                            
                            .padding(.vertical)
                            //.frame(maxWidth: .infinity)
                            
                        }
                        

                    }
                }
                
            }
            .padding([.horizontal, .bottom])
        }//End navigation view
        .navigationTitle("Moonshot")
        .preferredColorScheme(.dark)
    }
}


struct MissionListView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionListView(missions: missions, astronauts: astronauts)
    }
}
