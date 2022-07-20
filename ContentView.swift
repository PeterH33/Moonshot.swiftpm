import SwiftUI

//Day 76 Challenge
// Do a full accessibility review of Moonshot – what changes do you need to make so that it’s fully accessible?
//Accessibility Review:
//☑️VOA pronounces moonshot wrong, further review of the descriptions shows that the VO very often mispronounces things, whether this is acceptable or not is in question.
//☑️Menu button is called "list - button"
//☑️Apollo 1 button is saying N/A change to never flew or something along those lines, maybe the launch attempt date, Further review, this is probably the best way to label the "launch date" of the mission, it is a sad thing that can be highlighted in this way.
//☑️Main screen buttons are saying the crew names after a delay, not much reason for that (It was a description of the badges)
//The mission badges should be described or made to be ignored by the VOA, because default is doing strange things
//☑️It seems like you can not scroll through a lazygrid, but you can swipe left and right to toggle through all of the VOA blocks anyways. Assume this is a default behavior that should not be messed with, get advice from full time VO user
//☑️Astronaut images are very similar to the badges, They should either have a full description attached, or set to be ignored. For right now we are going with ignore.


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
                    .accessibilityLabel("Change layout")
                }
            }
            
        }
        
    }
}

