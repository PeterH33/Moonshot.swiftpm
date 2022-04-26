import SwiftUI

struct MissionGridView: View {
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
        
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(missions) { mission in
                    
                    NavigationLink {
                        //Text("Detail view")
                        MissionView(mission: mission, astronauts: astronauts)
                    } label: {
                        VStack {
                            //Text("image id \(mission.image)")
                            //kinda odd that playgrounds is not loading the @2x and @3x automatically, wonder if that is a real problem or just a minor bug. Playgrounds probably isn't up to real app development yet, so strange...
                            Image("\(mission.image)@2x")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                            //TODO this formatting needs corection to maintain aspect ratios better, appolo 14 looks odd, and the spacings are kinda inconsistent between the images of the badges
                            
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.5))
                            }
                            
                            
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                        )
                    }
                }
                
            }
            .padding([.horizontal, .bottom])
        }
        .navigationTitle("Moonshot")
        .preferredColorScheme(.dark)
    }
}


