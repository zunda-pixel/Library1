import Testing
import Library1
import RegexBuilder

@Test(arguments: ["Name1", "Name2", "Name3"])
func name(name: String) {
  let regex = Regex {
    Anchor.startOfLine
    "Name"
    OneOrMore(.digit)
    Anchor.endOfLine
  }
  
  #expect(name.starts(with: regex))
}

@Test(arguments: [
  ("Name1", 1),
  ("Name2", 2),
  ("Name3", 3)
])
func name(name: String, age: Int) throws {
  let captureAge = Reference<Int>()
  
  let regex = Regex {
    Anchor.startOfLine
    "Name"
    TryCapture(as: captureAge) {
      OneOrMore(.digit)
    } transform: {
      Int($0)
    }
    Anchor.endOfLine
  }
  
  let metch = try #require(name.wholeMatch(of: regex))

  #expect(metch[captureAge] == age)
}

@Test(arguments: [
  (name: "Name1", age :1),
  (name: "Name2", age: 2),
  (name: "Name3", age: 3)
])
func nameWithLabel(name: String, age: Int) throws {
  let captureAge = Reference<Int>()
  
  let regex = Regex {
    Anchor.startOfLine
    "Name"
    TryCapture(as: captureAge) {
      OneOrMore(.digit)
    } transform: {
      Int($0)
    }
    Anchor.endOfLine
  }
  
  let metch = try #require(name.wholeMatch(of: regex))

  #expect(metch[captureAge] == age)
}
