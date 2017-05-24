volatile int *camData = (int *) 0xaddresshere;
int xData = (*camData >> 16)&0x0000ffff;
int yData = *camData&0x0000ffff;
