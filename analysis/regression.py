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
        
if __name__ == '__main__':
    unittest.main()
