#include <cstdio>
#include <iostream>

const char mpiver_str[] = { 'I', 'N',
                            'F', 'O',
                            ':', 'M',
                            'P', 'I',
                            '-', 'V',
                            'E', 'R',
                            '[', '1',
                            '.', '1',
                            ']', '\0' };


int main(int argc, char* argv[])
{
  std::cout << mpiver_str << std::endl;
  for(int i = 0; i < argc; ++i )
  {
    std::cout << argv[i] << std::endl;
  }
  return 0;
}
