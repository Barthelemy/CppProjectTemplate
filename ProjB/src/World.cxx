///
/// @file    World.cxx
/// @author  Barthelemy von Haller
///

#include "ProjB/World.h"

#include <iostream>

namespace ProjectTemplate {
namespace ProjB {

void World::greet()
{
  std::cout << "ProjB world!!" << std::endl;
}

int World::returnsN(int n)
{

  /// \todo This is how you can markup a todo in your code that will show up in the documentation of your project.
  /// \bug This is how you annotate a bug in your code.
  return n;
}

} // namespace ProjB
} // namespace ProjectTemplate
