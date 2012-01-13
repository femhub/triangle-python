from ctypes cimport complex as cComplex
from libcpp.string cimport string 
from libcpp cimport bool

cdef extern from "triangle.h":
  struct triangulateio {
    REAL *pointlist;
    REAL *pointattributelist;
    int *pointmarkerlist;    
    int numberofpoints;      
    int numberofpointattributes;            

    int *trianglelist;                      
    REAL *triangleattributelist;            
    REAL *trianglearealist;                 
    int *neighborlist;                      
    int numberoftriangles;                  
    int numberofcorners;                    
    int numberoftriangleattributes;         

    int *segmentlist;                       
    int *segmentmarkerlist;                 
    int numberofsegments;                   

    REAL *holelist;                       
    int numberofholes;                    

    REAL *regionlist;                     
    int numberofregions;                  

    int *edgelist;                        
    int *edgemarkerlist;           
    REAL *normlist;                
    int numberofedges;             
  }
  cdef cppclass triangle:
    triangulate(char *triswitches, struct triangulateio *in,
                 struct triangulateio *out, struct triangulateio *vorout)