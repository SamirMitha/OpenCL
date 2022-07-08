
/* kernel.cl
 * Matrix multiplication: C = A * B.
 * Device code.
 */

 // OpenCL Kernel
__kernel void
conv3x3(int w,
    __global float* in,
    __global float* ck,
    __global float* out)
{
    int i, tx, ty, ty1, i3;
    float sum;
    int tx = get_global_id(0);
    int ty = get_global_id(1);
    sum = 0.0f;

    // value stores the element that is 
    // computed by the thread
    for (int i = 0; i < 3; ++i)
    {
        i3 = 3 * i;
        ty1 = w * (ty + i) + tx;
        sum += in[y1] * ck[i3];
        sum += in[y1 + 1] * ck[i3 + 1];
        sum += in[y1 + 2] * ck[i3 + 2];
    }

    // Write the matrix to device memory each 
    // thread writes one element
    out[ty * w + tx] = sum;
}
