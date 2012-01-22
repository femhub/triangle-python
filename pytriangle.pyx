from libc.stdlib cimport malloc, free

cdef class PyTriangulateIO:
  def __cinit__(self, pointlist, pointattributelist, pointmarkerlist, numberofpoints, numberofpointattributes, trianglelist, triangleattributelist, trianglearealist, neighborlist, numberoftriangles, numberofcorners, numberoftriangleattributes, segmentlist, segmentmarkerlist, numberofsegments, holelist, numberofholes, regionlist, numberofregions, edgelist, edgemarkerlist, normlist, numberofedges):
    cdef double *cpointlist =<double*> malloc(len(pointlist)*sizeof(double))
    cdef double *cpointattributelist =<double*> malloc(len(pointattributelist)*sizeof(double))
    cdef int *cpointmarkerlist =<int*> malloc(len(pointmarkerlist)*sizeof(int))
    cdef int *ctrianglelist =<int*> malloc(len(trianglelist)*sizeof(int))
    cdef double *ctriangleattributelist =<double*> malloc(len(triangleattributelist)*sizeof(double))
    cdef double *ctrianglearealist =<double*> malloc(len(trianglearealist)*sizeof(double))
    cdef int *cneighborlist =<int*> malloc(len(neighborlist)*sizeof(int))
    cdef int *csegmentlist =<int*> malloc(len(segmentlist)*sizeof(int))
    cdef int *csegmentmarkerlist =<int*> malloc(len(segmentmarkerlist)*sizeof(int))
    cdef double *cholelist =<double*> malloc(len(holelist)*sizeof(double))
    cdef double *cregionlist =<double*> malloc(len(regionlist)*sizeof(double))
    cdef int *cedgelist =<int*> malloc(len(edgelist)*sizeof(int))
    cdef int *cedgemarkerlist =<int*> malloc(len(edgemarkerlist)*sizeof(int))
    cdef double *cnormlist =<double*> malloc(len(normlist)*sizeof(double))

    for m in range(len(pointlist)):
      cpointlist[m] = pointlist[m]

    for m in range(len(pointattributelist)):
      cpointattributelist[m] = pointattributelist[m]

    for m in range(len(pointmarkerlist)):
      cpointmarkerlist[m] = pointmarkerlist[m]

    for m in range(len(trianglelist)):
      ctrianglelist[m] = trianglelist[m]

    for m in range(len(triangleattributelist)):
      ctriangleattributelist[m] = triangleattributelist[m]

    for m in range(len(trianglearealist)):
      ctrianglearealist[m] = trianglearealist[m]

    for m in range(len(neighborlist)):
      cneighborlist[m] = neighborlist[m]

    for m in range(len(segmentlist)):
      csegmentlist[m] = segmentlist[m]

    for m in range(len(segmentmarkerlist)):
      csegmentmarkerlist[m] = segmentmarkerlist[m]

    for m in range(len(holelist)):
      cholelist[m] = holelist[m]

    for m in range(len(regionlist)):
      cregionlist[m] = regionlist[m]

    for m in range(len(edgelist)):
      cedgelist[m] = edgelist[m]

    for m in range(len(edgemarkerlist)):
      cedgemarkerlist[m] = edgemarkerlist[m]

    for m in range(len(normlist)):
      cnormlist[m] = normlist[m]
    
    self.thisptr.pointlist = cpointlist
    self.thisptr.pointattributelist = cpointattributelist
    self.thisptr.pointmarkerlist = cpointmarkerlist
    self.thisptr.numberofpoints = numberofpoints
    self.thisptr.numberofpointattributes = numberofpointattributes

    self.thisptr.trianglelist = ctrianglelist
    self.thisptr.triangleattributelist = ctriangleattributelist
    self.thisptr.trianglearealist = ctrianglearealist
    self.thisptr.neighborlist = cneighborlist
    self.thisptr.numberoftriangles = numberoftriangles
    self.thisptr.numberofcorners = numberofcorners
    self.thisptr.numberoftriangleattributes = numberoftriangleattributes

    self.thisptr.segmentlist = csegmentlist
    self.thisptr.segmentmarkerlist = csegmentmarkerlist
    self.thisptr.numberofsegments = numberofsegments
 
    self.thisptr.holelist = cholelist
    self.thisptr.numberofholes = numberofholes
 
    self.thisptr.regionlist = cregionlist
    self.thisptr.numberofregions = numberofregions
 
    self.thisptr.edgelist = cedgelist
    self.thisptr.edgemarkerlist = cedgemarkerlist
    self.thisptr.normlist = cnormlist
    self.thisptr.numberofedges = numberofedges
    
  def __dealloc__(self):
    free(self.thisptr.pointlist)
    free(self.thisptr.pointattributelist)
    free(self.thisptr.pointmarkerlist)

    free(self.thisptr.trianglelist)
    free(self.thisptr.triangleattributelist)
    free(self.thisptr.trianglearealist)
    free(self.thisptr.neighborlist)

    free(self.thisptr.segmentlist)
    free(self.thisptr.segmentmarkerlist)
 
    free(self.thisptr.holelist)
 
    free(self.thisptr.regionlist)

    free(self.thisptr.edgelist)
    free(self.thisptr.edgemarkerlist)
    free(self.thisptr.normlist)

def PyTriangulate(triswitches, in_, out_, vorout):
  triangulate(triswitches, <triangulateio*>in_.thisptr, <triangulateio*>out_.thisptr, <triangulateio*>vorout.thisptr)
