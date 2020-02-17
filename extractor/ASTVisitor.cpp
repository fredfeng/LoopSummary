#include "ASTVisitor.hpp"

namespace Sif {

  static bool in_loop = false;
  static bool in_loopinit = false;  
  static std::vector<ASTNode*> seen_loops;
  static std::map<std::string, std::string> type_table;

  std::string function_call_source_code(FunctionCallNode* fn, Indentation& _indentation) {
    Indentation empty_indentation(0);
    std::string result = fn->get_added_text_before() + fn->get_callee()->source_code(empty_indentation) + "(";
    for (int i = 0; i < fn->num_arguments(); i++ ) {
      result += fn->get_argument(i)->source_code(empty_indentation);
      if (i != fn->num_arguments()-1) {
	result += ", ";
      }
    }
    result += ")" + fn->get_added_text_after();
    return result;
  }

  
  std::string for_source_code(ForStatementNode* fs, Indentation& _indentation) {
    // visit(this);
    std::string condition_str = "; ";
    Indentation empty_indentation(0);
    if (fs->get_condition() != nullptr) condition_str = fs->get_condition()->source_code(empty_indentation) + "; ";

    std::string init_str = "; ";
    if (fs->get_init() != nullptr) init_str = fs->get_init()->source_code(empty_indentation) + " ";

    std::string increment_str = "";
    if (fs->get_increment() != nullptr) {
      increment_str = fs->get_increment()->source_code(empty_indentation);
      size_t increment_str_len = increment_str.length();
      for (int i = increment_str.length() - 1; i >= 0; --i) {
  	char ch = increment_str[i];
  	if (ch == ' ' || ch == '\n') {
  	  --increment_str_len;
  	} else if (ch == ';') {
  	  --increment_str_len;
  	  break;
  	} else {
  	  break;
  	}
      }
      increment_str = increment_str.substr(0, increment_str_len);
    }

    std::string result = "//#LOOP_BEGIN\n" +
      fs->get_added_text_before()
      + _indentation + "for (" + init_str + condition_str + increment_str + ") " 
      + fs->get_body()->source_code(_indentation) + "\n"
      + fs->get_added_text_after()
      + "//#LOOP_END\n";
    return result;
  }

  std::string while_source_code(WhileStatementNode* ws, Indentation& _indentation) {
    Indentation empty_indentation(0);
    std::string result = "//#LOOP_BEGIN\n" + ws->get_added_text_before() + _indentation + "while(" + ws->get_condition()->source_code(empty_indentation) + ") " + ws->get_loop_body()->source_code(_indentation) + "\n" + ws->get_added_text_after() + "//#LOOP_END\n";
    return result;
  }
  

  void before(std::string arg) {
    return;
  }

  void visit(ASTNode* node) {
    if (node->get_node_type() == NodeTypeForStatement &&
    	std::count(seen_loops.begin(), seen_loops.end(), node) == 0) {
      in_loop = true;
      seen_loops.push_back(node);      
      Indentation empty(0);
      ForStatementNode* fs = (ForStatementNode*) node;

      BlockNodePtr fb = std::static_pointer_cast<BlockNode>(fs->get_body());
      std::cout << "//#NUMLINES: " << fb->num_statements() << "\n";
      in_loopinit = true;
      fs->get_init()->source_code(empty);
      in_loopinit = false;
      std::cout << for_source_code(fs, empty) << "\n";
      in_loop = false;
    }
    if (node->get_node_type() == NodeTypeWhileStatement &&
    	std::count(seen_loops.begin(), seen_loops.end(), node) == 0) {
      in_loop = true;
      seen_loops.push_back(node);      
      Indentation empty(0);
      WhileStatementNode* ws = (WhileStatementNode*) node;

      BlockNodePtr wb = std::static_pointer_cast<BlockNode>(ws->get_loop_body());
      std::cout << "//#NUMLINES: " << wb->num_statements() << "\n";
      std::cout << while_source_code(ws, empty) << "\n";
      in_loop = false;
    }
    if (node->get_node_type() == NodeTypeVariableDeclaration) {
      Indentation empty(0);
      std::string var_name = ((VariableDeclarationNode*) node)->get_variable_name();
      std::string var_type = ((VariableDeclarationNode*) node)->get_type()->source_code(empty);
      type_table[var_name] = var_type;
      // std::cout << var_name << ", " << var_type << "\n";
      if (in_loopinit) {
	std::cout << "//#LOOPVAR: " << var_name << "\n";
      }
    }
    if (node->get_node_type() == NodeTypeAssignment && in_loopinit) {
      Indentation empty(0);
      std::string var = ((AssignmentNode *) node)->get_left_hand_operand()->source_code(empty);
      std::cout << "//#LOOPVAR: " << var << "\n";
    }
    if (node->get_node_type() == NodeTypeVariableDeclaration && in_loop) {
      std::cout << "//#DECLARED: " << ((VariableDeclarationNode*) node)->get_variable_name() << "\n";
    }
    if (node->get_node_type() == NodeTypeIdentifier && in_loop) {
      std::string var_name = ((IdentifierNode*) node)->get_name();
      std::string var_type = type_table[var_name];
      std::cout << "//#USED: " << var_name << ", " << var_type << "\n";      
    }
    if (node->get_node_type() == NodeTypeFunctionCall && in_loop) {
      Indentation empty(0);
      // std::string func_name = ((FunctionCallNode*) node)->source_code(empty);
      std::string func_name = function_call_source_code(((FunctionCallNode*) node), empty);
      std::cout << "//#FUNC: " << func_name << "\n";
    }
    if (node->get_node_type() == NodeTypeUsingForDirective && std::count(seen_loops.begin(), seen_loops.end(), node) == 0) {
      seen_loops.push_back(node);      
      std::string using_name = ((UsingForDirectiveNode*) node)->get_using();
      if (using_name.compare("SafeMath") == 0) {
    	std::cout << "//#USINGSAFEMATH\n";
      }
    }
    return;
  }

  void after() {
    return;
  }

}
