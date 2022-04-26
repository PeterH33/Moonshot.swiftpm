import SwiftUI

//Day 76 Challenge
// Do a full accessibility review of Moonshot – what changes do you need to make so that it’s fully accessible?
//Accessibility Review:
//


struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var showingGrid = true
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            Group {
                if showingGrid {
                    MissionGridView(missions: missions, astronauts: astronauts)
                } else {
                    MissionListView(missions: missions, astronauts: astronauts)
                }
            }
            
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button(action: {showingGrid.toggle()}){
                        showingGrid ? Image( systemName: "list.dash") : Image(systemName: "square.grid.2x2")
                    }
                }
            }
            
        }
        
    }
}

