using namespace std;

class LoopInfo {

public:

  string condition = "";
  string init = "";
  string increment = "";
  string body = "";
  int size = 0;
  string iterator = "";
  vector<string> variables_used;
  vector<string> variables_declared;
  vector<string> functions_called;
  bool is_while = false;

  string variables_used_str();
  string variables_declared_str();
  string functions_called_str();
  string to_str();
  string source();
  string print_vector(vector<string>, string);
};

string LoopInfo::print_vector(vector<string> vec, string str) {
  if (vec.size() > 0) {
      vector<string>::iterator it = vec.begin();
      str += *it;
      for(it++; it != vec.end(); ++it) {
        str += "," + *it;
      }
  }
  return str+"\n";  
}

string LoopInfo::variables_used_str() {
  return print_vector(this->variables_used, "USED: ");
}

string LoopInfo::variables_declared_str() {
  return print_vector(this->variables_declared, "DECLARED: ");
}
  
string LoopInfo::functions_called_str() {
  return print_vector(this->functions_called, "FUNCTIONS: ");  
}
  
string LoopInfo::to_str() {
  string src = this->source();
  string vars_used = this->variables_used_str();
  string vars_decd = this->variables_declared_str();
  string funcs_called = this->functions_called_str();
  string sep = "==============\n";
  string str = sep + src + sep + "\n" + vars_used + vars_decd + funcs_called;
  str += "Iterator: " + this->iterator + "\n";
  str += "Size: " + to_string(this->size) + "\n";
  str += sep;
  return str;
}
  
string LoopInfo::source() {
  if (this->is_while) {
    return "while("+condition+")"+body+"\n";      
  }
  return "for("+init+condition+increment+")"+body+"\n";
}
