/*
 * circularBuffer.h
 *
 *  Created on: 2024年1月13日
 *      Author: wu
 */

#ifndef SRC_CIRCULARBUFFER_H_
#define SRC_CIRCULARBUFFER_H_

typedef struct {
    u32* arr;
    //arr下标
    int front;
    int rear;
    //可存放元素个数
    int capacity;


} Queue;

Queue* QueueCreate(int k);
bool QueueIsEmpty(Queue* obj);
bool QueueIsFull(Queue* obj);
bool QueueEnQueue(Queue* obj, u32 value);
bool QueueDeQueue(Queue* obj);
u32 QueueFront(Queue* obj);
u32 QueueRear(Queue* obj);
void QueueFree(Queue* obj);

#endif /* SRC_CIRCULARBUFFER_H_ */
