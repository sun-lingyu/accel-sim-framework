// These are the configration parameters that can be found publicly
// Sources:
// https://www.nvidia.com/content/dam/en-zz/Solutions/geforce/ampere/pdf/NVIDIA-ampere-GA102-GPU-Architecture-Whitepaper-V1.pdf
// https://en.wikipedia.org/wiki/GeForce_30_series
// https://en.wikipedia.org/wiki/CUDA

#ifndef AMPERE_ORIN_HW_DEF_H
#define AMPERE_ORIN_HW_DEF_H

#include "./common/common.h"
#include "./common/deviceQuery.h"

#define L1_SIZE (192 * 1024) // Max L1 size in bytes

#define CLK_FREQUENCY 1300 // frequency in MHz

#define ISSUE_MODEL issue_model::single
#define CORE_MODEL core_model::subcore
#define DRAM_MODEL dram_model::LPDDR5
#define WARP_SCHEDS_PER_SM 4

// number of SASS HMMA per 16x16 PTX WMMA for FP16 - FP32 accumlate operation
// see slide 22 at
// https://developer.download.nvidia.com/video/gputechconf/gtc/2020/presentations/s21730-inside-the-nvidia-ampere-architecture.pdf
#define SASS_hmma_per_PTX_wmma 2

// These vars are almost constant between HW generation
// see slide 24 from Nvidia at
// https://developer.download.nvidia.com/video/gputechconf/gtc/2020/presentations/s21730-inside-the-nvidia-ampere-architecture.pdf
#define L2_BANKS_PER_MEM_CHANNEL 1
#define L2_BANK_WIDTH_in_BYTE 32

#endif