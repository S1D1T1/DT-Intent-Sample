//  DTIntentsApp.swift
//  DTIntents
//
//

import SwiftUI

@main
struct DTIntentsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
  @State var request = IntentRequest.shared
  var body: some View {
    VStack(alignment: .leading)
    {
      Text("Draw Things AppIntent Testbed").font(.title).bold().padding(.bottom)
      Text("Intents (shortcuts) Available:").fontWeight(.semibold).font(.title2).padding(.bottom,5)
      Group{
        Text("Run Prompt (text)")
        Text("Draw Thing (json)")
        Text("Run Script by name")
        Text("Execute JS\nGet Image Folder Path\n")
      }
        .padding(.leading)

      Text("Last Request Status:").fontWeight(.semibold).font(.title2)

      ScrollView {
        VStack(alignment: .leading){
          if  request.type != .none
          {
            Text("Request: \(request.type.rawValue)").fontWeight(.semibold)
            Text("Args:").fontWeight(.semibold)
            Text(request.args)        .frame(maxHeight: 500)
          }
          else{
            Text("no requests")
          }

          Spacer()
        }
        .padding([.top,.leading],10)
        .padding(.trailing,200)
        .border(.gray)
        .background(.quaternary)
      }
    }
    .padding()

  }
}

#Preview {
    ContentView()
}
