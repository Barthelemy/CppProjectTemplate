///
/// @file    World.cxx
/// @author  Barthelemy von Haller
///

#include "ProjA/World.h"

#include <iostream>

namespace ProjectTemplate {
namespace ProjA {

void World::greet()
{
  std::cout << "ProjA world!!" << std::endl;
}

int World::returnsN(int n)
{

  /// \todo This is how you can markup a todo in your code that will show up in the documentation of your project.
  /// \bug This is how you annotate a bug in your code.
  return n;
}

} // namespace ProjA
} // namespace ProjectTemplate
