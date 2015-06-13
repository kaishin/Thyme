/// Runs code condtionally depending on the platform.
func executeOn(iOS iOSBlock: () -> (), mac macBlock: () -> ()) {
  #if os(iOS)
    iOSBlock()
    #else
    macBlock()
  #endif
}
