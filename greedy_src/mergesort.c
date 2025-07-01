#include "mergesort.h"
#include <stdlib.h>

void merge(struct_solution arr[], int start, int mid, int end, int ascending) {

    int left_len = mid - start + 1;
    int right_len = end - mid;

    struct_solution *left_copy = (struct_solution *)malloc(left_len * sizeof(struct_solution));
    for (int i = 0; i < left_len; i++)
        left_copy[i] = arr[start + i];

    struct_solution *right_copy = (struct_solution *)malloc(right_len * sizeof(struct_solution));
    for (int j = 0; j < right_len; j++)
        right_copy[j] = arr[mid + 1 + j];

    int i = 0, j = 0, k = start;

    while (i < left_len && j < right_len) {

        int comparison = ascending
                        ? (left_copy[i].value <= right_copy[j].value)
                        : (left_copy[i].value >= right_copy[j].value);
        if (comparison) {
            arr[k++] = left_copy[i++];
        } else {
            arr[k++] = right_copy[j++];
        }
    }

    while (i < left_len) arr[k++] = left_copy[i++];
    while (j < right_len) arr[k++] = right_copy[j++];

    free(left_copy);
    free(right_copy);
}

void mergesort(struct_solution arr[], int start, int end, int ascending) {

    if (start < end) {

        int mid = start + (end - start) / 2;

        mergesort(arr, start, mid, ascending);
        mergesort(arr, mid + 1, end, ascending);
        merge(arr, start, mid, end, ascending);
    }
}