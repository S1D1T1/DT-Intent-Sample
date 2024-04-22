//
//  DTIntents.swift
//  DTIntents
//

import Foundation
import AppIntents

@Observable 
class IntentRequest {
  static var shared = IntentRequest()
  var type:IntentType = .none
  var args:String=""
}

enum IntentType :String {
  case none,RunPrompt,RunScriptName,RunScriptJS,DrawJSON,GetImageFolder
}

// other possibilities: Get list of scripts, get path to script folder

struct RunPromptIntent : AppIntent {

  // this is the title as it appears in the list of shortcuts
  static var title:LocalizedStringResource = "Generate image from prompt"


  // this is what you see from clicking the ⓘ
  static var description: IntentDescription = "Generate image from prompt"

  @Parameter(title: "Prompt")
  var promptString: String

  @Parameter(title: "Negative Prompt")
  var negPromptString: String?

  static var parameterSummary: some ParameterSummary {
    Summary("Create image of: \(\.$promptString), Negative Prompt (optional): \(\.$negPromptString)")
  }


  func perform() async throws -> some ReturnsValue<String> {
    IntentRequest.shared.type = .RunPrompt
    IntentRequest.shared.args = "Prompt: \(promptString), \nNegative Prompt:\(negPromptString ?? "")"

    return .result(value:"success/fail / fileURL? / PNG Data?")
  }
}

struct GenerateFromJsonIntent : AppIntent {
  static var title:LocalizedStringResource = "Generate image from JSON"
  static var description: IntentDescription = "Generate image from JSON. \nThe origins of JSON actually go way back to an obscure Bavarian physicist in the early 1900's..."

  @Parameter(title: "Image Parameters (json)")
  var jsonParams: String

  static var parameterSummary: some ParameterSummary {
    Summary("Create image from parameters: \(\.$jsonParams)")
  }

  func perform() async throws -> some ReturnsValue<String> {

    /// syntax check JSON up front.
    IntentRequest.shared.type = .DrawJSON
    IntentRequest.shared.args = "JSON: \(jsonParams)"

    return .result(value:"Success/ Fail / fileURL? / PNG Data?")
  }
}

struct RequestImageFolderIntent : AppIntent {
  static var title:LocalizedStringResource = "Get Image Folder"
  static var description: IntentDescription = "Request Path where Draw Things saves images, if in use"

  func perform() async throws -> some ReturnsValue<String> {
    IntentRequest.shared.type = .GetImageFolder
    IntentRequest.shared.args = "None"

    return .result(value:"Image Folder Path / Fail")
  }
}

struct RunJavaScriptIntent : AppIntent {
  static var title:LocalizedStringResource = "Run Javascript Code"
  static var description: IntentDescription = "Execute the enclosed javascript"

  @Parameter(title: "script")
  var javascript: String

  static var parameterSummary: some ParameterSummary {
    Summary("Run this script: \(\.$javascript)")
  }

  func perform() async throws -> some ReturnsValue<String> {
    IntentRequest.shared.type = .RunScriptJS
    IntentRequest.shared.args = "Javascript:\n \(javascript)"

    return .result(value:"success/ fail / return value")
  }
}

struct RunScriptNameIntent : AppIntent {
  static var title:LocalizedStringResource = "Run Javascript by name"
  static var description: IntentDescription = "Execute one of Draw Things' existing scripts"

  @Parameter(title: "script")
  var scriptName: String

  static var parameterSummary: some ParameterSummary {
    Summary("Run this script: \(\.$scriptName)")
  }

  func perform() async throws -> some ReturnsValue<String> {
    IntentRequest.shared.type = .RunScriptName
    IntentRequest.shared.args = "User Script: \(scriptName)"

    return .result(value:"success / fail / return value")
  }
}
