#include <stdio.h>
#include <altera_avalon_fifo_util.h>
#include <sys/alt_irq.h>
#include <math.h>
#include <unistd.h>

#include "system.h"

int fifo_flag;
void fifo_isr(void* isr_context);

extern float var[];

int main()
{
	int i;
	int fifo_data_int[4];
	float fifo_data_float[4];
	float sum_data, x_data, y_data,x_ang,y_ang;
	float (*var_col)[6] = (float (*)[6])var;

	alt_ic_isr_register(FIFO_DATA_IN_IN_CSR_IRQ_INTERRUPT_CONTROLLER_ID,//中断控制器
							FIFO_DATA_IN_IN_CSR_IRQ,//中断序号
							fifo_isr,//终端服务函数
							NULL,//传给中断副函数的参数
							0x0);//保留
	altera_avalon_fifo_init(FIFO_DATA_IN_IN_CSR_BASE, ALTERA_AVALON_FIFO_IENABLE_AF_MSK, 1, 3);

	for (i=0; i<400; i++) {
		printf("A = %fV, B = %fV, C = %fV, D = %fV, x_ang = %f, y_ang = %f\n", \
				var_col[i][0], var_col[i][1], var_col[i][2], var_col[i][3], var_col[i][4], var_col[i][5]);
		usleep(50000);
	}

	while (1) {
		if (fifo_flag) {
			fifo_flag = 0;

			fifo_data_int[0] = altera_avalon_fifo_read_fifo(FIFO_DATA_IN_OUT_BASE, FIFO_DATA_IN_IN_CSR_BASE);
			fifo_data_int[1] = altera_avalon_fifo_read_fifo(FIFO_DATA_IN_OUT_BASE, FIFO_DATA_IN_IN_CSR_BASE);
			fifo_data_int[2] = altera_avalon_fifo_read_fifo(FIFO_DATA_IN_OUT_BASE, FIFO_DATA_IN_IN_CSR_BASE);
			fifo_data_int[3] = altera_avalon_fifo_read_fifo(FIFO_DATA_IN_OUT_BASE, FIFO_DATA_IN_IN_CSR_BASE);

			fifo_data_float[0] = (float)fifo_data_int[0];
			fifo_data_float[1] = (float)fifo_data_int[1];
			fifo_data_float[2] = (float)fifo_data_int[2];
			fifo_data_float[3] = (float)fifo_data_int[3];

			/* TODO process data */
			sum_data =fifo_data_float[0] + fifo_data_float[3] + fifo_data_float[1] + fifo_data_float[2];
			x_data = (fifo_data_float[0] + fifo_data_float[3] - fifo_data_float[1] - fifo_data_float[2]) / sum_data;
			y_data = (fifo_data_float[0] - fifo_data_float[3] + fifo_data_float[1] - fifo_data_float[2]) / sum_data;
			x_ang = atanf(x_data * M_PI / 180);
			y_ang = atanf(y_data * M_PI / 180);
			printf("x_data=%f, y_data=%f, x_ang=%f, y_ang=%f\n", x_data, y_data, x_ang, y_ang);
		}
	}

	return 0;
}

void fifo_isr(void* isr_context)
{
	fifo_flag = 1;
}
