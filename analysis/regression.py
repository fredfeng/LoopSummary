from analyze import analyze

import unittest
import os

testPath = os.path.join('.', 'tests')

class Regression(unittest.TestCase):

    def compare_refinement(self, R, r1, index, guard, written, read):
        self.assertEqual(r1[R.Typ.INDEX], index)
        self.assertEqual(r1[R.Typ.GUARD], guard)
        self.assertEqual(r1[R.Typ.WRITTEN], written)
        self.assertEqual(r1[R.Typ.READ], read)        

    def compare_dependencies(self, d1, d2):
        self.assertEqual(d1, d2)
        
    def test_t1(self):
        fname = os.path.join(testPath, 't1.sol')
        D, R = analyze(fname)
        self.compare_refinement(R, R.types, set(), set(), set(), set())
        self.compare_dependencies(D.dependencies, {})
        
    def test_t2(self):
        fname = os.path.join(testPath, 't2.sol')
        D, R = analyze(fname)
        self.compare_refinement(R, R.types, set(['i']), set(['i']),
                                set(['a', 'i']), set(['b', 'i']))
        self.compare_dependencies(D.dependencies, {'a': set(['b', 'i']),
                                                   'i': set(['i'])})
        
    def test_t3(self):
        fname = os.path.join(testPath, 't3.sol')
        D, R = analyze(fname)
        self.compare_refinement(R, R.types, set(['i']), set(['i']),
                                set(['a', 'i']), set(['a', 'i']))
        self.compare_dependencies(D.dependencies, {'a': set(['a', 'i']),
                                                   'i': set(['i'])})
        
    def test_t4(self):
        fname = os.path.join(testPath, 't4.sol')
        D, R = analyze(fname)
        self.compare_refinement(R, R.types, set(['i', 'c']), set(['i']),
                                set(['a', 'i']), set(['b', 'c', 'i']))
        self.compare_dependencies(D.dependencies, {'a': set(['b', 'c', 'i']),
                                                   'i': set(['i'])})
        
    def test_t5(self):
        fname = os.path.join(testPath, 't5.sol')
        D, R = analyze(fname)
        self.compare_refinement(R, R.types, set(['i']), set(['i']),
                                set(['s', 'i']), set(['a', 's', 'i']))
        self.compare_dependencies(D.dependencies, {'s': set(['s', 'a', 'i']),
                                                   'i': set(['i'])})
        
    def test_t6(self):
        fname = os.path.join(testPath, 't6.sol')
        D, R = analyze(fname)
        self.compare_refinement(R, R.types, set(['b', 'i']), set(['i']),
                                set(['a', 'i']), set(['b', 'i', 'c']))
        self.compare_dependencies(D.dependencies, {'a': set(['c']),
                                                   'i': set(['i'])})
        
    def test_t7(self):
        fname = os.path.join(testPath, 't7.sol')
        D, R = analyze(fname)
        self.compare_refinement(R, R.types, set(['i']), set(['i']),
                                set(['a', 'i']), set(['i', 'c']))
        self.compare_dependencies(D.dependencies, {'a': set(['c']),
                                                   'i': set(['i'])})
        
    def test_t8(self):
        fname = os.path.join(testPath, 't8.sol')
        D, R = analyze(fname)
        self.compare_refinement(R, R.types, set(['i']), set(['i']),
                                set(['a', 'i']), set(['a', 'i', 'c']))
        self.compare_dependencies(D.dependencies, {'a': set(['c', 'a', 'i']),
                                                   'i': set(['i'])})
        
    def test_t9(self):
        fname = os.path.join(testPath, 't9.sol')
        D, R = analyze(fname)
        self.compare_refinement(R, R.types, set(['i']), set(['i']),
                                set(['a', 'i']), set(['a', 'b', 'i']))
        self.compare_dependencies(D.dependencies, {'a': set(['b', 'a', 'i']),
                                                   'i': set(['i'])})
        
    def test_t10(self):
        fname = os.path.join(testPath, 't10.sol')
        D, R = analyze(fname)
        self.compare_refinement(R, R.types, set(['i']), set(['i']),
                                set(['a', 'b', 'i']), set(['b', 'c', 'i']))
        self.compare_dependencies(D.dependencies, {'a': set(['b', 'i']),
                                                   'b': set(['c', 'i']),
                                                   'i': set(['i'])})
        
    def test_t11(self):
        fname = os.path.join(testPath, 't11.sol')
        D, R = analyze(fname)
        self.compare_refinement(R, R.types, set(['i']), set(['i']),
                                set(['a', 'b', 'i']), set(['b', 'c', 'i']))
        self.compare_dependencies(D.dependencies, {'a': set(['b', 'c', 'i']),
                                                   'b': set(['c', 'i']),
                                                   'i': set(['i'])})
        
    def test_t12(self):
        fname = os.path.join(testPath, 't12.sol')
        D, R = analyze(fname)
        self.compare_refinement(R, R.types, set(['i']), set(['i']),
                                set(['a', 'c', 'i']), set(['b', 'a', 'i']))
        self.compare_dependencies(D.dependencies, {'a': set(['b', 'i']),
                                                   'c': set(['a', 'b', 'i']),
                                                   'i': set(['i'])})
        
if __name__ == '__main__':
    unittest.main()
