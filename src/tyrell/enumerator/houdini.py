from typing import Set, Optional
from random import Random
from tyrell.enumerator.enumerator import Enumerator
from tyrell import dsl as D
from tyrell import spec as S


class HoudiniEnumerator(Enumerator):
    _rand: Random
    _max_depth: int
    _builder: D.Builder
    _history: list
    
    def __init__(self, spec: S.TyrellSpec, max_depth: int, seed: Optional[int]=None):
        self._rand = Random(seed)
        self._builder = D.Builder(spec)
        self._history = []
        if max_depth <= 0:
            raise ValueError(
                'Max depth cannot be non-positive: {}'.format(max_depth))
        self._max_depth = max_depth

    def _do_generate(self, curr_type: S.Type, curr_depth: int, force_leaf: bool):
        # First, get all the relevant production rules for current type
        productions = self._builder.get_productions_with_lhs(curr_type)
        if force_leaf:
            productions = list(
                filter(lambda x: not x.is_function(), productions))
        if len(productions) == 0:
            raise RuntimeError('RandomASTGenerator ran out of productions to try for type {} at depth {}'.format(
                curr_type, curr_depth))

        # Pick a production rule uniformly at random
        prod = self._rand.choice(productions)
        if not prod.is_function():
            # make_node() will produce a leaf node
            return self._builder.make_node(prod)
        else:
            # Recursively expand the right-hand-side (generating children first)
            children = [self._generate(x, curr_depth + 1) for x in prod.rhs]
            # make_node() will produce an internal node
            return self._builder.make_node(prod, children)

    def _generate(self, curr_type: S.Type, curr_depth: int):
        return self._do_generate(curr_type, curr_depth,
                                 force_leaf=(curr_depth >= self._max_depth - 1))

    def next(self):
        node = self._generate(self._builder.output, 0)
        while (str(node) in self._history):
            node = self._generate(self._builder.output, 0)

        self._history.append(str(node))
        return node
