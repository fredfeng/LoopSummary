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
  vector<string> structs_used;
  bool is_while = false;
  bool iterator_decd_in_loop = false;

  string variables_used_str();
  string variables_declared_str();
  string functions_called_str();
  string structs_used_str();
  string structs_source_str(map<string, string>);  
  string to_str(map<string,string>);
  string source();
  string print_vector(vector<string>, string, string);
};

string LoopInfo::print_vector(vector<string> vec, string str, string sep) {
  if (vec.size() > 0) {
      vector<string>::iterator it = vec.begin();
      str += *it;
      for(it++; it != vec.end(); ++it) {
        str += sep + *it;
      }
  }
  return str+"\n";  
}

string LoopInfo::variables_used_str() {
  return print_vector(this->variables_used, "USED: ", ",");
}

string LoopInfo::variables_declared_str() {
  return print_vector(this->variables_declared, "DECLARED: ", ",");
}
  
string LoopInfo::functions_called_str() {
  return print_vector(this->functions_called, "FUNCTIONS: ", ",");  
}
  
string LoopInfo::structs_used_str() {
  return print_vector(this->structs_used, "STRUCTS: ", ",");  
}
  
string LoopInfo::structs_source_str(map<string, string> struct_table) {
  vector<string> vec;
  vector<string>::iterator it=this->structs_used.begin();
  for(; it != this->structs_used.end(); it++) {
    vec.push_back(struct_table[*it]);
  }
  return print_vector(vec, "", "$$$$$$$$$$$$$\n");
}
  
string LoopInfo::to_str(map<string,string> struct_table) {
  string src = this->source();
  string vars_used = this->variables_used_str();
  string vars_decd = this->variables_declared_str();
  string funcs_called = this->functions_called_str();
  string structs_used = this->structs_used_str();
  string structs_source = this->structs_source_str(struct_table);
  string sep = "==============\n";
  string str = sep + src + sep + "\n" + vars_used + vars_decd + funcs_called + structs_used;
  str += "ITERATOR: " + this->iterator + "\n";
  str += "SIZE: " + to_string(this->size) + "\n";
  str += "LOOP DEC: " + to_string(this->iterator_decd_in_loop) + "\n";  
  str += sep;
  str += structs_source + sep;
  return str;
}
  
string LoopInfo::source() {
  if (this->is_while) {
    return "while("+condition+")"+body+"\n";      
  }
  return "for("+init+condition+increment+")"+body+"\n";
}
