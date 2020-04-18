from tyrell import spec as S

class EnumeratorAST():

    def __init__(self, typ, builder):
        # self.root_node = Node(productions, builder)
        self.builder = builder
        productions = self.builder.get_productions_with_lhs(typ)
        summarize = productions[0]
        self.queue = [FunctionNode(summarize, summarize.rhs, [], builder)]

        self.i = 50
        
    def next_candidate(self):
        # self.i -= 1

        # if self.i == 0:
        #     return None
        
        # If we had a finite grammar, we can run out of candidates
        if self.queue == []:
            return None

        # Pop first node from queue
        fnode = self.queue.pop(0)
        
        # If no more non-terminals, return candidate
        if fnode.complete():
            return fnode.build_candidate()

        # Expand first non-terminal in fnode and add to queue
        fnodes = fnode.expand()
        self.queue += fnodes
        
        # Since we didn't get a concrete candidate, try again
        return self.next_candidate()

class EnumNode():

    def __init__(self, val, builder):
        self.val = val
        self.builder = builder

    def complete(self):
        return True

    def build_candidate(self):
        return self.builder.make_node(self.val)

    def copy(self):
        return self
    
class FunctionNode():

    def __init__(self, func_prod, arg_types, children, builder):
        self.func_prod = func_prod
        # copy arg_types to avoid aliasing
        self.arg_types = list(arg_types)
        self.children = children
        self.builder = builder
        # self.isFunc = True
        
    def complete(self):
        # If all argument types have been expanded
        if self.arg_types == []:
            # A function with its children expanded is complete if
            #  all its children are complete
            return all(map(lambda x: x.complete(), self.children))
            
        return False

    def build_candidate(self):
        built_args = list(map(lambda x: x.build_candidate(),self.children))
        return self.builder.make_node(self.func_prod, built_args)

    def copy(self):
        arg_types = list(self.arg_types)
        children = list(map(lambda c: c.copy() if c != None else None, self.children))

        return FunctionNode(self.func_prod, arg_types, children, self.builder)
        
    def expand(self):
        # Expand root first if there are remaining args
        if len(self.arg_types) > 0:
            arg_type = self.arg_types.pop(0)
            arg_prods = self.builder.get_productions_with_lhs(arg_type)
            index = len(self.children)
            self.children.append(None)
            expanded_nodes = []
            for arg_prod in arg_prods:
                if arg_prod.is_function():
                    new_node = FunctionNode(arg_prod, arg_prod.rhs, [], self.builder)
                else:
                    new_node = EnumNode(arg_prod, self.builder)
                copy_self = self.copy()
                copy_self.children[index] = new_node
                expanded_nodes.append(copy_self)            

            return expanded_nodes

        # If there are children, expand the first one you can
        for i,child in enumerate(self.children):
            if isinstance(child, FunctionNode):
                child_exps = child.expand()
                # If the child was expanded, return a new Function node for each expansion
                if child_exps != []:
                    expanded_nodes = []
                    for child_exp in child_exps:
                        copy_self = self.copy()
                        copy_self.children[i] = child_exp
                        expanded_nodes.append(copy_self)
                    return expanded_nodes
            
        # If no child could be expanded, then no expansions are possible
        return []

    def __str__(self):
        return "{0}, {1}, {2}".format(self.func_prod, len(self.arg_types), len(self.children))
        
class ProductionNode():

    def __init__(self, non_terms, terms):
        self.non_terms = non_terms
        self.terms = terms

    def build_candidate(self):
        return None
    
class Node():

    def __init__(self, productions, builder):
        if (len(productions) == 0):
            raise Exception("No productions given!")

        self.productions = productions
        self.builder = builder
        self.production_index = 0
        self.candidate = self.build_candidate()
        
    def build_candidate(self):
        # Reset children from previous candidate
        self.children = []

        # Return None if no more productions to choose from
        if self.production_index >= len(self.productions):
            return None

        # Fetch next production
        production = self.productions[self.production_index]
        
        # Just build and return if it's a value
        if not production.is_function():
            return self.builder.make_node(production)            

        # If a function, build each argument node and append to children
        for arg_typ in production.rhs:
            arg_node = Node(self.builder.get_productions_with_lhs(arg_typ), self.builder)
            self.children.append(arg_node)

        # Return function candidate
        return self.builder.make_node(production, self.get_children_candidates())

    def get_candidate(self):
        return self.candidate

    def reset(self):
        self.production_index = 0
        self.candidate = self.build_candidate()

    def get_children_candidates(self):
        return list(map(lambda x: x.get_candidate(), self.children))

    def next_candidate(self):
        # Fetch current candidate
        candidate = self.candidate
        # Advance current candidate to next option
        self.advance_candidate()
        # Return current candidate
        return candidate
        
    def advance_candidate(self):        
        # If current candidate is a value, simply fetch the
        #   next candidate and build it
        if self.children == []:
            # Build next candidate
            self.production_index += 1
            self.candidate = self.build_candidate()
            return
            
        # Increment first child by one. If it is out of options,
        #   reset it and go on to next. Continue this until either
        #   all are out of options, or one arg can be set to the next option
        index = 0
        while True:
            new_child_cand = self.children[index].next_candidate()
            if new_child_cand != None or index >= len(self.children):
                break
            self.children[index].reset()
            index += 1

        # If there were no options, this top level candidate is dead.
        if self.children[index].get_candidate() == None:
            # If this is the last candidate, there are no options
            if self.production_index >= len(self.productions):
                return None
            # Otherwise, build a new candidate
            self.production_index += 1
            self.candidate = self.build_candidate()
            return
            
        # Update with next iteration of this top-level candidate
        self.candidate = self.build_candidate()
        
        
