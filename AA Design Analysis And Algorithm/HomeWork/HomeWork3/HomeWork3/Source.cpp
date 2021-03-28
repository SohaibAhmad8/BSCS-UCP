#include<iostream>
using namespace std;

int *Combine(int * arr1, int *arr2, int n, int m)
{
	int size = n + m;

	int *arr3 = new int[size];
	int i = 0, j = 0, k = 0;

	for (; k < size && i < n && j < m; k++)
	{
		if (arr1[i] < arr2[j])
		{
			arr3[k] = arr1[i];
			i++;
		}
		else
		{
			arr3[k] = arr2[j];
			j++;
		}

	}
	if (i == n)
	{
		for (; j < m; k++, j++)
			arr3[k] = arr2[j];
	}
	else if (j == m)
	{
		for (; i < n; k++, i++)
			arr3[k] = arr1[i];
	}
	return arr3;
}

void display(int *arr, int size)
{
	for (int i = 0; i < size; i++)
		cout << arr[i]<<" , ";
	cout << endl;
}

int main()
{
	const int n = 10, m = 12;
	int arr1[n] = { 1, 4, 6, 8, 9, 11, 15, 16, 67, 78 };
	int arr2[m] = { -13, -12, -1, 0, 2, 4, 7, 50, 70, 122, 123,200 };

	int *arr3 = Combine(arr1, arr2, n, m);

	display(arr3, n + m);

	return 0;
}