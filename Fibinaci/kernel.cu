
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <stdio.h>
#include<iostream>
__global__ void CalculateFibi(long long n, long long *seq)
{
	long long t1 = 0, t2 = 1, nextTerm = 0;
	int i = threadIdx.x;

		for (long q = 0; q < i; q++)
		{

			nextTerm = t1 + t2;
			t1 = t2;
			t2 = nextTerm;

		}
		seq[i] = nextTerm;
	



}

int main()
{
	long long* seq;

	

	int n;
	std::cout << "Enter the number of terms: ";
	std::cin >> n;


	cudaMallocManaged(&seq, n*sizeof(long long));
	for (long i = 0; i < n; i++) {
		seq[i] = 0;
	}

	CalculateFibi<<<1,256>>>(n,seq);
	cudaDeviceSynchronize();
	

	
	std::cout << "Fibonacci Series: ";
	for (int i = 0; i < n; i++)
		printf("Seq[%d] = %d\n", i, seq[i]);


	cudaFree(seq);

	
	
 
}

