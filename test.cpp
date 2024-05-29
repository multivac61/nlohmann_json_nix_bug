#include <nlohmann/json.hpp>

int main() {
  using json = nlohmann::json;

  json ex1 = json::parse(R"(
    {
      "pi": 3.141,
      "happy": true
    }
  )");

  return 0;
}
