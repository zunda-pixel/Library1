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
