from ctypes cimport complex as cComplex
from libcpp.string cimport string 
from libcpp cimport bool

cdef extern from "triangle.h":
  cdef void triangulate(char *triswitches, struct triangulateio *in,
                 struct triangulateio *out, struct triangulateio *vorout)