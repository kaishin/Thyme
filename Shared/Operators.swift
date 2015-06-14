infix operator |> { associativity left precedence 150 }

public func |> (lhs: Path, rhs: Path -> Path) -> Path {
  return rhs(lhs)
}
