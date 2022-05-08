#include "Fibinaci.h"

#include "cuda_runtime.h"
#include "device_launch_parameters.h"



__global__ void CalculateFibi(int n,int *seq)
{
	int t1 = 0, t2 = 1, nextTerm = 0;
	int i = threadIdx.x;

	for (int q = 0; q < i; q++) 
	{
		nextTerm = t1 + t2;
		t1 = t2;
		t2 = nextTerm;

	}
	
	
	
}
