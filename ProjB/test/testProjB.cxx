///
/// @file    TestHello.cxx
/// @author  Barthelemy von Haller
///

#include "ProjB/World.h"

#define BOOST_TEST_MODULE hello test
#define BOOST_TEST_MAIN
#define BOOST_TEST_DYN_LINK
#include <boost/test/unit_test.hpp>
#include <assert.h>

BOOST_AUTO_TEST_CASE(arithmetic_test)
{
  int a = 1;
  int b = 2;
  BOOST_CHECK_NE(a, b);
  b = a;
  BOOST_CHECK_EQUAL(a, b);
}

BOOST_AUTO_TEST_CASE(hello_test)
{
  ProjectTemplate::ProjB::World world;
  const int ret = world.returnsN(3);
  BOOST_CHECK_EQUAL(ret, 3);
}
